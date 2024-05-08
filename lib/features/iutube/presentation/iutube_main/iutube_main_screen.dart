import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/widgets/youtube_card.dart';
import 'package:iu/features/iutube/presentation/iutube_main/bloc/iutube_main_bloc.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../domain/entities/iutube_video_entity.dart';

class IutubeMainScreen extends StatefulWidget {
  const IutubeMainScreen({super.key});

  @override
  State<IutubeMainScreen> createState() => _IutubeMainScreenState();
}

class _IutubeMainScreenState extends State<IutubeMainScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<IutubeMainBloc>().add(IutubeMainAllEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<IutubeMainBloc, IutubeMainState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is IutubeMainLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is IutubeMainSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.fire,
                          color: Colors.redAccent,
                          size: 22.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Рекомендуем",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ...(_getVideos(state.getMainVideosEntity.recommended)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.play,
                          color: Colors.redAccent,
                          size: 22.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Вам также будет интересно",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ...(_getVideos(state.getMainVideosEntity.publicVideos)),
                    SizedBox(
                      height: 15.h,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(50.w),
                          onTap: () {
                            context.go("/${RouteConstant.iutubeListName}");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50.w),
                              gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: ColorConstant.violetToPinkGradient,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: ColorConstant.lightViolet,
                                  offset: Offset(0.0, 1.0), //(x,y)
                                  blurRadius: 8.0,
                                )
                              ],
                            ),
                            height: 60.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  FontAwesomeIcons.play,
                                  size: 20.sp,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                Text(
                                  "Посмотреть все видео",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
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

  List<Widget> _getVideos(List<IUTubeVideoEntity> videos) {
    return videos
        .map((recomendedVideo) => YoutubeCardWidget(video: recomendedVideo))
        .toList();
  }
}
