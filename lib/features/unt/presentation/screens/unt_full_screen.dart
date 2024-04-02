import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/utils/toasters.dart';
import 'package:iu/core/widgets/header_title.dart';
import 'package:iu/features/auth/presentation/bloc/auth_bloc.dart';

import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/elevated_button_common.dart';
import '../bloc/unt_bloc.dart';

class UntFullScreen extends StatefulWidget {
  const UntFullScreen({super.key});

  @override
  State<UntFullScreen> createState() => _UntFullScreenState();
}

class _UntFullScreenState extends State<UntFullScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UntBloc>().add(UntGetSubjectsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UntBloc, UntState>(
        listener: (context, state) {
          if (state is UntFailedState) {
            AppToaster.showError(state.failureData.message ?? "Error");
          }
        },
        builder: (context, state) {
          if (state is UntLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UntSubjectLoadedState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Column(

                  children: [

                    HeaderTitle(title: "Выберите 2 предмета для сдачи",fontSize: 16.sp,),
                    SizedBox(height: 20.h),
                    CarouselSlider.builder(
                      itemCount: state.subjects.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                          Column(
                        children: [
                          Container(
                            height: 180.h,
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15.w),
                                    topRight: Radius.circular(15.w),
                                    bottomLeft: Radius.circular(0),
                                    bottomRight: Radius.circular(0)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: getImageProviderFromServer(
                                        state.subjects[itemIndex].image?.url))),
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment(0, 0.8),
                                    child: ElevatedCommonButton(
                                      width: 100.w,
                                      color: ColorConstant.violetFirst,
                                      height: 30.h,
                                      borderRadius: 25.w,
                                      vertical: 0,
                                      horizontal: 0,
                                      onPressed: () {},
                                      child: RichText(
                                        text: TextSpan(children: [
                                          TextSpan(text: "Выбрать")
                                        ]),
                                      ),
                                    ))
                              ],
                            ),
                          ),
                          Container(
                            height: 50.h,
                            margin: EdgeInsets.symmetric(horizontal: 10.w),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: ColorConstant.violetToPinkGradient),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0),
                                  bottomLeft: Radius.circular(15.w),
                                  bottomRight: Radius.circular(15.w)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.subjects[itemIndex].title_ru,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18.sp),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      options: CarouselOptions(
                        height: 230.h,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return SizedBox();
        },
      ),
    );
  }
}
