import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../app_constants/color_constant.dart';

class CommonAppBarWidget extends StatefulWidget  implements PreferredSizeWidget {
  const CommonAppBarWidget({super.key,required this.routeLink, this.imageUrl,required this.text});
  final String routeLink;
  final String? imageUrl;
  final String text;
  @override
  State<CommonAppBarWidget> createState() => _CommonAppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CommonAppBarWidgetState extends State<CommonAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.imageUrl);
    return AppBar(
      leading: InkWell(
        onTap: (){
          context.go("/${widget.routeLink}");
        },
        child: const Icon(FontAwesomeIcons.chevronLeft,color: ColorConstant.grayColor,),
      ),
      backgroundColor: ColorConstant.appBarColor,
      centerTitle: true,
      title:   Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.imageUrl != null ? Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      widget.imageUrl!
                  ),
                  fit: BoxFit.contain,
                )),
          ) : const SizedBox(),
          SizedBox(
            width: 5.w,
          ),
          Text(
            widget.text,
            style: TextStyle(
                color: ColorConstant.grayColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10),
        ),
      ),
    );
  }
}
