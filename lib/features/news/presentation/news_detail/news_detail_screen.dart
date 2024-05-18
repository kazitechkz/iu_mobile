import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:iu/features/news/presentation/news_detail/bloc/news_detail_bloc.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';

class NewsDetailScreen extends StatefulWidget {
  const NewsDetailScreen({super.key, required this.alias});
  final String alias;
  @override
  State<NewsDetailScreen> createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsDetailBloc>().add(NewsDetailByAliasEvent(widget.alias));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Новости",
        imageUrl: "assets/images/icons/news.webp",
        routeLink: RouteConstant.newsListName,
      ),
      body: BlocConsumer<NewsDetailBloc, NewsDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is NewsDetailLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsDetailSuccessState) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
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
                child: Column(
                  children: [
                    Container(
                        height: 320.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.w),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                                getImageFromString(
                                    state.newsEntity.image?.url)),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(
                                  0.6), // Adjust the opacity to control the darkness
                              BlendMode.darken,
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      state.newsEntity.title,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 22.sp),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      state.newsEntity.subtitle,
                      textAlign: TextAlign.start,
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
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
                                  text: "${state.newsEntity.user?.name}",
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.white)),
                            ],
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 5.0.w),
                                  child: const Icon(
                                    FontAwesomeIcons.clock,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              TextSpan(
                                  text:
                                      "${DateFormat("HH:mm dd/MM/yyyy").format(DateTime.parse(state.newsEntity.createdAt ?? DateTime.now().toString()))}",
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.white)),
                            ],
                          ),
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
                    Html(data: state.newsEntity.description)
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
