// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common_widgets/common_text_widget.dart';
import '../../../core/constants/object_constants/object_constants.dart';

class GoldenVisaPoints extends StatelessWidget {
  String title;
  GoldenVisaPoints({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5.h),
          child: Icon(
            Icons.circle,
            size: 4.h,
            color: allColors.textColor,
          ),
        ),
        SizedBox(
          width: 5.w,
        ),
        Flexible(
          child: CommonTextWidget(
              color: allColors.textColor,
              size: 14.sp,
              align: TextAlign.start,
              text: title,
              weight: FontWeight.w400,
              padding: EdgeInsets.only(bottom: 2.h)),
        ),
      ],
    );
  }
}
