// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/dashboard_screen/dashboard_screen.dart';

import '../constants/object_constants/object_constants.dart';

class TopAuthWidget extends StatelessWidget {
  bool isBack;
  void Function()? onTap;
  double top;
  TopAuthWidget({super.key, this.isBack = false, this.onTap, this.top = 0.17});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 100.h),
          child: Image.asset(
            PngImagePaths.authDesignImg,
            height: 326.65.h,
            fit: BoxFit.contain,
          ),
        ),
        InkWell(
          onTap: () {
            index = 0;
            RoutesUtils.context.pushReplacement(DashBoardScreen.dashboardRoute);
          },
          child: Padding(
            padding: EdgeInsets.only(
              top: top.sh,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                PngImagePaths.appLogoDarkImg,
                height: 52.h,
                width: 205.w,
              ),
            ),
          ),
        ),
        if (isBack) ...[
          Padding(
            padding: EdgeInsets.only(
                right: isArabic ? 16.h : 0.h,
                top: 0.07.sh,
                left: isArabic ? 0.h : 16.h),
            child: InkWell(
              onTap: onTap,
              child: Container(
                decoration: BoxDecoration(
                    border:
                        Border.all(color: allColors.borderColor, width: 1.w),
                    borderRadius: BorderRadius.all(Radius.circular(4.r))),
                height: 34.h,
                width: 37.h,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 12.h,
                  color: allColors.textColor,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
