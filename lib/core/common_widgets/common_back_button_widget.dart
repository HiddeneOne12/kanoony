// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CommonBackButtonWidget extends StatelessWidget {
  Color color;
  EdgeInsetsGeometry padding;
  void Function()? onTap;
  CommonBackButtonWidget(
      {super.key,
      required this.padding,
      required this.color,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: InkWell(
        onTap: onTap,
        child: Icon(
          Icons.arrow_back_ios,
          color: color,
          size: 20.h,
        ),
      ),
    );
  }
}
