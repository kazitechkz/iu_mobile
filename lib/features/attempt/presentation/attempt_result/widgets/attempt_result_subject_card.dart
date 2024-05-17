import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/common/models/subject.dart';
import 'package:iu/features/stat/domain/entities/subject_result_entity.dart';

import '../../../../../core/app_constants/color_constant.dart';

class AttemptResultSubjectCard extends StatelessWidget {
  const AttemptResultSubjectCard({super.key,required this.subjectEntity,required this.subjectResultEntity});
  final SubjectEntity subjectEntity;
  final SubjectResultEntity? subjectResultEntity;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 20.w),
      constraints: BoxConstraints(
        minHeight: 320.h,
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1,0.9],
            colors: [
              ColorConstant.peachColor,
              ColorConstant.appBarColor,
            ]
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text(
            '${subjectEntity.title_ru}',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 22.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
