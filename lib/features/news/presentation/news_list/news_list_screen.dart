import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/news/presentation/news_list/bloc/news_list/news_list_bloc.dart';

import '../../../../core/services/image_service.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
          child: Column(
            children: [
              _getImportantNews(),
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
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
                constraints: BoxConstraints(minHeight: 320.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  image: DecorationImage(
                    image: NetworkImage(
                        getImageFromString(state.importantNews.image?.url)),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(
                          0.5), // Adjust the opacity to control the darkness
                      BlendMode.darken,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Text(
                            state.importantNews.title,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            state.importantNews.subtitle,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Container(
                      height: 60.h,
                      width: 60.h,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.h)),
                      child: Center(
                        child: Icon(
                          FontAwesomeIcons.play,
                          color: ColorConstant.violetFirst,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        });
  }

  // Widget _getAllNews() {
  //   return BlocConsumer<NewsListBloc, NewsListState>(
  //     listener: (context, state) {},
  //     builder: (context, state) {
  //       if (state is NewsListLoadingState) {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //       if (state is NewsListSuccessState) {
  //         return Column(
  //           children: state.news.map(
  //                   (newsItem) => Card(
  //                     child: Row(
  //                       children: [
  //                         Expanded(child: )
  //                       ],
  //                     ),
  //                   )
  //           ),
  //         );
  //       }
  //       return SizedBox();
  //     },
  //   );
  // }
}
