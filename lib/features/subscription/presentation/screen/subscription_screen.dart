import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/core/utils/freedom_utils.dart';
import 'package:iu/core/widgets/common_app_bar_widget.dart';
import 'package:iu/features/subscription/domain/entities/subscription_entity.dart';
import 'package:iu/features/subscription/domain/parameters/paybox_parameters.dart';
import 'package:iu/features/subscription/presentation/bloc/init_pay/init_pay_bloc.dart';
import 'package:iu/features/subscription/presentation/bloc/local_subject/local_subject_bloc.dart';
import 'package:iu/features/subscription/presentation/bloc/subscription_bloc.dart';
import 'package:iu/features/subscription/presentation/widgets/webview_init_widget.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../widgets/local_subject_widget.dart';
import '../widgets/subscription_widgets.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  void initState() {
    super.initState();
    context.read<SubscriptionBloc>().add(GetSubscriptionsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        routeLink: RouteConstant.dashboardScreenName,
        text: 'Подписки',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<SubscriptionBloc, SubscriptionState>(
            builder: (context, state) {
              if (state is SubscriptionLoaded) {
                return Column(
                  children: [
                    Image.asset('assets/images/subs_header.webp'),
                    const SizedBox(height: 10),
                    const Text(
                      'Купить доступ',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text(
                            'Работа над ошибками, подсказки и решения',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text(
                            'Анализ слабых мест',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text(
                            'Полная статистика',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.check, color: Colors.white),
                          title: Text(
                            'Неограниченный доступ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: state.subs
                          .map((sub) => GestureDetector(
                                onTap: () => context.read<SubscriptionBloc>().add(SelectSubscriptionEvent(sub.period)),
                                child: SubscriptionOption(
                                    price: sub.price,
                                    period: sub.titleRu,
                                    isSelected: sub.isSelected),
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        int period = state.subs.where((element) => element.isSelected).first.period;
                        context.read<LocalSubjectBloc>().add(GetLocalSubjectsEvent());
                        showModalBottomSheet(
                            backgroundColor: ColorConstant.backgroundColor,
                            context: context,
                            builder: (builder) {
                              return MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(value: context.read<LocalSubjectBloc>()),
                                    BlocProvider.value(value: context.read<InitPayBloc>())
                                  ],
                                  child: BlocConsumer<LocalSubjectBloc,
                                      LocalSubjectState>(
                                    builder: (context, state) {
                                      if (state is LocalSubjectLoaded) {
                                        return FractionallySizedBox(
                                            widthFactor: 1,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 15, vertical: 10.0),
                                              child: Column(
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.all(16.0),
                                                    child: Text(
                                                      'Выберите предметы',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: GridView.builder(
                                                      gridDelegate:
                                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        childAspectRatio: 1,
                                                        crossAxisSpacing: 8.0,
                                                        mainAxisSpacing: 8.0,
                                                      ),
                                                      itemCount: state.subjects.length,
                                                      itemBuilder:
                                                          (context, index) {
                                                        return GestureDetector(
                                                          onTap: () {
                                                            context.read<LocalSubjectBloc>().add(GetSelectedLocalSubjectsEvent(period, state.subjects, state.subjects[index].id));
                                                          },
                                                          child: GridCard(
                                                            image: state.subjects[index].imageUrl,
                                                            text: state.subjects[index].titleKk,
                                                            isSelected: state.subjects[index].isSelected,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  if ((state.subjects.where((element) => element.isSelected).toList()).length == 2)
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.all(5.0),
                                                      child: ElevatedButton(
                                                          onPressed: () {
                                                            List<LocalSubjectEntity> subjects = state.subjects.where((element) => element.isSelected).toList();
                                                            PayBoxRequest params = PayBoxRequest(subjects[0].id, subjects[1].id, subjects[0].period);
                                                            context.read<InitPayBloc>().add(GetInitPayResultEvent(params));
                                                          },
                                                          style: ElevatedButton.styleFrom(
                                                            backgroundColor: ColorConstant.orangeColor,
                                                            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                                                            textStyle: const TextStyle(fontSize: 20),
                                                          ),
                                                          child: BlocConsumer<InitPayBloc, InitPayState>(
                                                            listener: (context, state) {
                                                              if (state is GetInitPayResultLoaded) {
                                                                if (state.payBoxEntity.pgStatus == 'ok') {
                                                                  context.goNamed(RouteConstant.paymentName, pathParameters: {'redirectUrl': state.payBoxEntity.pgRedirectUrl});
                                                                }
                                                              }
                                                            },
                                                            builder: (context, state) {
                                                              if (state is GetInitPayLoading) {
                                                                return const Center(child: CircularProgressIndicator());
                                                              }
                                                              return const Text(
                                                                'Продолжить',
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              );
                                                            },
                                                          )),
                                                    )
                                                ],
                                              ),
                                            ));
                                      }
                                      return const GFLoader(
                                        type: GFLoaderType.ios,
                                      );
                                    },
                                    listener: (BuildContext context,
                                        LocalSubjectState state) {
                                      if (state
                                      is GetSelectedLocalSubjectsError) {
                                        GFToast.showToast(
                                            'Можно выбрать только два предмета',
                                            context,
                                            toastPosition: GFToastPosition.BOTTOM,
                                            textStyle: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                            backgroundColor: Colors.black);
                                      }
                                    },
                                  )
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstant.orangeColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 100, vertical: 20),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      child: const Text(
                        'Продолжить',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text('Terms of use',
                              style: TextStyle(color: Colors.white)),
                        ),
                        const Text(' | '),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Privacy Policy',
                              style: TextStyle(color: Colors.white)),
                        ),
                        const Text(' | '),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Restore',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    )
                  ],
                );
              }
              return const GFLoader(type: GFLoaderType.ios);
            },
          ),
        ),
      ),
    );
  }
}
