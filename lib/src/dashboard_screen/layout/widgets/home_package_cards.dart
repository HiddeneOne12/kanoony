// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:intl/intl.dart';
import '../../../../core/common_widgets/common_button_widget.dart';
import '../../../../core/constants/static_constants/static_constants.dart';

class CurrentPackageCard extends StatelessWidget {
  String price;
  String title;
  String description;
  String status;
  String getItNow;
  String cancelNow;
  String expiryDate;
  String remainingDoc;
  void Function()? onCancel;
  CurrentPackageCard(
      {required this.price,
      required this.title,
      required this.cancelNow,
      required this.onCancel,
      required this.getItNow,
      required this.expiryDate,
      required this.remainingDoc,
      required this.description,
      required this.status});
  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('d MMMM, yyyy')
        .format(DateTime.tryParse(expiryDate) ?? DateTime.now());
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h),
      child: Card(
        elevation: 0,
        color: allColors.canvasColor,
        surfaceTintColor: allColors.canvasColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: 16.h, right: 16.h, top: 16.h, bottom: 10.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: CommonTextWidget(
                        color: allColors.textColor,
                        size: 18.sp,
                        text: title,
                        weight: FontWeight.w700,
                        padding: noPadding),
                  ),
                  if (remainingDoc == "0" ||
                      DateTime.now().isAfter(
                          DateTime.tryParse(expiryDate) ?? DateTime.now())) ...[
                    SizedBox(
                      width: 5.h,
                    ),
                    Flexible(
                      child: CommonTextWidget(
                          color: allColors.errorColor,
                          size: 20.sp,
                          text: "(Expired)",
                          weight: FontWeight.w700,
                          padding: noPadding),
                    ),
                  ],
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 16.h, right: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: CommonTextWidget(
                        color: allColors.primaryColor,
                        size: 24.sp,
                        text: 'AED',
                        weight: FontWeight.w500,
                        padding: noPadding),
                  ),
                  SizedBox(
                    width: 5.h,
                  ),
                  Flexible(
                    child: CommonTextWidget(
                        color: allColors.primaryColor,
                        size: 36.sp,
                        text: price,
                        weight: FontWeight.w700,
                        padding: noPadding),
                  ),
                ],
              ),
            ),
            Html(
              style: {
                "p": Style(
                    margin: Margins.zero,
                    padding: HtmlPaddings.only(
                        left: 16.0.h, right: isArabic ? 0.0.sw : 16.h),
                    color: allColors.textColor,
                    fontSize: FontSize(14.sp),
                    textAlign: TextAlign.center,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Tajawal'),
              },
              data: description,
            ),
            CommonTextWidget(
                color: allColors.textColor,
                align: TextAlign.center,
                size: 14.sp,
                text: 'You have $remainingDoc documents remaining',
                weight: FontWeight.w400,
                padding: EdgeInsets.only(top: 5.h)),
            CommonTextWidget(
                color: allColors.textColor,
                size: 14.sp,
                text: 'Your package will auto-renew on',
                weight: FontWeight.w400,
                padding: noPadding),
            CommonTextWidget(
                color: allColors.errorColor,
                size: 14.sp,
                text: formattedDate,
                weight: FontWeight.w400,
                padding: noPadding),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (remainingDoc == "0" ||
                      DateTime.now().isAfter(
                          DateTime.tryParse(expiryDate) ?? DateTime.now())) ...[
                    Expanded(
                      child: CommonButton(
                          height: 33.h,
                          backgroundColor: allColors.textColor,
                          borderSides: BorderSide(color: allColors.textColor),
                          radius: 10.r,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                  color: allColors.canvasColor),
                          text: getItNow,
                          onPressed: () async {
                            
                          }),
                    ),
                    SizedBox(
                      width: 10.h,
                    ),
                  ],
                  if (status == "subscribed") ...[
                    Expanded(
                      child: CommonButton(
                          height: 33.h,
                          backgroundColor: allColors.canvasColor,
                          borderSides: BorderSide(color: allColors.textColor),
                          radius: 10.r,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 12.sp,
                                  color: allColors.textColor),
                          text: cancelNow,
                          onPressed: onCancel),
                    ),
                  ] 
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
