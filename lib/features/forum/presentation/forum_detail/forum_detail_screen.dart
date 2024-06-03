import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_constants/route_constant.dart';
import '../../../../core/widgets/common_app_bar_widget.dart';
import '../../domain/parameters/get_forum_discuss_parameter.dart';
import 'bloc/forum_detail_bloc.dart';

class ForumDetailScreen extends StatefulWidget {
  const ForumDetailScreen({super.key, required this.forumId});
  final int forumId;
  @override
  State<ForumDetailScreen> createState() => _ForumDetailScreenState();
}

class _ForumDetailScreenState extends State<ForumDetailScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ForumDetailBloc>().add(ForumDetailGetByIdEvent(forumId: widget.forumId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Форум",
        imageUrl: "assets/images/icons/forum.webp",
        routeLink: RouteConstant.forumListName,
      ),
      body: BlocConsumer<ForumDetailBloc, ForumDetailState>(
        listener: (BuildContext context, ForumDetailState state) {
          if(state is ForumDetailSuccessState){
            context.read<ForumDetailBloc>().add(ForumDetailGetDiscussesEvent(parameter: GetForumDiscussParameter(forum_id: widget.forumId, page: 1, type: '')));
          }
        },
        builder: (BuildContext context, ForumDetailState state) {
          if(state is ForumDetailLoadingState){
            return Center(child: CircularProgressIndicator());
          }
          if(state is ForumDetailSuccessState){
            return Center(child:  Text("i am working!"));
          }
          return SizedBox();
        },
      )
    );
  }
}
