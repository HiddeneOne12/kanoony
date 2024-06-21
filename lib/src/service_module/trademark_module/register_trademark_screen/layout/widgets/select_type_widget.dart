// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/src/dashboard_screen/provider/dashboard_provider.dart';
import 'package:kanoony/src/service_module/trademark_module/provider/trademark_provider.dart';

import '../../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';

class SelectTypeWidget extends StatefulWidget {
  TradeMarkState trademarkVar;
  DashboardState variables;
  SelectTypeWidget(
      {super.key, required this.trademarkVar, required this.variables});

  @override
  State<SelectTypeWidget> createState() => _SelectTypeWidgetState();
}

class _SelectTypeWidgetState extends State<SelectTypeWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        widget.trademarkVar.selectedType =
            widget.variables.staticData?.registerATrademark ?? '';
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 16.h, right: 16.h, top: 20.h, bottom: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  widget.trademarkVar.selectedType =
                      widget.variables.staticData?.registerATrademark;
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
                              color: widget.trademarkVar.selectedType ==
                                      widget.variables.staticData
                                          ?.registerATrademark
                                  ? allColors.primaryColor
                                  : allColors.disabledColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
                          child: widget.trademarkVar.selectedType ==
                                  widget
                                      .variables.staticData?.registerATrademark
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
                          text:
                              widget.variables.staticData?.registerATrademark ??
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
                  widget.trademarkVar.selectedType =
                      widget.variables.staticData?.searchATrademark;
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
                              color: widget.trademarkVar.selectedType ==
                                      widget.variables.staticData
                                          ?.searchATrademark
                                  ? allColors.primaryColor
                                  : allColors.disabledColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
                          child: widget.trademarkVar.selectedType ==
                                  widget.variables.staticData?.searchATrademark
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
                          text: widget.variables.staticData?.searchATrademark ??
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
