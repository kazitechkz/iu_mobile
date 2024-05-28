import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../../../core/widgets/youtube_card.dart';
import '../../domain/entities/iutube_video_entity.dart';
import '../../domain/parameters/get_all_videos_parameter.dart';
import '../../domain/parameters/get_video_detail_parameter.dart';
import 'bloc/iutube_detail_bloc.dart';

class IutubeDetailScreen extends StatefulWidget {
  const IutubeDetailScreen({super.key, required this.alias});
  final String alias;
  @override
  State<IutubeDetailScreen> createState() => _IutubeDetailScreenState();
}

class _IutubeDetailScreenState extends State<IutubeDetailScreen> {
  YoutubePlayerController? youtubeController = null;
  @override
  void initState() {
    super.initState();
    context.read<IutubeDetailBloc>().add(
        IutubeDetailByAliasEvent(GetVideoDetailParameter(alias: widget.alias)));
  }
  @override
  void didUpdateWidget(covariant IutubeDetailScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if(oldWidget.alias != widget.alias){
      context.read<IutubeDetailBloc>().add(
          IutubeDetailByAliasEvent(GetVideoDetailParameter(alias: widget.alias)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "IUTube",
        imageUrl: "assets/images/icons/iutube.webp",
        routeLink: RouteConstant.iutubeMainName,
      ),
      body: BlocConsumer<IutubeDetailBloc, IutubeDetailState>(
        listener: (context, state) {
          if(state is IutubeDetailSuccessState){
            youtubeController = YoutubePlayerController(
                initialVideoId: YoutubePlayer.convertUrlToId(state.getVideoDetailEntity.video.videoUrl)??"",
                flags: YoutubePlayerFlags(
                  autoPlay: false,
                  mute: false,
                )
            );
          }
        },
        builder: (context, state) {
          if (state is IutubeDetailLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is IutubeDetailSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.h,
                    ),
                    (youtubeController != null ?
                    YoutubePlayer(
                      controller: youtubeController!,
                      progressIndicatorColor: ColorConstant.violetColor,
                    ) : const SizedBox()),
                    Container(
                      padding: const EdgeInsets.only(left: 5,right: 5, top: 25.0,bottom: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  context.go(
                                      "/${RouteConstant.iutubeAuthorVideoName}/${state.getVideoDetailEntity.video.authorId}");
                                },
                                child: CircleAvatar(
                                  backgroundImage: CachedNetworkImageProvider(
                                      getImageFromString(
                                          state.getVideoDetailEntity.video.iutubeAuthor?.file?.url)),
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AutoSizeText(
                                      "${state.getVideoDetailEntity.video.title}",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      height: 5.h,
                                    ),
                                    AutoSizeText(
                                      "${state.getVideoDetailEntity.video.subject?.title_ru}",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14.sp,
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.h,),
                        ],
                      ),
                    ),
                    GFAccordion(
                        collapsedTitleBackgroundColor: ColorConstant.appBarColor,
                        expandedTitleBackgroundColor:ColorConstant.appBarColor,
                        contentBackgroundColor: ColorConstant.appBarColor,
                        titlePadding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                        titleBorderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.w),
                          topLeft: Radius.circular(10.w),
                        ),
                        contentBorderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.w),
                          bottomLeft: Radius.circular(10.w),
                        ),
                        titleChild: Text(
                          "Описание",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                        contentChild: Html(
                          data: state.getVideoDetailEntity.video.description,
                          style: {
                            "p": Style(
                                color: Colors.white
                            )
                          },
                        ),
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
                      height: 15.h,
                    ),
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
                        Expanded(
                          child: Text(
                            "Вам также будет интересно",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.sp,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ...(_getVideos(state.getVideoDetailEntity.alsoRecommended)),
                    SizedBox(
                      height: 15.h,
                    ),
                    Center()
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
