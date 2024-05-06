import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iu/core/common/models/subject.dart';

import '../../../../../core/services/image_service.dart';

class SubjectHeaderWidget extends StatefulWidget {
  const SubjectHeaderWidget({super.key,required this.subjectItem});
  final SubjectEntity subjectItem;
  @override
  State<SubjectHeaderWidget> createState() => _SubjectHeaderWidgetState();
}

class _SubjectHeaderWidgetState extends State<SubjectHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Container(
          height: 80.h,
          width: 80.h,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: getImageProviderFromServer(widget.subjectItem.image?.url),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(80.h)),
        ),
        SizedBox(
          width: 10.w,
        ),
        Flexible(
          child: Text(
            widget.subjectItem.title_ru,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
