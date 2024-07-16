// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';

class BusinessMainLandServiceCard extends StatelessWidget {
  final String icon;
  final String text;
  void Function()? onTap;

  BusinessMainLandServiceCard(
      {required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7.h),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: context.onPrimaryColor,
          surfaceTintColor: context.onPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: kBorderRadius10,
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 36.h,
                    width: 36.h,
                    child: Image.asset(
                      icon,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    text,
                    style: context.titleSmall
                        ?.copyWith(color: allColors.blackColor),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
