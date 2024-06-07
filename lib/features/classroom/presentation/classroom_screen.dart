import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iu/features/classroom/presentation/bloc/classroom_bloc.dart';

import '../../../core/app_constants/route_constant.dart';
import '../../../core/widgets/common_app_bar_widget.dart';

class ClassRoomScreen extends StatefulWidget {
  const ClassRoomScreen({super.key});

  @override
  State<ClassRoomScreen> createState() => _ClassRoomScreenState();
}

class _ClassRoomScreenState extends State<ClassRoomScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ClassroomBloc>().add(ClassroomAllEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(
        text: "Мои классы",
        imageUrl: "assets/images/icons/classroom.webp",
        routeLink: RouteConstant.dashboardScreenName,
      ),
      body: BlocConsumer<ClassroomBloc, ClassroomState>(
        listener: (BuildContext context, ClassroomState state) {  },
        builder: (BuildContext context, ClassroomState state) {
          if(state is ClassroomLoadingState){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is ClassroomSuccessState){
            return Center(child: Text("wowowow",style: TextStyle(color: Colors.white),),);
          }

          return SizedBox();
        },
      ),
    );
  }
}
