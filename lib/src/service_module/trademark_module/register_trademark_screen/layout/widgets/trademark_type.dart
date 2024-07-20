// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/src/dashboard_screen/provider/dashboard_provider.dart';
import 'package:kanoony/src/service_module/trademark_module/provider/trademark_provider.dart';

import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';

class TradeMarkTypeWidget extends StatefulWidget {
  TradeMarkState trademarkVar;
  DashboardState variables;
  TradeMarkTypeWidget(
      {super.key, required this.trademarkVar, required this.variables});

  @override
  State<TradeMarkTypeWidget> createState() => _TradeMarkTypeWidgetState();
}

class _TradeMarkTypeWidgetState extends State<TradeMarkTypeWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        widget.trademarkVar.selectedTrademarkType =
            widget.variables.staticData?.wordMark ?? '';
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
                  widget.trademarkVar.selectedTrademarkType =
                      widget.variables.staticData?.wordMark;
                });
              },
              child: Container(
                height: 43.h,
                padding: EdgeInsets.all(5.h),
                decoration: BoxDecoration(
                    color: context.onPrimaryColor,
                    border: Border.all(color: context.onPrimaryColor),
                    borderRadius: kBorderRadius6),
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
                              color:
                                  widget.trademarkVar.selectedTrademarkType ==
                                          widget.variables.staticData?.wordMark
                                      ? context.primaryColor
                                      : appTheme.disabledColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
                          child: widget.trademarkVar.selectedTrademarkType ==
                                  widget.variables.staticData?.wordMark
                              ? Icon(
                                  Icons.check,
                                  color: context.onSurfaceColor,
                                  size: 14.h,
                                )
                              : null),
                    ),
                    Flexible(
                        child: Padding(
                      padding: EdgeInsets.only(
                          left: isArabic ? 0 : 5.h,
                          top: 5.h,
                          right: isArabic ? 5.h : 0),
                      child: Text(
                        widget.variables.staticData?.wordMark ?? '',
                        style: context.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    )),
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
                  widget.trademarkVar.selectedTrademarkType =
                      widget.variables.staticData?.logo;
                });
              },
              child: Container(
                height: 43.h,
                padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                decoration: BoxDecoration(
                    color: context.onPrimaryColor,
                    border: Border.all(color: context.onPrimaryColor),
                    borderRadius: kBorderRadius6),
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
                              color:
                                  widget.trademarkVar.selectedTrademarkType ==
                                          widget.variables.staticData?.logo
                                      ? context.primaryColor
                                      : appTheme.disabledColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
                          child: widget.trademarkVar.selectedTrademarkType ==
                                  widget.variables.staticData?.logo
                              ? Icon(
                                  Icons.check,
                                  color: context.onSurfaceColor,
                                  size: 14.h,
                                )
                              : null),
                    ),
                    Flexible(
                        child: Padding(
                      padding: EdgeInsets.only(
                          left: isArabic ? 0 : 5.h,
                          top: 5.h,
                          right: isArabic ? 5.h : 0),
                      child: Text(
                        widget.variables.staticData?.logo ?? '',
                        style: context.bodyMedium
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    )),
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
