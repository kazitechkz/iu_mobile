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
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.go(
                  "/${RouteConstant.iutubeDetailName}/${widget.video.alias}");
            },
            child: Container(
              height: 240.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.w),
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
                                  TextStyle(color: ColorConstant.violetFirst),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                    Align(
                        alignment: Alignment.center,
                        child: Icon(
                          FontAwesomeIcons.play,
                          color: Colors.redAccent,
                          size: 64.sp,
                        )),
                    Align(
                        alignment: Alignment.topRight,
                        child: widget.video.isRecommended
                            ? Icon(
                                FontAwesomeIcons.fire,
                                color: Colors.redAccent,
                                size: 32.sp,
                              )
                            : SizedBox())
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
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
                            color: Colors.black,
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
                          color: Colors.grey,
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
    );
  }
}
