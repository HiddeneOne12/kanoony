// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/src/dashboard_screen/provider/dashboard_provider.dart';
import 'package:kanoony/src/service_module/trademark_module/provider/trademark_provider.dart';

import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../../core/constants/values.dart';

class ProductOrServiceWidget extends StatefulWidget {
  TradeMarkState trademarkVar;
  DashboardState variables;
  ProductOrServiceWidget(
      {super.key, required this.trademarkVar, required this.variables});

  @override
  State<ProductOrServiceWidget> createState() => _ProductOrServiceWidgetState();
}

class _ProductOrServiceWidgetState extends State<ProductOrServiceWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      setState(() {
        widget.trademarkVar.selectedServiceOrProduct =
            widget.variables.staticData?.product ?? '';
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
                  widget.trademarkVar.selectedServiceOrProduct =
                      widget.variables.staticData?.product;
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
                      padding: EdgeInsets.only(left: 10.h),
                      child: Container(
                          height: 17.h,
                          width: 17.h,
                          decoration: BoxDecoration(
                              color: widget.trademarkVar
                                          .selectedServiceOrProduct ==
                                      widget.variables.staticData?.product
                                  ? context.primaryColor
                                  : appTheme.disabledColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
                          child: widget.trademarkVar.selectedServiceOrProduct ==
                                  widget.variables.staticData?.product
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
                        widget.variables.staticData?.product ?? '',
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
                  widget.trademarkVar.selectedServiceOrProduct =
                      widget.variables.staticData?.service;
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
                              color: widget.trademarkVar
                                          .selectedServiceOrProduct ==
                                      widget.variables.staticData?.service
                                  ? context.primaryColor
                                  : appTheme.disabledColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3.r))),
                          child: widget.trademarkVar.selectedServiceOrProduct ==
                                  widget.variables.staticData?.service
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
                        widget.variables.staticData?.service ?? '',
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
