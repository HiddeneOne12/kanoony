import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';

Widget buildOptionCard(
    BuildContext context, String title, String description, String more) {
  return Padding(
    padding: kHeadlineBottomPadding,
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: context.onSurfaceColor, width: 1.w),
                borderRadius: kBorderRadius10),
            child: Column(
              children: [
                Padding(
                  padding: kInsideCardPadding,
                  child: Text(
                    description,
                    style: context.bodyLarge,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.sizeOf(context).width.w,
                  height: 43.h,
                  decoration: BoxDecoration(
                      color: context.onSurfaceColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomRight: Radius.circular(10.r))),
                  child: Padding(
                    padding: kTopPadding5,
                    child: Text(
                      more,
                      style: context.headlineSmall
                          ?.copyWith(color: context.onPrimaryColor),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 75.h,
          bottom: 160.h,
          right: 75.h,
          child: Container(
              width: 212.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: context.primaryColor, borderRadius: kBorderRadius6),
              child: Padding(
                padding: kTopPadding5,
                child: Text(
                  capitalizeFirst(title),
                  style: context.headlineSmall
                      ?.copyWith(color: context.onPrimaryColor),
                  textAlign: TextAlign.start,
                ),
              )),
        ),
      ],
    ),
  );
}
