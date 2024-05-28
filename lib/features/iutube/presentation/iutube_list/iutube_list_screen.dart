import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../../../core/widgets/youtube_card.dart';
import '../../domain/entities/iutube_video_entity.dart';
import '../../domain/parameters/get_all_videos_parameter.dart';
import 'bloc/iutube_list_bloc.dart';

class IutubeListScreen extends StatefulWidget {
  const IutubeListScreen({super.key});

  @override
  State<IutubeListScreen> createState() => _IutubeListScreenState();
}

class _IutubeListScreenState extends State<IutubeListScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<IutubeListBloc>()
        .add(IutubeListAllEvent(GetAllVideosParameter(page: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "IUTube",
        imageUrl: "assets/images/icons/iutube.webp",
        routeLink: RouteConstant.dashboardScreenName,
      ),
      body: BlocConsumer<IutubeListBloc, IutubeListState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is IutubeListLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is IutubeListSuccessState) {
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
                          color: ColorConstant.darkOrangeColor,
                          size: 22.sp,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "Вам также будет интересно",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.sp,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    ...(_getVideos(state.videos)),
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
