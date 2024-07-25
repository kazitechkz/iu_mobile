import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iu/core/common/models/subject.dart';

import '../../../../../core/app_constants/color_constant.dart';
import '../../../../../core/services/image_service.dart';

class SubjectCardWidget extends StatelessWidget {
  const SubjectCardWidget(
      {super.key, required this.subjectEntity, required this.subjects});
  final SubjectEntity subjectEntity;
  final List<int> subjects;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(getSubjectImagePath(subjectEntity.id)),
          )),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 10,
            top: 5,
            child: (subjects.contains(subjectEntity.id) == true ||
                    subjectEntity.is_compulsory == 1
                ? const Icon(FontAwesomeIcons.circleCheck,
                    color: Colors.lightGreenAccent)
                : SizedBox()),
          ),
          Positioned(
              bottom: 20,
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 2.w),
                  width: 120.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: ColorConstant.violetToPinkGradient,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      textAlign: TextAlign.center,
                      subjectEntity.title_ru,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ))),
        ],
      ),
    );
  }
}
