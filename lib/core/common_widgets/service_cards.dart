// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

class ServiceCard extends StatelessWidget {
  final String icon;
  final String text;
  final bool isPng;
  final bool isBold;
  bool isSlider;
  void Function()? onTap;

  ServiceCard(
      {required this.icon,
      required this.text,
      required this.onTap,
      this.isBold = false,
      this.isSlider = false,
      this.isPng = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 140.w,
        child: Card(
          elevation: 0,
          color: allColors.canvasColor,
          surfaceTintColor: allColors.canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Padding(
              padding: kContainerPadding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: isBold ? 40.h : 37.h,
                    width: isBold ? 33.h : 37.h,
                    child: isPng
                        ? Image.asset(icon)
                        : SvgPicture.asset(
                            icon,
                          ),
                  ),
                  SizedBox(height: 14.h),
                  // CommonTextWidget(
                  //     maxLine: 1,
                  //     color: allColors.textColor,
                  //     size: 15,
                  //     weight: FontWeight.w400,
                  //     text: text,
                  //     padding: noPadding),
                  Text(
                    text,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: context.bodyMedium,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
