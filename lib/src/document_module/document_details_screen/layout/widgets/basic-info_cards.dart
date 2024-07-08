import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';

// ignore: must_be_immutable
class BasicInfoCards extends StatelessWidget {
  String name;
  String value;
  BasicInfoCards({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, top: 5.h),
      child: Container(
        height: 70.h,
        width: MediaQuery.sizeOf(context).width.sw,
        decoration: BoxDecoration(
            color: allColors.textFieldColor,
            borderRadius: BorderRadius.all(Radius.circular(10.r))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonTextWidget(
                color: allColors.textColor,
                size: 15,
                align: TextAlign.justify,
                text: name,
                weight: FontWeight.w500,
                maxLine: 1,
                padding:
                    EdgeInsets.only(right: 20.h,    left: 20.h)),
            CommonTextWidget(
                color: allColors.textColor,
                size: 16,
                align: TextAlign.justify,
                text: value,
                weight: FontWeight.w700,
                padding: EdgeInsets.only(right: 20.h, bottom: 0.h, left: 20.h)),
          ],
        ),
      ),
    );
  }
}
