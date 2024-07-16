// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/document_module/free_document_screen/free_document_screen.dart';

import '../../src/service_module/widgets/request_callback_popup.dart';
import '../constants/object_constants/object_constants.dart';
import '../constants/static_constants/static_constants.dart';
import '../constants/values.dart';
import '../helpers/pascal_case_converter.dart';
import 'common_text_widget.dart';

class CallBackButton extends ConsumerStatefulWidget {
  const CallBackButton({super.key});

  @override
  ConsumerState<CallBackButton> createState() => _CallBackButtonState();
}

class _CallBackButtonState extends ConsumerState<CallBackButton> {
  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    return Padding(
      padding: kMainBodyPadding,
      child: InkWell(
        onTap: () async {
          await requestCallBackPopUp(context, ref, true, false);
        },
        child: Container(
          height: 36.h,
          width: 181.h,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 5.h),
          decoration: BoxDecoration(
              color: allColors.primaryColor, borderRadius: kBorderRadius6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Icon(
                  Icons.call,
                  size: 14.h,
                  color: context.onPrimaryColor,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                capitalizeFirst(variables.staticData?.requestACallBack ?? ''),
                style:
                    context.labelLarge?.copyWith(color: context.onPrimaryColor),
                textAlign: TextAlign.center,
              ),
              // CommonTextWidget(
              //   color: allColors.canvasColor,
              //   size: 16.sp,
              //   text: variables.staticData?.requestACallBack ?? '',
              //   weight: FontWeight.w500,
              //   align: TextAlign.start,
              //   padding: noPadding,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class FreeTemplateButton extends ConsumerStatefulWidget {
  const FreeTemplateButton({super.key});

  @override
  ConsumerState<FreeTemplateButton> createState() => _FreeTemplateButtonState();
}

class _FreeTemplateButtonState extends ConsumerState<FreeTemplateButton> {
  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h),
      child: InkWell(
        onTap: () async {
          RoutesUtils.context.push(FreeDocumentScreen.freeDocumentRoute);
        },
        child: Container(
          height: 36.h,
          width: 181.h,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 5.h),
          decoration: BoxDecoration(
              color: allColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(6.r))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextWidget(
                color: allColors.canvasColor,
                size: 13.sp,
                text: variables.staticData?.browseFreeDocuments ?? '',
                weight: FontWeight.w500,
                align: TextAlign.start,
                padding: noPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClickHereButton extends ConsumerStatefulWidget {
  void Function()? onTap;
  ClickHereButton({super.key, required this.onTap});

  @override
  ConsumerState<ClickHereButton> createState() => _ClickHereButtonState();
}

class _ClickHereButtonState extends ConsumerState<ClickHereButton> {
  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h),
      child: InkWell(
        onTap: widget.onTap,
        child: Container(
          height: 36.h,
          width: 181.h,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: 5.h),
          decoration: BoxDecoration(
              color: allColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(6.r))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonTextWidget(
                color: allColors.canvasColor,
                size: 13.sp,
                text: variables.staticData?.clickHere ?? '',
                weight: FontWeight.w500,
                align: TextAlign.start,
                padding: noPadding,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
