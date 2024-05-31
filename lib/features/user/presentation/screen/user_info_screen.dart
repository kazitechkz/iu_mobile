import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/widgets/common_app_bar_widget.dart';
import 'package:iu/features/user/presentation/bloc/user_info_bloc.dart';
import 'package:iu/features/user/presentation/widgets/get_form_widget.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key});

  @override
  State<UserInfoScreen> createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {

  @override
  void initState() {
    super.initState();
    context.read<UserInfoBloc>().add(const GetInfoEvent());
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CommonAppBarWidget(text: 'Редактировать', imageUrl: 'assets/images/icons/user_edit.png', routeLink: RouteConstant.profileScreenName,),
      body: BlocConsumer<UserInfoBloc, UserInfoState>(
        listener: (context, state) {
          if (state is GetInfoError) {
            context.read<UserInfoBloc>().add(const GetInfoEvent());
          }
        },
        builder: (context, state) {
          if (state is GetInfoLoaded) {
            return getUserForm(context, state);
          }
          if (state is GetInfoError) {
            return const Center(child: GFLoader(type: GFLoaderType.ios));
          }
          return const Center(child: GFLoader(type: GFLoaderType.ios));
        },
      ),
    );
  }
}
