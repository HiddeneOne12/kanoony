// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/src/faq_screen/model/get_faq_listing.dart';

import '../../../../core/common_widgets/common_text_widget.dart';
import '../../../../core/constants/object_constants/object_constants.dart';

class FaqCardListing extends StatefulWidget {
  List<FaqsUseModel> faqs;
  FaqCardListing({super.key, required this.faqs});

  @override
  State<FaqCardListing> createState() => _FaqCardListingState();
}

class _FaqCardListingState extends State<FaqCardListing> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
          itemCount: widget.faqs.length,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 0.h),
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            var data = widget.faqs[index];
            return Padding(
                padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 7.h),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
                  decoration: BoxDecoration(
                    color: allColors.canvasColor,
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            if (selectedIndex != index) {
                              selectedIndex = index;
                            } else {
                              selectedIndex = -1;
                            }
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: CommonTextWidget(
                                  color: allColors.primaryColor,
                                  size: 14.sp,
                                  text: "${index + 1}",
                                  align: TextAlign.start,
                                  weight: FontWeight.w700,
                                  padding: EdgeInsets.only(top: 0.h)),
                            ),
                            Expanded(
                                flex: 10,
                                child: CommonTextWidget(
                                    color: allColors.textColor,
                                    size: 14.sp,
                                    align: TextAlign.start,
                                    text: data.questions,
                                    weight: FontWeight.w500,
                                    padding: EdgeInsets.only(top: 0.h))),
                            Padding(
                              padding: EdgeInsets.only(bottom: 5.h),
                              child: Container(
                                height: 22.h,
                                width: 22.h,
                                decoration: BoxDecoration(
                                    color: allColors.darkGreyColor,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50.r))),
                                child: Icon(
                                  selectedIndex == index
                                      ? Icons.keyboard_arrow_up
                                      : Icons.keyboard_arrow_down,
                                  color: allColors.textColor,
                                  size: 13.h,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (selectedIndex == index) ...[
                        Html(
                          style: {
                            "p": Style(
                                padding: HtmlPaddings.only(left: 0, right: 0),
                                color: allColors.textColor,
                                fontSize: FontSize(11.sp),
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Tajawal'),
                          },
                          data: data.answers,
                        ),
                      ],
                    ],
                  ),
                ));
          },
        ),
      ],
    );
  }
}
