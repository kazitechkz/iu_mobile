import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/career/presentation/career_subscriptions/widgets/career_subscription_card_widget.dart';
import 'package:iu/features/career/presentation/career_subscriptions/widgets/career_subscription_list_widget.dart';

import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import 'bloc/career_subscriptions_bloc.dart';

class CareerSubscriptionsScreen extends StatefulWidget {
  const CareerSubscriptionsScreen({super.key});

  @override
  State<CareerSubscriptionsScreen> createState() =>
      _CareerSubscriptionsScreenState();
}

class _CareerSubscriptionsScreenState extends State<CareerSubscriptionsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CareerSubscriptionsBloc>().add(GetCareerQuizGroupListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Карьера",
        imageUrl: "assets/images/icons/career.webp",
        routeLink: RouteConstant.careerQuizzesListName,
      ),
      body: BlocConsumer<CareerSubscriptionsBloc, CareerSubscriptionsState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          if (state is CareerSubscriptionsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CareerSubscriptionsSuccessState) {
            final careerQuizGroup = state.careerQuizGroupListEntity.group[0];
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                decoration: BoxDecoration(
                    color: ColorConstant.appBarColor,
                    borderRadius: BorderRadius.circular(15.w),
                    border: Border.all(color: ColorConstant.peachColor)),
                child: Column(
                  children: [
                    RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                            text:
                                "Приобретай группу профориентационных тестов от: ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "${careerQuizGroup.titleRu}",
                            style: TextStyle(
                                color: ColorConstant.peachColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ])),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 62,
                      child: Stack(
                        children: [
                          ...careerQuizGroup.careerQuizAuthors!
                              .asMap()
                              .entries
                              .map((entry) {
                            int index = entry.key;
                            var author = entry.value;
                            return Positioned(
                              left: 48 * index.toDouble(),
                              child: GFAvatar(
                                backgroundImage: CachedNetworkImageProvider(
                                    getImageFromString(author.file?.url)),
                                shape: GFAvatarShape.circle,
                                radius: 32,
                              ),
                            );
                          }).toList()
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    GFAccordion(
                        collapsedTitleBackgroundColor: ColorConstant.peachColor,
                        expandedTitleBackgroundColor: ColorConstant.peachColor,
                        contentBackgroundColor: ColorConstant.peachColor,
                        titlePadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        margin: EdgeInsets.zero,
                        titleBorderRadius: BorderRadius.circular(10.w),
                        contentBorderRadius: BorderRadius.circular(10.w),
                        titleChild: Text(
                          "${careerQuizGroup.titleRu}",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                        contentChild:
                            Html(data: careerQuizGroup.descriptionRu, style: {
                          "p": Style(
                            color: Colors.white,
                            fontSize: FontSize(12),
                          )
                        }),
                        collapsedIcon: Icon(
                          FontAwesomeIcons.chevronDown,
                          color: Colors.white,
                          size: 12.sp,
                        ),
                        expandedIcon: Icon(
                          FontAwesomeIcons.chevronUp,
                          color: Colors.white,
                          size: 12.sp,
                        )),
                    SizedBox(
                      height: 20.h,
                    ),
                    AutoSizeText(
                      "Приобретайте всего за ${careerQuizGroup.price} KZT вместо ${careerQuizGroup.oldPrice} KZT",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 8.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.w),
                          color: ColorConstant.peachColor,
                          border: Border.all(color: Colors.white)
                      ),
                      child: AutoSizeText(
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        "Приобрести всего за ${careerQuizGroup.price} KZT",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    AutoSizeText(
                      "Приобретая группу вы приобретаете следующие тесты: ",
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ...?careerQuizGroup.careerQuizzes?.map((careerQuiz) => CareerSubscriptionListItemWidget(careerQuizEntity: careerQuiz)).toList(),
                    SizedBox(
                      height: 20.h,
                    ),
                    AutoSizeText(
                      "Или приобретите тесты отдельно: ",
                      maxLines: 2,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    ...?careerQuizGroup.careerQuizzes?.map((careerQuiz) => CareerSubscriptionCardWidget(careerQuizEntity: careerQuiz)).toList(),

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
