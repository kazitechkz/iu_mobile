import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/utils/toasters.dart';
import 'package:iu/features/forum/domain/parameters/all_forum_parameter.dart';
import 'package:iu/features/forum/presentation/all_forum/bloc/all_forum_bloc.dart';
import 'package:iu/features/forum/presentation/all_forum/widgets/forum_card_widget.dart';

import '../../../../core/app_constants/color_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';

class AllForumScreen extends StatefulWidget {
  const AllForumScreen({super.key});

  @override
  State<AllForumScreen> createState() => _AllForumScreenState();
}

class _AllForumScreenState extends State<AllForumScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<AllForumBloc>()
        .add(AllForumWithParamsEvent(AllForumParameter(page: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Форум",
        imageUrl: "assets/images/icons/forum.webp",
        routeLink: RouteConstant.dashboardScreenName,
      ),
      body: BlocConsumer<AllForumBloc, AllForumState>(
        listener: (BuildContext context, AllForumState state) {
          if (state is AllForumFailedState) {
            AppToaster.showError(state.failureData.message ?? "Ошибка");
          }
        },
        builder: (BuildContext context, AllForumState state) {
          if (state is AllForumLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is AllForumSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 10.w),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(30.w),
                              color: ColorConstant.peachColor),
                          child: AutoSizeText(
                            maxLines: 2,
                            "Написать",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      ...state.forums
                          .map((forumEntity) =>
                              ForumCardWidget(forumEntity: forumEntity))
                          .toList(),
                    ]),
              ),
            );
          }
          return SizedBox(
            child: Text(state.toString()),
          );
        },
      ),
    );
  }
}
