import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/services/image_service.dart';
import 'package:iu/core/utils/google_api.dart';
import 'package:iu/features/user/presentation/bloc/ava/change_ava_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../../core/services/injection_main.container.dart';
import '../../core/utils/hive_utils.dart';
import '../user/presentation/bloc/user_info_bloc.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    context.read<UserInfoBloc>().add(const GetInfoEvent());
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null && mounted) {
      context.read<ChangeAvaBloc>().add(
          AvaUploadEvent(pickedFile.path, context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Верхняя часть с аватаром и именем
          Stack(
            children: [
              Container(
                height: 250.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Colors.purple, Colors.pink],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.r),
                    bottomRight: Radius.circular(50.r),
                  ),
                ),
              ),
              BlocConsumer<UserInfoBloc, UserInfoState>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  if (state is GetInfoLoaded) {
                    return Positioned(
                      top: 80.h,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          children: [
                            BlocBuilder<ChangeAvaBloc, ChangeAvaState>(
                              builder: (context, avaState) {
                                if (avaState is AvaUploading) {
                                  return const Center(
                                      child: GFLoader(type: GFLoaderType.ios));
                                }
                                return GestureDetector(
                                  onTap: _pickImage,
                                  child: Container(
                                    width: 100.r, // Диаметр аватара
                                    height: 100.r, // Диаметр аватара
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.white, width: 2.0),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: state.meInfo.file != null
                                            ? getImageProviderFromServer(
                                            state.meInfo.file!.url)
                                            : const AssetImage(
                                            'assets/images/standard_bear.png'),
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            SizedBox(height: 10.h),
                            Text(
                              state.meInfo.name,
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Ученик',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  if (state is GetInfoError) {
                    print(state.failureData);
                  }
                  return const Center(child: GFLoader(type: GFLoaderType.ios));
                },
              ),
            ],
          ),
          // Нижняя часть с меню
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              children: [
                buildMenuItem(
                  icon: Icons.person,
                  text: 'Изменить профиль',
                  onClicked: () {
                    context.goNamed(RouteConstant.userInfoScreenName);
                  },
                ),
                buildMenuItem(
                  icon: Icons.mail,
                  text: 'Уведомление',
                  onClicked: () {},
                  trailing: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: const BoxDecoration(
                      color: Colors.purple,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '7',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                ),
                buildMenuItem(
                  icon: Icons.favorite,
                  text: 'Мои вопросы',
                  onClicked: () {},
                ),
                buildMenuItem(
                  icon: Icons.settings,
                  text: 'Настройки',
                  onClicked: () {},
                ),
                BlocBuilder<UserInfoBloc, UserInfoState>(
                  builder: (context, state) {
                    if (state is GetInfoLoaded) {
                      return buildMenuItem(
                        icon: Icons.logout,
                        text: 'Выход',
                        onClicked: () {
                          if (state.meInfo.isGoogle) {
                            GoogleSignInApi.logout();
                          }
                          HiveUtils().loggedOutFromHive().then((_) {
                            // Перенаправление пользователя на экран входа
                            GoRouter.of(context).goNamed(
                                RouteConstant.authScreenName);
                          });
                        },
                      );
                    }
                    return buildMenuItem(
                      icon: Icons.logout,
                      text: 'Выход',
                      onClicked: () {
                        HiveUtils().loggedOutFromHive().then((_) {
                          // Перенаправление пользователя на экран входа
                          GoRouter.of(context).goNamed(
                              RouteConstant.authScreenName);
                        });
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildMenuItem({
  required IconData icon,
  required String text,
  VoidCallback? onClicked,
  Widget? trailing,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: ListTile(
      leading: Icon(icon, size: 24.w, color: Colors.white,),
      title: Text(
        text,
        style: TextStyle(fontSize: 18.sp, color: Colors.white),
      ),
      trailing: trailing,
      onTap: onClicked,
    ),
  );
}
