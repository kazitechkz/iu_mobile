import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:iu/core/app_constants/color_constant.dart';
import 'package:iu/features/steps/domain/entities/step_entity.dart';
import '../../../../../core/services/image_service.dart';

AppBar buildAppBar(String imageURl) {
  return AppBar(
    title: Container(
      margin: EdgeInsets.symmetric(horizontal: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 15.w,
            height: 12.h,
            child: Image.asset('assets/icons/menu.png'),
          ),
          GestureDetector(
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(imageURl)
                  )
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget homePageText(String text, {Color color = Colors.blue, int top = 20}) {
  return Container(
    margin: EdgeInsets.only(top: top.h),
    child: Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold
      ),
    ),
  );
}

Widget searchView() {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: Colors.yellow)
        ),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              width: 16.w,
              height: 16.w,
              child: Image.asset('assets/icons/search.png'),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                    hintText: 'search your course',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    hintStyle: TextStyle(color: Colors.green)),
                style: TextStyle(
                    color: Colors.blue,
                    fontFamily: "Avenir",
                    fontWeight: FontWeight.normal,
                    fontSize: 14.sp),
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.w,
          decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.all(Radius.circular(13.w)),
              border: Border.all(color: Colors.pink)
          ),
          child: Image.asset('assets/icons/options.png'),
        ),
      )
    ],
  );
}
Widget reUsableText(String text, {Color color = Colors.pink, int fontSize = 14, FontWeight fontWeight = FontWeight.bold, TextAlign align = TextAlign.start}) {
  return Text(
    text,
    textAlign: align,
    style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize.sp
    ),
  );
}
Widget menuView() {
  return Column(
    children: [
      Container(
        width: 325.w,
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            reUsableText('Choose your course', fontSize: 20),
            GestureDetector(child: reUsableText('See all', color: Colors.green),)
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 15.h),
        child: Row(
          children: [
            _reUsableMenuText('All'),
            _reUsableMenuText('Popular', textColor: Colors.grey, bgColor: Colors.white),
            _reUsableMenuText('Newest', textColor: Colors.grey, bgColor: Colors.white),
          ],
        ),
      )
    ],
  );
}

Widget _reUsableMenuText(String menuText, {Color textColor = Colors.white, Color bgColor = Colors.pink}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: bgColor)
    ),
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
    child: reUsableText(menuText, color: textColor, fontWeight: FontWeight.normal, fontSize: 12, align: TextAlign.center),
  );
}

Widget courseGrid(MainStepEntity stepEntity) {
  return Container(
    margin: EdgeInsets.all(5.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.w),
      gradient: const LinearGradient(
        colors: ColorConstant.violetToPinkGradient
      )
    ),
    child: GFListTile(
      padding: EdgeInsets.all(10.h),
        avatar: GFAvatar(
          backgroundImage: getImageProviderFromServer(stepEntity.image?.url),
        ),
        titleText: stepEntity.title_kk,
        subTitle: Padding(
          padding: EdgeInsets.symmetric(vertical: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Главы: ${stepEntity.steps_count}'),
              Text('Темы: ${stepEntity.sub_steps_count}')
            ],
          ),
        ),
        description: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: GFProgressBar(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              percentage: stepEntity.progress/100,
              lineHeight: 14,
              alignment: MainAxisAlignment.spaceBetween,
              // leading  : const Icon( Icons.sentiment_dissatisfied, color: GFColors.DANGER),
              // trailing: const Icon( Icons.sentiment_satisfied, color: GFColors.SUCCESS),
              backgroundColor: Colors.black26,
              progressBarColor: GFColors.INFO,
              child: Text('${stepEntity.progress}%', textAlign: TextAlign.end,
                style: const TextStyle(fontSize: 10, color: Colors.white),
              ),
            ),
        ),
    ),
  );
}