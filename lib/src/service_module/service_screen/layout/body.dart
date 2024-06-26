// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/trademark_screen.dart';

import '../../../../core/common_widgets/common_appbar.dart';
import '../../../../core/common_widgets/common_text_widget.dart';
import '../../../../core/constants/image_paths/image_paths.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../../core/routing/routing_config.dart';
import '../../business_service_module/business_setup_screen/business_setup_screen.dart';
import '../../../../core/common_widgets/service_cards.dart';
import '../../../dashboard_screen/layout/widgets/shimmer.dart';
import '../../document_translate_screen/document_translate_screen.dart';
import '../../golden_visa_screen/golden_visa_screen.dart';

class ServicesBody extends ConsumerStatefulWidget {
  bool isHome;
  ServicesBody({super.key, required this.isHome});

  @override
  ConsumerState<ServicesBody> createState() => _ServicesBodyState();
}

class _ServicesBodyState extends ConsumerState<ServicesBody> {
  @override
  Widget build(BuildContext context) {
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            mainText: 'Corporate Services',
            subText: '',
            height: 0.16,
            isBack: widget.isHome ? false : true,
            isBlogTextField: false,
            isFilter: false,
            isButton: false,
            isDashboard: widget.isHome ? true : false,
            isTextfield: false,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.3.sw),
                child: Image.asset(
                  PngImagePaths.dashboardDesignImg,
                  height: 326.65.h,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                height: 0.795.sh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextWidget(
                          color: allColors.textColor,
                          size: 20.sp,
                          text:
                              dashboardVariables.staticData?.corporateService ??
                                  '',
                          weight: FontWeight.w500,
                          padding: EdgeInsets.only(left: 16.h, right: 16.h)),
                      Padding(
                        padding: EdgeInsets.only(
                            left: isArabic ? 0.91.sw : 16.h,
                            right: isArabic ? 16.h : 0.91.sw),
                        child: Divider(
                          color: allColors.primaryColor,
                          thickness: 1.w,
                          height: 1.h,
                        ),
                      ),
                      dashboardVariables.areLoaded
                          ? const GridShimmer()
                          : GridView.count(
                              crossAxisCount: 2,
                              shrinkWrap: true,
                              childAspectRatio: 1.76,
                              crossAxisSpacing: 7.h,
                              padding: EdgeInsets.only(
                                  left: 16.h, right: 16.h, top: 10.h),
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                ServiceCard(
                                    onTap: () async {
                                      RoutesUtils.context.push(
                                          BusinessSetupScreen
                                              .businessSetupRoute);
                                    },
                                    icon: SvgImagesAssetPath.businessSvg,
                                    text: dashboardVariables
                                            .staticData?.setupABusiness ??
                                        ''),
                                ServiceCard(
                                    onTap: () {
                                      RoutesUtils.context
                                          .push(TradeMarkScreen.trademarkRoute);
                                    },
                                    icon: SvgImagesAssetPath.tradeMarkSvg,
                                    text: dashboardVariables
                                            .staticData?.registerATrademark ??
                                        ''),
                                ServiceCard(
                                    onTap: () {},
                                    icon: SvgImagesAssetPath.willSvg,
                                    text: dashboardVariables
                                            .staticData?.registerAWill ??
                                        ''),
                                ServiceCard(
                                    onTap: () {
                                      RoutesUtils.context.push(
                                          DocTranslateScreen.docTranslateRoute);
                                    },
                                    icon: SvgImagesAssetPath.documentSvg,
                                    text: dashboardVariables
                                            .staticData?.translateADocument ??
                                        ''),
                                ServiceCard(
                                    onTap: () {
                                      RoutesUtils.context
                                          .push(GoldenVisaScreen.visaRoute);
                                    },
                                    icon: SvgImagesAssetPath.visaSvg,
                                    text: dashboardVariables
                                            .staticData?.goldenVisa ??
                                        ''),
                              ],
                            ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
