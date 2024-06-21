// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';

responsePopUp(context) {
  // var provider = ref.read(allProviderList.dashboardProvider.notifier);

  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: allColors.canvasColor,
          surfaceTintColor: allColors.canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.r,
              ),
            ),
          ),
          contentPadding: EdgeInsets.all(0.h),
          titlePadding: EdgeInsets.only(top: 0.h, bottom: 0.h),
          content: SizedBox(
            height: 0.3.sh,
            child: Stack(children: <Widget>[
              Padding(
                padding: EdgeInsets.only(
                  left: 160.h,
                ),
                child: Image.asset(
                  PngImagePaths.authDesignImg,
                  height: 183.65.h,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 0.7.sw, top: 12.h),
                child: InkWell(
                    onTap: () {
                      RoutesUtils.context.pop();
                    },
                    child: Icon(
                      Icons.close,
                      size: 30.h,
                      color: allColors.textColor,
                    )),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 0.14.sw, right: 0.h, top: 0.0.sh),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CommonTextWidget(
                        color: allColors.textColor,
                        size: 20.sp,
                        text: translation.password,
                        weight: FontWeight.w700,
                        padding: EdgeInsets.only(top: 0.h, left: 0.h)),
                    CommonTextWidget(
                        color: allColors.textColor,
                        size: 20.sp,
                        text: translation.updated,
                        weight: FontWeight.w700,
                        padding:
                            EdgeInsets.only(top: 5.h, left: 0.h, bottom: 20.h)),
                    Icon(
                      Icons.check_circle,
                      size: 63.h,
                      color: allColors.successColor,
                    ),
                    CommonTextWidget(
                        color: allColors.greyTextColor,
                        size: 15.sp,
                        text: translation.updatePasswordDes,
                        weight: FontWeight.w300,
                        padding: EdgeInsets.only(top: 20.h, left: 0.h)),
                  ],
                ),
              )
            ]),
          ),
        );
      });
}
