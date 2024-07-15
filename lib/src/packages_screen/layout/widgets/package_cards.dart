// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

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
      required this.getItNow,
      required});
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 2),
                  decoration: BoxDecoration(
                      color: allColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(6.r))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'AED',
                          style: context.bodyLarge!
                              .copyWith(color: context.onPrimaryColor),
                        ),
                        Text(
                          price,
                          style: context.headlineLarge!
                              .copyWith(color: context.onPrimaryColor),
                        ),
                      ]),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Padding(
                  padding: kTopPadding9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title, style: context.headlineLarge),
                      Text(fifty,
                          style: context.headlineLarge!
                              .copyWith(color: allColors.primaryColor)),
                    ],
                  ),
                )
              ],
            ),
          ),
          // SizedBox(height: 10.h),
          Padding(
            padding: kHorizontalPadding9,
            child: Html(
              style: {"p": context.htmlParagraphStyle},
              data: description.capitalizeFirstLetter(),
            ),
          ),

          InkWell(
            onTap: onTap,
            child: Container(
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
              child: Center(
                  child: Text(
                getItNow.capitalizeFirstLetter(),
                style: context.titleLarge!
                    .copyWith(color: context.onSecondaryColor),
              )),
            ),
          )
        ],
      ),
    );
  }
}
