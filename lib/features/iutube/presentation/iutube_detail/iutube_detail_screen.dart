import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  @override
  void initState() {
    super.initState();
    context.read<IutubeDetailBloc>().add(
        IutubeDetailByAliasEvent(GetVideoDetailParameter(alias: widget.alias)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<IutubeDetailBloc, IutubeDetailState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is IutubeDetailLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is IutubeDetailSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
                child: Column(
                  children: [
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
