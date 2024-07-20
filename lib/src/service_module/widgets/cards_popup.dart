import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
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
                  child: SingleChildScrollView(
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
                        Text(
                          title,
                          style: context.headlineMedium,
                          textAlign: TextAlign.start,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          description,
                          style: context.bodySmall,
                          textAlign: TextAlign.justify,
                        ),
                        if (moreKeys) ...[
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            item1,
                            style: context.bodySmall,
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            item2,
                            style: context.bodySmall,
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            item3,
                            style: context.bodySmall,
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            item4,
                            style: context.bodySmall,
                            textAlign: TextAlign.justify,
                          ),
                          Text(
                            item5,
                            style: context.bodySmall,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
        );
      });
}
