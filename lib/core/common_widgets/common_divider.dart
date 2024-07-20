// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';

class CommonDivider extends StatelessWidget {
  Color color;
  double topHeight;
  double bottomHeight;
  CommonDivider(
      {super.key,
      required this.color,
      required this.topHeight,
      required this.bottomHeight});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: kLeftRightPadding16,
      child: Column(
        children: [
          SizedBox(
            height: topHeight.h,
          ),
          Divider(
            thickness: 1.w,
            height: 1.h,
            color: color,
          ),
          SizedBox(
            height: bottomHeight.h,
          ),
        ],
      ),
    );
  }
}
