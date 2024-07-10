// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/src/dashboard_screen/provider/dashboard_provider.dart';
import 'package:kanoony/src/service_module/trademark_module/provider/trademark_provider.dart';

import '../../../../../../core/common_widgets/common_img_button_widget.dart';
import '../../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../../core/routing/routing_config.dart';
import '../../../../../faq_screen/faq_screen.dart';
import '../../../../widgets/faq_button.dart';

class FooterWidget extends ConsumerStatefulWidget {
  DashboardState variables;
  TradeMarkNotifier provider;
  FooterWidget({super.key, required this.variables, required this.provider});

  @override
  ConsumerState<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends ConsumerState<FooterWidget> {
  @override
  Widget build(BuildContext context) {
    var variable = ref.watch(allProviderList.tradeMarkProvider);
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
          color: allColors.primaryColor,
          image: const DecorationImage(
              image: AssetImage(PngImagePaths.buildingImg))),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h),
            child: Html(
              style: {
                "span": Style(
                    margin: Margins.zero,
                    padding: HtmlPaddings.zero,
                    textAlign: TextAlign.center,
                    color: allColors.textColor,
                    fontSize: FontSize(18.sp),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Tajawal'),
                "body": Style(
                    color: allColors.textColor,
                    margin: Margins.zero,
                    padding: HtmlPaddings.zero,
                    textAlign: TextAlign.center,
                    fontSize: FontSize(18.sp),
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Tajawal'),
              },
              data: widget.variables.staticData
                      ?.downloadUaeTrademarkLawNiceClassification  ??
                  '',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 33.h, right: 33.h, top: 10.h),
            child: Row(
              children: [
                Expanded(
                  child: CommonImgButtonWidget(
                      padding: noPadding,
                      fontColor: allColors.canvasColor,
                      height: 36.h,
                      onTap: () {
                        widget.provider.downloadFile(
                            'https://kanoony.com/trad/images/New-Trademark-Law-UAE.docx');
                      },
                      backgroundColor: allColors.textColor,
                      borderColor: allColors.textColor,
                      radius: 6.r,
                      icon: Icon(
                        Icons.download,
                        color: allColors.canvasColor,
                        size: 16.h,
                      ),
                      text: widget.variables.staticData?.trademarkLaw ?? '',
                      isLoading: variable.isLoading2),
                ),
                SizedBox(
                  width: 15.h,
                ),
                Expanded(
                  child: CommonImgButtonWidget(
                      padding: noPadding,
                      fontColor: allColors.canvasColor,
                      height: 36.h,
                      onTap: () {
                        widget.provider.downloadFile(
                            'https://kanoony.com/trad/images/12th-Edition-of%20Nice-Classification-Class-Headings.pdf');
                      },
                      backgroundColor: allColors.textColor,
                      borderColor: allColors.textColor,
                      radius: 6.r,
                      icon: Icon(
                        Icons.download,
                        color: allColors.canvasColor,
                        size: 16.h,
                      ),
                      text:
                          widget.variables.staticData?.niceClassification ?? '',
                      isLoading: variable.isLoading),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          FaqButton(
            onTap: () {
              RoutesUtils.context.push(
                FaqScreen.faqRoute,
                extra: {
                  TextUtils.isBusiness: false,
                  TextUtils.isFreeZone: false,
                  TextUtils.isMainland: false,
                  TextUtils.isOffshore: false,
                  TextUtils.isTrademark: true
                },
              );
            },
            isCallIcon: false,
            backgroundColor: allColors.textColor,
          ),
        ],
      ),
    );
  }
}
