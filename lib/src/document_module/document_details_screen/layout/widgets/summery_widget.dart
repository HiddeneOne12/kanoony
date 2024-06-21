// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/src/document_module/document_details_screen/provider/doc_detail_provider.dart';

import '../../../../../core/constants/object_constants/object_constants.dart';

class SummeryWidget extends StatelessWidget {
  DocDetailState variable;
  SummeryWidget({super.key, required this.variable});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            EdgeInsets.only(left: 16.h, right: 16.h, bottom: 0.h, top: 10.h),
        child: Container(
          alignment: Alignment.center,
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h, bottom: 0.h),
          decoration: BoxDecoration(
            color: allColors.canvasColor,
            border: Border.all(color: allColors.canvasColor, width: 1.w),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Html(
                style: {
                  "p": Style(
                      padding: HtmlPaddings.only(left: 0.h, right: 0.h),
                      color: allColors.textColor,
                      fontSize: FontSize(13.sp),
                      fontWeight: FontWeight.w400,
                      textAlign: TextAlign.justify,
                      fontFamily: 'Tajawal'),
                },
                data: variable.content?.summary ?? '',
              ),
            ],
          ),
        ));
  }
}
