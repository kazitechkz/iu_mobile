import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
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
              Positioned(
                top: 80.h,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 50.r,
                        child: Image.asset('assets/images/standard_bear.png'), // Замените на ваш путь к аватару
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        'Naila Stefenson',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'UX/UI Designer',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
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
                  text: 'My Profile',
                  onClicked: () {},
                ),
                buildMenuItem(
                  icon: Icons.mail,
                  text: 'Messages',
                  onClicked: () {},
                  trailing: Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
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
                  text: 'Favourites',
                  onClicked: () {},
                ),
                buildMenuItem(
                  icon: Icons.location_on,
                  text: 'Location',
                  onClicked: () {},
                ),
                buildMenuItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  onClicked: () {},
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
