import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/core/app_constants/route_constant.dart';
import 'package:iu/features/menu_services/domain/entities/main_service_entity.dart';

class MainServicesScreen extends StatefulWidget {
  const MainServicesScreen({super.key});

  @override
  State<MainServicesScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainServicesScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox();
    // return Scaffold(
    //   body: Padding(
    //     padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h),
    //     child: Column(
    //       children: [
    //         Expanded(
    //           child: CustomScrollView(
    //             slivers: [
    //               SliverGrid(
    //                 gridDelegate:
    //                     const SliverGridDelegateWithFixedCrossAxisCount(
    //                   mainAxisSpacing: 10.0,
    //                   crossAxisSpacing: 10.0,
    //                   childAspectRatio: 1.2,
    //                   crossAxisCount: 3,
    //                 ),
    //                 delegate: SliverChildBuilderDelegate(
    //                   (BuildContext context, int index) {
    //                     return InkWell(
    //                       onTap: () {
    //                         context.goNamed(serviceItems[index].routeName);
    //                       },
    //                       child: Container(
    //                         margin: EdgeInsets.symmetric(
    //                             vertical: 2.h, horizontal: 2.w),
    //                         decoration: BoxDecoration(
    //                           borderRadius: BorderRadius.circular(8.0),
    //                           color: ColorConstant.lightViolet,
    //                           boxShadow: const [
    //                             BoxShadow(
    //                               color: Colors.grey,
    //                               offset: Offset(0.0, 1.0), //(x,y)
    //                               blurRadius: 6.0,
    //                             )
    //                           ],
    //                         ),
    //                         child: Padding(
    //                           padding: EdgeInsets.symmetric(
    //                               vertical: 2.h, horizontal: 2.w),
    //                           child: Column(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: [
    //                               Icon(
    //                                 serviceItems[index].icon,
    //                                 color: Colors.white,
    //                               ),
    //                               SizedBox(
    //                                 height: 5.h,
    //                               ),
    //                               Text(
    //                                 serviceItems[index].name,
    //                                 textAlign: TextAlign.center,
    //                                 style: TextStyle(
    //                                     color: Colors.white,
    //                                     fontSize: 12.sp,
    //                                     fontWeight: FontWeight.bold),
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                   childCount: serviceItems.length,
    //                 ),
    //               )
    //             ],
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }
}
