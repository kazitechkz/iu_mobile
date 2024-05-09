import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/services/image_service.dart';
import '../../../../core/widgets/youtube_card.dart';
import '../../domain/entities/iutube_video_entity.dart';
import '../../domain/parameters/get_video_author_detail_parameter.dart';
import 'bloc/iutube_author_bloc.dart';

class IutubeAuthorScreen extends StatefulWidget {
  const IutubeAuthorScreen({super.key, required this.authorId});
  final int authorId;
  @override
  State<IutubeAuthorScreen> createState() => _IutubeAuthorScreenState();
}

class _IutubeAuthorScreenState extends State<IutubeAuthorScreen> {
  @override
  void initState() {
    super.initState();
    context.read<IutubeAuthorBloc>().add(IutubeAuthorByIdEvent(
        GetVideoAuthorDetailParameter(id: widget.authorId, page: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<IutubeAuthorBloc, IutubeAuthorState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is IutubeAuthorLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is IutubeAuthorSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
                child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      child: Container(
                        width: 320.w,
                        padding: EdgeInsets.all(10.0),
                        constraints: BoxConstraints(minHeight: 240.h),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 70.w,
                              backgroundImage: CachedNetworkImageProvider(
                                  getImageFromString(state.author?.file?.url)),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Text(
                              "${state.author.name}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Html(data: "${state.author.description}")
                          ],
                        ),
                      ),
                    ),
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
                        Text(
                          "Видео автора",
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
                    ...(_getVideos(state.videos.data)),
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
