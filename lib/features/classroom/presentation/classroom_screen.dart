import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/toast/gf_toast.dart';
import 'package:getwidget/position/gf_toast_position.dart';
import 'package:iu/core/common/blocs/subject_dropdown/subject_dropdown_bloc.dart';
import 'package:iu/features/classroom/presentation/bloc/classroom_bloc.dart';
import 'package:iu/features/classroom/presentation/widgets/classroom_widget.dart';

import '../../../core/app_constants/color_constant.dart';
import '../../../core/app_constants/route_constant.dart';
import '../../../core/widgets/common_app_bar_widget.dart';
import '../domain/entities/classroom_entity.dart';

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
        listener: (BuildContext context, ClassroomState state) {
          if (state is ClassroomFailedState) {
            GFToast.showToast(
                state.failureData.message,
                context,
                toastPosition: GFToastPosition.BOTTOM,
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                backgroundColor: Colors.black
            );
            context.read<ClassroomBloc>().add(ClassroomAllEvent());
          }
        },
        builder: (BuildContext context, ClassroomState state) {
          if(state is ClassroomLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if(state is ClassroomSuccessState) {
            List<ClassRoomEntity> rooms = state.rooms.toList();
            return Column(
              children: [
                const ClassroomActionButtons(),
                SizedBox(height: 10.h,),
                rooms.isNotEmpty ?
                  getRoomList(rooms, context) :
                  const Center(child: Text('Ничего не найдено', style: TextStyle(fontSize: 20, color: Colors.white),))
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
