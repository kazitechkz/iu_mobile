import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/features/steps/domain/entities/step_entity.dart';

import '../../../../core/services/image_service.dart';

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
Widget reUsableText(String text, {Color color = Colors.pink, int fontSize = 14, FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
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

Widget _reUsableMenuText(String menuText, {Color textColor = Colors.pink, Color bgColor = Colors.pink}) {
  return Container(
    margin: EdgeInsets.only(right: 20.w),
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(7.w),
        border: Border.all(color: bgColor)
    ),
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
    child: reUsableText(menuText, color: textColor, fontWeight: FontWeight.normal, fontSize: 12),
  );
}

Widget courseGrid(StepEntity stepEntity) {
  return Container(
    padding: EdgeInsets.all(12.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.w),
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(ImageService.getAvaFromServer(stepEntity.image?.url))
        )
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          stepEntity.title_ru??'',
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: Colors.pink,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 5.h,),
        Text(
          'Flutter best course',
          maxLines: 1,
          overflow: TextOverflow.fade,
          textAlign: TextAlign.left,
          softWrap: false,
          style: TextStyle(
              color: Colors.yellow,
              fontSize: 10.sp,
              fontWeight: FontWeight.normal
          ),
        )
      ],
    ),
  );
}