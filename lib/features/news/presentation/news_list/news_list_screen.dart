import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/str_helper.dart';
import 'package:iu/features/news/presentation/news_list/bloc/news_list/news_list_bloc.dart';

import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/parameters/all_news_parameter.dart';
import 'bloc/important_news/important_news_bloc.dart';

class NewsListScreen extends StatefulWidget {
  const NewsListScreen({super.key});

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ImportantNewsBloc>().add(ImportantNewsGetEvent());
    context
        .read<NewsListBloc>()
        .add((NewsListGetEvent(AllNewsParameter(page: 1))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Новости",
        imageUrl: "assets/images/icons/news.webp",
        routeLink: RouteConstant.dashboardScreenName,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
          child: Column(
            children: [
              _getImportantNews(),
              SizedBox(
                height: 20.h,
              ),
              _getAllNews(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getImportantNews() {
    return BlocConsumer<ImportantNewsBloc, ImportantNewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ImportantNewsLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is ImportantNewsSuccessState) {
            return InkWell(
              onTap: () {
                context.go(
                    "/${RouteConstant.newsDetailName}/${state.importantNews.id.toString()}");
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        ColorConstant.violetColor,
                        ColorConstant.appBarColor
                      ]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(minHeight: 240.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          image: DecorationImage(
                            image: NetworkImage(getImageFromString(
                                state.importantNews.image?.url)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.importantNews.title,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 22.sp),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              state.importantNews.subtitle,
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 14.sp),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 15.h),
                              child: Divider(
                                height: 2.h,
                                color: Colors.white,
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      const WidgetSpan(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 5.0),
                                          child: Icon(
                                            FontAwesomeIcons.user,
                                            size: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                          text:
                                              "${state.importantNews.user?.name}",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Padding(
                                          padding:
                                              EdgeInsets.only(right: 5.0.w),
                                          child: const Icon(
                                            FontAwesomeIcons.clock,
                                            size: 14,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                          text:
                                              "${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(state.importantNews.createdAt ?? DateTime.now().toString()))}",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white)),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return SizedBox();
        });
  }

  Widget _getAllNews() {
    return BlocConsumer<NewsListBloc, NewsListState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is NewsListLoadingState) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is NewsListSuccessState) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: state.news
                .map((newsItem) => InkWell(
                      onTap: () {
                        context.go(
                            "/${RouteConstant.newsDetailName}/${newsItem.id.toString()}");
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 5.w),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                ColorConstant.violetColor,
                                ColorConstant.appBarColor
                              ]),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 15.h),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        AutoSizeText(
                                          maxLines: 3,
                                          StrHelper.truncateWithEllipsis(
                                              100, newsItem.title),
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.sp),
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                        child: getImageFromServer(
                                            newsItem.image?.url)),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.h),
                                child: Divider(
                                  height: 2.h,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        const WidgetSpan(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 5.0),
                                            child: Icon(
                                              FontAwesomeIcons.user,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                            text: "${newsItem.user?.name}",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 5.0.w),
                                            child: const Icon(
                                              FontAwesomeIcons.clock,
                                              size: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                            text:
                                                "${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(newsItem.createdAt ?? DateTime.now().toString()))}",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ))
                .toList(),
          );
        }
        return SizedBox();
      },
    );
  }
}
