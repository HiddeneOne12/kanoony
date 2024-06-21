// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';

import '../../../document_module/paid_document_screen/paid_doucment_screen.dart';

quickLinksPopUp(context, WidgetRef ref) {
  var varaibles = ref.watch(allProviderList.dashboardProvider);

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
            height: 0.43.sh,
            child: Directionality(
              textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
              child: Stack(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 120.h,
                  ),
                  child: Image.asset(
                    PngImagePaths.authDesignImg,
                    height: 214.65.h,
                    fit: BoxFit.cover,
                  ),
                ),
                CommonTextWidget(
                    color: allColors.textColor,
                    size: 18.sp,
                    text: varaibles.staticData?.quickLinks ?? '',
                    weight: FontWeight.w700,
                    padding: EdgeInsets.only(
                        top: 20.h,
                        left: isArabic ? 0 : 20.h,
                        right: isArabic ? 20.h : 0)),
                Padding(
                  padding: EdgeInsets.only(
                      left: isArabic ? 0.7.sw : 20.h,
                      right: isArabic ? 20.h : 0.7.sw,
                      top: 0.04.sh),
                  child: Divider(
                    color: allColors.primaryColor,
                    thickness: 1.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: isArabic ? 0 : 0.7.sw,
                      top: 12.h,
                      right: isArabic ? 0.7.sw : 0),
                  child: InkWell(
                      onTap: () {
                        RoutesUtils.context.pop();
                      },
                      child: Icon(
                        Icons.close,
                        size: 20.h,
                        color: allColors.textColor,
                      )),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: 20.h, right: 20.h, top: 0.07.sh),
                  child: Column(
                    children: [
                      Container(
                        height: 0.36.sh,
                        width: MediaQuery.sizeOf(context).width.sw,
                        child: ListView.builder(
                          itemCount: varaibles.quickLinks?.length,
                          padding: EdgeInsets.only(bottom: 10.h),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var data = varaibles.quickLinks?[index];
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: CommonButton(
                                  height: 35.h,
                                  backgroundColor: allColors.canvasColor,
                                  borderSides: BorderSide(
                                      color: allColors.buttonBorderColor),
                                  radius: 4.r,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14.sp,
                                          color: allColors.textColor),
                                  text: data?.title ?? '',
                                  onPressed: () async {
                                    RoutesUtils.context.push(
                                      PaidDocumentScreen.paidDocumentRoute,
                                      extra: {
                                        TextUtils.slug: data!.slug.toString()
                                      },
                                    );
                                  }),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        );
      });
}
