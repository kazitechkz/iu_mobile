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

import 'bloc/unt_full_bloc.dart';

class UntFullScreen extends StatefulWidget {
  const UntFullScreen({super.key});

  @override
  State<UntFullScreen> createState() => _UntFullScreenState();
}

class _UntFullScreenState extends State<UntFullScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UntFullBloc>().add(UntFullGetSubjectsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<UntFullBloc, UntFullState>(
          listener: (context, state) {
            if (state is UntFullFailedState) {
              AppToaster.showError(state.failureData.message ?? "Error");
            }
            if (state is UntFullAttemptCreatedState) {
              AppToaster.showSuccess("Тест успешно создан");
              context
                  .go('/${RouteConstant.passAttemptById}/${state.attemptId}');
            }
          },
          builder: (context, state) {
            if (state is UntFullLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is UntFullSubjectLoadedState) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 15.w),
                child: Column(
                  children: [
                    Expanded(
                        flex: 14,
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            Container(
                              decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment(0.8, 1),
                                    colors: ColorConstant.violetToPinkGradient,
                                  ),
                                  borderRadius: BorderRadius.circular(20.w)),
                              width: 320.w,
                              height: 220.h,
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Сдать полный тест",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Icon(
                                            FontAwesomeIcons.book,
                                            color: Colors.white,
                                            size: 16.sp,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "3 основных дисциплины и 2 на выбор",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.sp),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
                                          child: Icon(
                                            FontAwesomeIcons.clock,
                                            color: Colors.white,
                                            size: 16.sp,
                                          ),
                                        ),
                                        Flexible(
                                          child: Text(
                                            "На выполнение дается 210 минут",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16.sp),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 15),
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
                                                color: Colors.white,
                                                fontSize: 16.sp),
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
                                value: state.parameter?.locale_id == 1
                                    ? true
                                    : false,
                                textOn: 'Казахский',
                                textOff: 'Русский',
                                iconOn: Icons.done,
                                iconOff: Icons.done,
                                textOnColor: Colors.white,
                                textOffColor: Colors.white,
                                colorOn: ColorConstant.lightPink,
                                colorOff: ColorConstant.lightViolet,
                                textSize: 16.0,
                                onChanged: (bool state) {
                                  context.read<UntFullBloc>().add(
                                      UntFullUpdateLocaleIdEvent(
                                          state ? 1 : 2));
                                },
                                onTap: () {},
                                onDoubleTap: () {},
                                onSwipe: () {},
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        )),
                    Expanded(
                      flex: 12,
                      child: CustomScrollView(
                        slivers: <Widget>[
                          SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                  (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (state.subjects[index].is_compulsory !=
                                        1) {
                                      List<int> newValue = List<int>.from(
                                          state.parameter?.subjects ?? []);
                                      if (newValue
                                          .contains(state.subjects[index].id)) {
                                        newValue
                                            .remove(state.subjects[index].id);
                                      } else {
                                        if (newValue.length >= 2) {
                                          newValue[0] = newValue[1];
                                          newValue[1] =
                                              state.subjects[index].id;
                                        } else {
                                          newValue
                                              .add(state.subjects[index].id);
                                        }
                                      }
                                      context.read<UntFullBloc>().add(
                                          UntFullAddSubjectsEvent(newValue));
                                    }
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: getImageProviderFromServer(
                                              state
                                                  .subjects[index].image?.url)),
                                    ),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          right: 10,
                                          top: 5,
                                          child: (state.parameter?.subjects
                                                          .contains(state
                                                              .subjects[index]
                                                              .id) ==
                                                      true ||
                                                  state.subjects[index]
                                                          .is_compulsory ==
                                                      1
                                              ? const Icon(
                                                  FontAwesomeIcons.circleCheck,
                                                  color:
                                                      Colors.lightGreenAccent)
                                              : SizedBox()),
                                        ),
                                        Positioned(
                                            bottom: 20,
                                            child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 2.h,
                                                    horizontal: 2.w),
                                                width: 120.w,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  gradient:
                                                      const LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment(0.8, 1),
                                                    colors: ColorConstant
                                                        .violetToPinkGradient,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    textAlign: TextAlign.center,
                                                    state.subjects[index]
                                                        .title_ru,
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
                      ),
                    ),
                  ],
                ),
              );
            }

            return SizedBox();
          },
        ),
        floatingActionButton: BlocBuilder<UntFullBloc, UntFullState>(
          builder: (context, state) {
            if (state is UntFullSubjectLoadedState) {
              if (state.parameter?.subjects.length == 2 &&
                  state.parameter?.locale_id != null &&
                  state.parameter?.attempt_type_id == 1) {
                return FloatingActionButton.extended(
                  backgroundColor: ColorConstant.lightViolet,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  onPressed: () {
                    context.read<UntFullBloc>().add(UntFullCreateAttemptEvent(
                        CreateAttemptParameter(
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
