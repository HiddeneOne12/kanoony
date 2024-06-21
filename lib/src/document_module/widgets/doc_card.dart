// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';

import '../../../core/common_widgets/common_text_widget.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';

class DocCard extends StatelessWidget {
  final String icon;
  final String text;
  bool isPaidScreen;
  String price;
  void Function()? onTap;

  DocCard(
      {required this.icon,
      required this.text,
      this.isPaidScreen = false,
      required this.onTap,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 7.h),
      child: Stack(
        children: [
          InkWell(
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
                      top: 10.h, bottom: 10.h, left: 16.h, right: 16.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 25.h,
                        width: 25.h,
                        child: SvgPicture.asset(
                          icon,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextWidget(
                          color: allColors.textColor,
                          size: 10.sp,
                          text: text,
                          maxLine: 3,
                          weight: FontWeight.w500,
                          padding: noPadding)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 0.02.sh,
              left: isPaidScreen ? 0.27.sw : 0.323.sw,
            ),
            child: Container(
                height: 25.h,
                width: 51.h,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(PngImagePaths.flagImg))),
                child: CommonTextWidget(
                    color: allColors.canvasColor,
                    size: price == '0' ? 12.sp : 8.sp,
                    text: price == '0' ? "FREE" : "AED $price",
                    weight: FontWeight.w800,
                    padding: EdgeInsets.only(top: 5.h))),
          ),
        ],
      ),
    );
  }
}
