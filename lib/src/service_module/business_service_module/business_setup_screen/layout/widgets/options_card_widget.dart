import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';

Widget buildOptionCard(BuildContext context, String title, String description,String more) {
  return Padding(
    padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 5.h),
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: allColors.textColor, width: 1.w),
                borderRadius: BorderRadius.all(Radius.circular(10.r))),
            child: Column(
              children: [
                CommonTextWidget(
                 
                    color: allColors.textColor,
                     size: 16,
                    text: description,
                    weight: FontWeight.w400,
                    align: TextAlign.center,
                    maxLine: 3,
                    padding: EdgeInsets.only(
                        top: 40.h, bottom: 15.h, left: 16.h, right: 16.h)),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                      color: allColors.textColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomRight: Radius.circular(10.r))),
                  child: Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: CommonTextWidget(
                        color: allColors.canvasColor,
                        size: 16.sp,
                        text: more,
                        weight: FontWeight.w700,
                        padding: noPadding),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 85.h,
          child: Container(
              height: 44.h,
              width: 212.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: allColors.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(6.r))),
              child: CommonTextWidget(
                  color: allColors.canvasColor,
                  size: 16.sp,
                  text: title,
                  weight: FontWeight.w700,
                  padding: EdgeInsets.only(top: 5.h))),
        ),
      ],
    ),
  );
}
