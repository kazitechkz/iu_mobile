import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/helpers/color_helper.dart';
import 'package:iu/features/iutube/domain/entities/iutube_video_entity.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube/youtube.dart';

import '../app_constants/route_constant.dart';
import '../services/image_service.dart';

class YoutubeCardWidget extends StatefulWidget {
  const YoutubeCardWidget({super.key, required this.video});
  final IUTubeVideoEntity video;
  @override
  State<YoutubeCardWidget> createState() => _YoutubeCardWidgetState();
}

class _YoutubeCardWidgetState extends State<YoutubeCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: InkWell(
        onTap: () {
          context.go(
              "/${RouteConstant.iutubeDetailName}/${widget.video.alias}");
        },
        child: Column(
          children: [
            Container(
              height: 240.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.w),
                  topRight: Radius.circular(20.w),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://img.youtube.com/vi/${YoutubePlayer.convertUrlToId(widget.video.videoUrl)}/0.jpg'),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(
                        0.3), // Adjust the opacity to control the darkness
                    BlendMode.darken,
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.bottomRight,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(minWidth: 50.w, maxHeight: 30.h),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.w)),
                            child: Text(
                              "${widget.video.locale?.title}",
                              style:
                                  const TextStyle(color: ColorConstant.violetColor,fontWeight: FontWeight.w700),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Icon(
                          FontAwesomeIcons.play,
                          color: ColorConstant.darkOrangeColor,
                          size: 64.sp,
                        )),
                    Align(
                        alignment: Alignment.topRight,
                        child: widget.video.isRecommended
                            ? Icon(
                                FontAwesomeIcons.fire,
                                color: ColorConstant.darkOrangeColor,
                                size: 32.sp,
                              )
                            : SizedBox())
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              decoration:  BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.1,0.8],
                  colors: [ColorConstant.bottomBarColor,ColorConstant.violetColor]
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20.w),
                  bottomLeft: Radius.circular(20.w),
                ),
              ),
              child: Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              context.go(
                                  "/${RouteConstant.iutubeAuthorVideoName}/${widget.video.authorId}");
                            },
                            child: CircleAvatar(
                              backgroundImage: CachedNetworkImageProvider(
                                  getImageFromString(
                                      widget.video.iutubeAuthor?.file?.url)),
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
                                  "${widget.video.title}",
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
                                  "${widget.video.subject?.title_ru}",
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
                    )
                  ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
