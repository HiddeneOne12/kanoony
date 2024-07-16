// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';

import '../../../core/constants/values.dart';

class CommonContainer extends StatelessWidget {
  Widget widget;
  Color containerColor;
  Color containerBorderColor;
  CommonContainer(
      {super.key,
      required this.widget,
      required this.containerColor,
      required this.containerBorderColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kLeftRightPadding16,
      child: Container(
        padding: kTopPadding9,
        decoration: BoxDecoration(
            color: containerColor,
            border: Border.all(color: containerBorderColor, width: 1.w),
            borderRadius: kBorderRadius6),
        child: widget,
      ),
    );
  }
}
