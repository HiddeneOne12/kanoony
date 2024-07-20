// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

import '../constants/static_constants/static_constants.dart';

class ServiceCard extends StatelessWidget {
  final String icon;
  final String text;
  final bool isPng;
  final bool isBold;

  bool isSlider;
  bool isTranslate;
  void Function()? onTap;

  ServiceCard(
      {required this.icon,
      required this.text,
      this.isTranslate = false,
      required this.onTap,
      this.isBold = false,
      this.isSlider = false,
      this.isPng = false});

  @override
  Widget build(BuildContext context) {
    return isTranslate
        ? InkWell(
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: 5.h,
                      left: isArabic ? 0 : 20.h,
                      top: 5.h,
                      right: isArabic ? 20.h : 0.h),
                  child: Container(
                    height: 44.h,
                    width: 44.h,
                    padding: EdgeInsets.all(2.h),
                    child: Image.asset(
                      color: context.primaryColor,
                      icon,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
                    child: Text(
                      text.capitalizeFirstLetter(),
                      style: context.bodyLarge
                          ?.copyWith(color: allColors.lightTextColor),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          )
        : InkWell(
            onTap: onTap,
            child: SizedBox(
              width: 140.w,
              child: Card(
                elevation: 0,
                color: context.onPrimaryColor,
                surfaceTintColor: context.onPrimaryColor,
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
                              ? Image.asset(
                                  icon,
                                )
                              : SvgPicture.asset(
                                  icon,
                                ),
                        ),
                        SizedBox(height: 14.h),
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
