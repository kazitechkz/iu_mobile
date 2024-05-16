import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/utils/toasters.dart';
import 'package:iu/features/attempt/domain/parameters/create_attempt_parameter.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/services/image_service.dart';

import '../../../../core/widgets/common_app_bar_widget.dart';
import 'bloc/unt_Single_bloc.dart';
import 'bloc/unt_single_event.dart';
import 'bloc/unt_single_state.dart';

class UntSingleScreen extends StatefulWidget {
  const UntSingleScreen({super.key});

  @override
  State<UntSingleScreen> createState() => _UntSingleScreenState();
}

class _UntSingleScreenState extends State<UntSingleScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UntSingleBloc>().add(UntSingleGetSubjectsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CommonAppBarWidget(
          text: "Тренажер ЕНТ",
          imageUrl: "assets/images/icons/training.webp",
          routeLink: RouteConstant.untModeScreenName,
        ),
        body: BlocConsumer<UntSingleBloc, UntSingleState>(
          listener: (context, state) {
            if (state is UntSingleFailedState) {
              AppToaster.showError(state.failureData.message ?? "Error");
            }
            if (state is UntSingleAttemptCreatedState) {
              AppToaster.showSuccess("Тест успешно создан");
              context
                  .go('/${RouteConstant.passAttemptById}/${state.attemptId}');
            }
          },
          builder: (context, state) {
            if (state is UntSingleLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UntSingleSubjectLoadedState) {
              return CustomScrollView(
                slivers: <Widget>[
                  SliverToBoxAdapter(
                      child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      Container(
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(0.8, 1),
                              colors: [
                                ColorConstant.bottomBarColor,
                                ColorConstant.darkOrangeColor
                              ],
                            ),
                            borderRadius: BorderRadius.circular(20.w)),
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Сдать тест по 1 предмету",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Icon(
                                      FontAwesomeIcons.book,
                                      color: Colors.white,
                                      size: 16.sp,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "1 предмет на выбор",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.sp),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Icon(
                                      FontAwesomeIcons.clock,
                                      color: Colors.white,
                                      size: 16.sp,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "На выполнение дается строго отведенное время",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.sp),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15),
                                    child: Icon(
                                      FontAwesomeIcons.language,
                                      color: Colors.white,
                                      size: 16.sp,
                                    ),
                                  ),
                                  Flexible(
                                    child: Text(
                                      "Выбор казахского и русского языка",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16.sp),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        )),
                      ),
                      SizedBox(height: 20.h),
                      Center(
                        child: LiteRollingSwitch(
                          width: 130.w,
                          value: state.parameter?.locale_id == 1 ? true : false,
                          textOn: 'Казахский',
                          textOff: 'Русский',
                          iconOn: Icons.done,
                          iconOff: Icons.done,
                          textOnColor: Colors.white,
                          textOffColor: Colors.white,
                          colorOn: ColorConstant.darkOrangeColor,
                          colorOff: ColorConstant.bottomBarColor,
                          textSize: 12.0,
                          onChanged: (bool state) {
                            context.read<UntSingleBloc>().add(
                                UntSingleUpdateLocaleIdEvent(state ? 1 : 2));
                          },
                          onTap: () {},
                          onDoubleTap: () {},
                          onSwipe: () {},
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  )),
                  SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            List<int> newValue =
                                List<int>.from(state.parameter?.subjects ?? []);
                            if (newValue.contains(state.subjects[index].id)) {
                              newValue.remove(state.subjects[index].id);
                            } else {
                              if (newValue.length >= 1) {
                                newValue[0] = state.subjects[index].id;
                              } else {
                                newValue.add(state.subjects[index].id);
                              }
                            }
                            context
                                .read<UntSingleBloc>()
                                .add(UntSingleAddSubjectsEvent(newValue));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: getImageProviderFromServer(
                                      state.subjects[index].image?.url)),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Positioned(
                                  right: 10,
                                  top: 5,
                                  child: (state.parameter?.subjects.contains(
                                              state.subjects[index].id) ==
                                          true
                                      ? const Icon(FontAwesomeIcons.circleCheck,
                                          color: Colors.lightGreenAccent)
                                      : SizedBox()),
                                ),
                                Positioned(
                                    bottom: 20,
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 2.w),
                                        width: 120.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment(0.8, 1),
                                            colors: ColorConstant
                                                .violetToPinkGradient,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            state.subjects[index].title_ru,
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ))),
                              ],
                            ),
                          ),
                        );
                      }, childCount: state.subjects.length),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 180,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ))
                ],
              );
            }

            return SizedBox();
          },
        ),
        floatingActionButton: BlocBuilder<UntSingleBloc, UntSingleState>(
          builder: (context, state) {
            if (state is UntSingleSubjectLoadedState) {
              if (state.parameter?.subjects.length == 1 &&
                  state.parameter?.locale_id != null &&
                  state.parameter?.attempt_type_id == 2) {
                return FloatingActionButton.extended(
                  backgroundColor: ColorConstant.darkOrangeColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  onPressed: () {
                    context.read<UntSingleBloc>().add(
                        UntSingleCreateAttemptEvent(CreateAttemptParameter(
                            subjects: state.parameter!.subjects,
                            locale_id: state.parameter!.locale_id,
                            attempt_type_id:
                                state.parameter!.attempt_type_id)));
                  },
                  label: const Row(
                    children: [
                      Text(
                        "Начать сдачу",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        FontAwesomeIcons.chevronRight,
                        color: Colors.white,
                      )
                    ],
                  ),
                );
              }
            }
            return Container();
          },
        ));
  }
}
