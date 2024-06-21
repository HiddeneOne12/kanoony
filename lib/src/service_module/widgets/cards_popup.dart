import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';

import '../../../core/common_widgets/common_text_widget.dart';
import '../../../core/constants/image_paths/image_paths.dart';
import '../../../core/constants/object_constants/object_constants.dart';

cardsPopUp(context, title, icon, description, isOffshore, moreKeys, item1,
    item2, item3, item4, item5) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: allColors.popUpColor,
          surfaceTintColor: allColors.popUpColor,
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
            height: moreKeys
                ? 0.36.sh
                : isOffshore
                    ? 0.31.sh
                    : 0.24.sh,
            child: Directionality(
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              child: Stack(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 170.h,
                  ),
                  child: Image.asset(
                    PngImagePaths.authDesignImg,
                    height: 186.92.h,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(25.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 42.h,
                        width: 42.h,
                        child: Image.asset(
                          icon,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      CommonTextWidget(
                          color: allColors.textColor,
                          size: 18.sp,
                          text: title,
                          align: TextAlign.start,
                          weight: FontWeight.w700,
                          padding: noPadding),
                      Padding(
                        padding: EdgeInsets.only(
                            right: isArabic ? 0 : 0.65.sw,
                            left: isArabic ? 0.65.sw : 0),
                        child: Divider(
                          color: allColors.primaryColor,
                          thickness: 1.w,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      CommonTextWidget(
                          color: allColors.textColor,
                          size: 12.sp,
                          text: description,
                          align: TextAlign.justify,
                          weight: FontWeight.w400,
                          padding: noPadding),
                      if (moreKeys) ...[
                        SizedBox(
                          height: 10.h,
                        ),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 12.sp,
                            text: item1,
                            align: TextAlign.justify,
                            weight: FontWeight.w400,
                            padding: noPadding),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 12.sp,
                            text: item2,
                            align: TextAlign.justify,
                            weight: FontWeight.w400,
                            padding: noPadding),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 12.sp,
                            text: item3,
                            align: TextAlign.justify,
                            weight: FontWeight.w400,
                            padding: noPadding),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 12.sp,
                            text: item4,
                            align: TextAlign.justify,
                            weight: FontWeight.w400,
                            padding: noPadding),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 12.sp,
                            text: item5,
                            align: TextAlign.justify,
                            weight: FontWeight.w400,
                            padding: noPadding),
                      ],
                    ],
                  ),
                )
              ]),
            ),
          ),
        );
      });
}
