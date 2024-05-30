import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getwidget/getwidget.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/services/image_service.dart';
import 'package:iu/core/widgets/common_app_bar_widget.dart';
import 'package:iu/features/user/presentation/bloc/user_info_bloc.dart';

import '../../../../../core/app_constants/color_constant.dart';

class MySubscriptionScreen extends StatefulWidget {
  const MySubscriptionScreen({super.key});

  @override
  State<MySubscriptionScreen> createState() => _MySubscriptionScreenState();
}

class _MySubscriptionScreenState extends State<MySubscriptionScreen> {
  
  @override
  void initState() {
    super.initState();
    context.read<UserInfoBloc>().add(const GetInfoEvent());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBarWidget(text: 'Мои подписки', imageUrl: 'assets/images/icons/subscriptions.webp', routeLink: RouteConstant.profileScreenName),
      body: BlocBuilder<UserInfoBloc, UserInfoState>(
        builder: (context, state) {
          if (state is GetInfoLoaded) {
            if (state.meInfo.subscriptions.isNotEmpty) {
              return ListView.builder(
                  itemCount: state.meInfo.subscriptions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: const LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                ColorConstant.darkOrangeColor,
                                ColorConstant.appBarColor,
                              ])
                      ),
                      child: GFListTile(
                        listItemTextColor: GFColors.WHITE,
                        avatar: GFAvatar(
                          radius: 40,
                          shape: GFAvatarShape.square,
                          borderRadius: BorderRadius.circular(10),
                          backgroundImage: AssetImage(getSubjectImagePath(index)),
                        ),
                        title: Text('Математическая грамотность', style: TextStyle(fontSize: 19, color: Colors.white),),
                        subTitle: Text('Дата истечения: 28.06.2024', style: TextStyle(color: Colors.white),),
                      ),
                    );
                  }
              );
            }
            return const Center(child: Text('У вас пока нет активных подписок!', style: TextStyle(fontSize: 20, color: Colors.white),));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
