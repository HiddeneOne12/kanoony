// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
import 'package:kanoony/src/document_module/document_details_screen/provider/doc_detail_provider.dart';

import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';

class DescriptionWidget extends ConsumerStatefulWidget {
  DocDetailState variable;
  DescriptionWidget({super.key, required this.variable});

  @override
  ConsumerState<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends ConsumerState<DescriptionWidget> {
  bool selectedDescription = true;
  @override
  Widget build(BuildContext context) {
    var dashboard = ref.watch(allProviderList.dashboardProvider);
    return Padding(
        padding:
            EdgeInsets.only(left: 16.h, right: 16.h, bottom: 0.h, top: 10.h),
        child: Container(
          alignment: Alignment.center,
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
          decoration: BoxDecoration(
            color: context.onPrimaryColor,
            border: Border.all(color: context.onPrimaryColor, width: 1.w),
            borderRadius: kBorderRadius10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedDescription = !selectedDescription;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 10,
                        child: CommonTextWidget(
                            color: allColors.textColor,
                            size: 18.sp,
                            align: TextAlign.start,
                            text: capitalizeFirst(
                                dashboard.staticData?.description ?? ''),
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(left: 0.h, right: 0.h))),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Container(
                        height: 22.h,
                        width: 22.h,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r))),
                        child: Icon(
                          selectedDescription
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: allColors.textColor,
                          size: 20.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedDescription) ...[
                Html(
                  style: {
                    "body": Style(
                        color: allColors.textColor,
                        margin: Margins.zero,
                        padding: HtmlPaddings.zero,
                        fontSize: FontSize(16),
                        fontWeight: FontWeight.w400,
                        fontFamily: 'Tajawal'),
                    "p": Style(
                        padding: HtmlPaddings.only(left: 0.h, right: 0.h),
                        color: allColors.textColor,
                        fontSize: FontSize(16),
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.justify,
                        fontFamily: 'Tajawal'),
                  },
                  data: widget.variable.content?.content ?? '',
                ),
              ],
            ],
          ),
        ));
  }
}
