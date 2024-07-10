// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';

import '../../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';

class BusinessFreeZoneServiceCard extends StatelessWidget {
  final String icon;
  final String text;
  void Function()? onTap;

  BusinessFreeZoneServiceCard(
      {required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7.h),
      child: InkWell(
        onTap: onTap,
        child: Card(
          elevation: 0,
          color: allColors.canvasColor,
          surfaceTintColor: allColors.canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 16.h, right: 16.h, top: 5.h, bottom: 5.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Image.asset(
                      icon,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    height: 26.h,
                  
                    decoration: BoxDecoration(
                        color: allColors.lightBlueColor,
                        borderRadius: BorderRadius.all(Radius.circular(6.r))),
                    alignment: Alignment.center,
                    child: CommonTextWidget(
                        color: allColors.blackColor,
                        size:14,
                        text: text.capitalizeFirstLetter() ?? "",
                        weight: FontWeight.w500,
                        maxLine: 1,
                        padding: noPadding),
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
