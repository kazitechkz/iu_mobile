import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/checkbox_list_tile/gf_checkbox_list_tile.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';
import 'package:getwidget/types/gf_loader_type.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/core/services/image_service.dart';
import 'package:iu/core/utils/google_api.dart';
import 'package:iu/features/user/presentation/bloc/ava/change_ava_bloc.dart';
import 'package:iu/l10n/bloc/locale_cubit.dart';
import '../../core/app_constants/color_constant.dart';
import '../../core/utils/hive_utils.dart';
import '../user/presentation/bloc/user_info_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        ColorConstant.darkOrangeColor,
                        ColorConstant.appBarColor,
                      ]),
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
                              state.meInfo.isKundelik ? 'Ученик' : state.meInfo.email,
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
                  text: AppLocalizations.of(context)!.change_profile,
                  onClicked: () {
                    context.goNamed(RouteConstant.userInfoScreenName);
                  },
                ),
                buildMenuItem(
                  icon: Icons.mail,
                  text: AppLocalizations.of(context)!.notifications,
                  onClicked: () {},
                  trailing: Container(
                    width: 30.w,
                    height: 30.w,
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        gradient: const LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              ColorConstant.darkOrangeColor,
                              ColorConstant.appBarColor,
                            ])
                    ),
                    child: Center(
                      child: Text(
                        '7',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                buildMenuItem(
                  icon: Icons.subscriptions_outlined,
                  text: AppLocalizations.of(context)!.my_subscriptions,
                  onClicked: () => context.goNamed(RouteConstant.mySubscriptionsName),
                ),
                buildMenuItem(
                  icon: Icons.favorite,
                  text: AppLocalizations.of(context)!.my_saved_questions,
                  onClicked: () => context.goNamed(RouteConstant.mySavedQuestionsName),
                ),
                buildMenuItem(
                  icon: Icons.language,
                  text: AppLocalizations.of(context)!.language,
                  onClicked: () {
                    showModalBottomSheet(
                        backgroundColor: ColorConstant.backgroundColor,
                        context: context,
                        builder: (builder) {
                          return BlocBuilder<LocaleCubit, LocaleState>(
                            builder: (context, state) {
                              return FractionallySizedBox(
                                heightFactor: 0.6,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Column(
                                    children: [
                                      GFCheckboxListTile(
                                        titleText: 'Қазақ',
                                        listItemTextColor: Colors.white,
                                        avatar: const GFAvatar(
                                          backgroundImage: AssetImage('assets/icons/kk_icon.png'),
                                        ),
                                        size: 25,
                                        activeBgColor: ColorConstant.orangeColor,
                                        type: GFCheckboxType.circle,
                                        activeIcon: const Icon(
                                          Icons.check,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        onChanged: (value) => context.read<LocaleCubit>().toKazakh(),
                                        value: state.locale == const Locale('kk') ? true : false,
                                        inactiveIcon: null,
                                      ),
                                      GFCheckboxListTile(
                                        titleText: 'Русский',
                                        listItemTextColor: Colors.white,
                                        avatar: const GFAvatar(
                                          backgroundImage: AssetImage('assets/icons/ru_icon.png'),
                                        ),
                                        size: 25,
                                        activeBgColor: ColorConstant.orangeColor,
                                        type: GFCheckboxType.circle,
                                        activeIcon: const Icon(
                                          Icons.check,
                                          size: 15,
                                          color: Colors.white,
                                        ),
                                        onChanged: (value) => context.read<LocaleCubit>().toRussian(),
                                        value: state.locale == const Locale('ru') ? true : false,
                                        inactiveIcon: null,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }
                    );
                  },
                ),
                BlocBuilder<UserInfoBloc, UserInfoState>(
                  builder: (context, state) {
                    if (state is GetInfoLoaded) {
                      return buildMenuItem(
                        icon: Icons.logout,
                        text: AppLocalizations.of(context)!.logout,
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
                      text: AppLocalizations.of(context)!.logout,
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
