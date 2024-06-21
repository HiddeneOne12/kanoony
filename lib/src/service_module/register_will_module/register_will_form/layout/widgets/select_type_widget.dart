// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/src/dashboard_screen/provider/dashboard_provider.dart';
import '../../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';
import '../../../provider/register_will_provider.dart';

class SelectTypeWidget extends StatefulWidget {
  WillState willVar;
  DashboardState variables;
  SelectTypeWidget({super.key, required this.willVar, required this.variables});

  @override
  State<SelectTypeWidget> createState() => _SelectTypeWidgetState();
}

class _SelectTypeWidgetState extends State<SelectTypeWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        widget.willVar.selectedType =
            widget.variables.staticData?.oneWillRegistration ?? '';
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 0.h, bottom: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.willVar.selectedType =
                      widget.variables.staticData?.oneWillRegistration;
                });
              },
              child: Container(
                height: 43.h,
                padding: EdgeInsets.all(5.h),
                decoration: BoxDecoration(
                    color: allColors.canvasColor,
                    border: Border.all(color: allColors.canvasColor),
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: isArabic ? 0 : 10.h,
                          right: isArabic ? 10.h : 0.h),
                      child: Container(
                          height: 17.h,
                          width: 17.h,
                          decoration: BoxDecoration(
                              color: widget.willVar.selectedType ==
                                      widget.variables.staticData
                                          ?.oneWillRegistration
                                  ? allColors.primaryColor
                                  : allColors.disabledColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
                          child: widget.willVar.selectedType ==
                                  widget
                                      .variables.staticData?.oneWillRegistration
                              ? Icon(
                                  Icons.check,
                                  color: allColors.textColor,
                                  size: 14.h,
                                )
                              : null),
                    ),
                    Flexible(
                      child: CommonTextWidget(
                          color: allColors.textColor,
                          size: 14.sp,
                          text: widget
                                  .variables.staticData?.oneWillRegistration ??
                              '',
                          weight: FontWeight.w700,
                          padding: EdgeInsets.only(
                              left: isArabic ? 0 : 5.h,
                              top: 5.h,
                              right: isArabic ? 5.h : 0)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.willVar.selectedType =
                      widget.variables.staticData?.mirrorWillRegistration;
                });
              },
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                decoration: BoxDecoration(
                    color: allColors.canvasColor,
                    border: Border.all(color: allColors.canvasColor),
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: isArabic ? 0 : 10.h,
                          right: isArabic ? 10.h : 0.h),
                      child: Container(
                          height: 17.h,
                          width: 17.h,
                          decoration: BoxDecoration(
                              color: widget.willVar.selectedType ==
                                      widget.variables.staticData
                                          ?.mirrorWillRegistration
                                  ? allColors.primaryColor
                                  : allColors.disabledColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
                          child: widget.willVar.selectedType ==
                                  widget.variables.staticData
                                      ?.mirrorWillRegistration
                              ? Icon(
                                  Icons.check,
                                  color: allColors.textColor,
                                  size: 14.h,
                                )
                              : null),
                    ),
                    Flexible(
                      child: CommonTextWidget(
                          color: allColors.textColor,
                          size: 14.sp,
                          text: widget.variables.staticData
                                  ?.mirrorWillRegistration ??
                              '',
                          weight: FontWeight.w700,
                          padding: EdgeInsets.only(
                              left: isArabic ? 0 : 5.h,
                              top: 5.h,
                              right: isArabic ? 5.h : 0)),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
