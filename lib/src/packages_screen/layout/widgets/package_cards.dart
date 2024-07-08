// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/common_text_widget.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';

class PackageCard extends StatelessWidget {
  String price;
  String title;
  String description;
  String getItNow;
  String fifty;
  Function()? onTap;
  PackageCard(
      {super.key,
      required this.price,
      required this.fifty,
      required this.onTap,
      required this.title,
      required this.description,
      required this.getItNow, required });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 5.h),
      child: Card(
        elevation: 0,
        color: allColors.canvasColor,
        surfaceTintColor: allColors.canvasColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 16.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    
                    padding: EdgeInsets.symmetric(horizontal : 4.h ,vertical: 2),
                    decoration: BoxDecoration(
                        color: allColors.primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(6.r))),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5,),
                          CommonTextWidget(
                            height: 1,
                              color: allColors.canvasColor,
                              size: 15.sp,
                              text: 'AED',
                              weight: FontWeight.w400,
                              padding: noPadding),
                          CommonTextWidget(
                             height: 1,
                              color: allColors.canvasColor,
                              size: 20.sp,
                              text: price,
                              weight: FontWeight.w700,
                              padding: noPadding),
                        ]),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 20.sp,
                            text: title,
                            weight: FontWeight.w700,
                            padding: noPadding),
                        CommonTextWidget(
                            color: allColors.primaryColor,
                            size: 20.sp,
                            text: fifty,
                            weight: FontWeight.w700,
                            padding: noPadding),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 10.h, right: 10.h),
              child: Html(
                style: {
                  "p": Style(
                      color: allColors.textColor,
                      fontSize: FontSize(16.sp),
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Tajawal'),
                },
                data: description,
              ),
            ),

            InkWell(
              onTap: onTap,
              child: Container(
                width: MediaQuery.sizeOf(context).width.w,
                height: 43.h,
                decoration: BoxDecoration(
                    color: allColors.textColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.r),
                        topLeft: Radius.zero,
                        topRight: Radius.zero,
                        bottomRight: Radius.circular(10.r))),
                child: Center(
                  child: CommonTextWidget(
                      color: allColors.canvasColor,
                      size: 15.sp,
                      text: getItNow,
                      weight: FontWeight.w700,
                      padding: noPadding),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
