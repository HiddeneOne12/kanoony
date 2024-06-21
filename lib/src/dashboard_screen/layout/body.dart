// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_appbar.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/dashboard_screen/layout/widgets/shimmer.dart';
import 'package:kanoony/src/document_module/paid_document_screen/paid_doucment_screen.dart';
import 'package:kanoony/src/service_module/document_translate_screen/document_translate_screen.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/trademark_screen.dart';
import '../../../core/common_widgets/common_payment_popup.dart';
import '../../service_module/business_service_module/business_setup_screen/business_setup_screen.dart';
import '../../document_module/free_document_screen/free_document_screen.dart';
import '../../packages_screen/layout/widgets/package_cards.dart';
import '../../service_module/golden_visa_screen/golden_visa_screen.dart';
import '../../service_module/register_will_module/register_will_screen/register_will_screen.dart';
import '../../../core/common_widgets/service_cards.dart';
import 'dart:ui' as Ui;

class DashBoardBody extends ConsumerStatefulWidget {
  const DashBoardBody({super.key});

  @override
  ConsumerState<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends ConsumerState<DashBoardBody> {
  List<String> icons = [
    PngImagePaths.agentImg,
    PngImagePaths.teamImg,
    PngImagePaths.building2Img,
    PngImagePaths.handImg,
    PngImagePaths.technologyImg,
    PngImagePaths.marketImg,
  ];
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      //   if (userProfileHelper.userData.id.isNotEmpty) {
      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendNotificationPostRequest();
      await ref
          .read(allProviderList.userProfileProvider.notifier)
          .sendUserDetailRequest();
      // }
      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendGetMenuContentRequest();
      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendGetQuickLinkCategoriesRequest();
      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendGetStaticContentRequest();
      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendGetHomeContentRequest();
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);

    return Directionality(
      textDirection: isArabic ? Ui.TextDirection.rtl : Ui.TextDirection.ltr,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dashboardVariables.areLoaded
                ? const ShimmerAppBar()
                : CommonAppBar(
                    height:
                        dashboardVariables.searchedDoc.isEmpty ? 0.21 : 0.35,
                    isBack: false,
                    isFilter: true,
                    isBlogTextField: false,
                    isDashboard: true,
                    isButton: false,
                    isTextfield: true,
                    mainText:
                        dashboardVariables.staticData?.corporateService ?? '',
                    subText: '',
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
                SizedBox(
                  height: 0.7.sh,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 20.sp,
                            text: dashboardVariables
                                    .staticData?.contractTemplates ??
                                '',
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(left: 16.h, right: 16.h)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: isArabic ? 0.91.sw : 16.h,
                              right: isArabic ? 16.h : 0.91.sw),
                          child: Divider(
                            height: 1.h,
                            color: allColors.primaryColor,
                            thickness: 1.w,
                          ),
                        ),
                        dashboardVariables.areLoaded
                            ? const GridShimmer()
                            : GridView.builder(
                                padding: EdgeInsets.only(
                                    left: 15.h, right: 15.h, top: 10.h),
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 1.76,
                                  crossAxisSpacing: 7.h,
                                ),
                                shrinkWrap: true,
                                itemCount:
                                    dashboardVariables.quickLinks!.length,
                                itemBuilder: (context, index) {
                                  var data =
                                      dashboardVariables.quickLinks![index];
                                  return ServiceCard(
                                      isPng: true,
                                      onTap: () async {
                                        RoutesUtils.context.push(
                                          PaidDocumentScreen.paidDocumentRoute,
                                          extra: {
                                            TextUtils.slug: data.slug.toString()
                                          },
                                        );
                                      },
                                      icon: icons[index],
                                      text: data.title);
                                },
                              ),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 20.sp,
                            text: dashboardVariables
                                    .staticData?.corporateService ??
                                '',
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(left: 16.h, right: 16.h)),
                        Padding(
                          padding: EdgeInsets.only(
                              left: isArabic ? 0.91.sw : 16.h,
                              right: isArabic ? 16.h : 0.91.sw),
                          child: Divider(
                            height: 1.h,
                            color: allColors.primaryColor,
                            thickness: 1.w,
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
                                    left: 15.h, right: 15.h, top: 10.h),
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
                                        RoutesUtils.context.push(
                                            TradeMarkScreen.trademarkRoute);
                                      },
                                      icon: SvgImagesAssetPath.tradeMarkSvg,
                                      text: dashboardVariables
                                              .staticData?.registerATrademark ??
                                          ''),
                                  ServiceCard(
                                      onTap: () {
                                        RoutesUtils.context
                                            .push(RegisterWillScreen.willRoute);
                                      },
                                      icon: SvgImagesAssetPath.willSvg,
                                      text: dashboardVariables
                                              .staticData?.registerAWill ??
                                          ''),
                                  ServiceCard(
                                      onTap: () {
                                        RoutesUtils.context.push(
                                            DocTranslateScreen
                                                .docTranslateRoute);
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
                                  ServiceCard(
                                      onTap: () {
                                        RoutesUtils.context.push(
                                            FreeDocumentScreen
                                                .freeDocumentRoute);
                                      },
                                      icon: SvgImagesAssetPath.paperSvg,
                                      text: dashboardVariables
                                              .staticData?.freeDocuments ??
                                          ''),
                                ],
                              ),
                        SizedBox(height: 10.h),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 20.sp,
                            text: dashboardVariables.staticData?.package ?? '',
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(left: 16.h, right: 16.h)),
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 5.h,
                              left: isArabic ? 0.91.sw : 16.h,
                              right: isArabic ? 16.h : 0.91.sw),
                          child: Divider(
                            color: allColors.primaryColor,
                            thickness: 1.w,
                            height: 1.h,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        dashboardVariables.isLoaded
                            ? const ShimmerPackageCard()
                            : ListView.builder(
                                itemCount:
                                    dashboardVariables.allPackages.length,
                                padding: EdgeInsets.all(0.h),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var data =
                                      dashboardVariables.allPackages[index];
                                  return InkWell(
                                    onTap: () async {
                                      await paymentPopUp(
                                          context,
                                          ref,
                                          data,
                                          userProfileHelper.userData.id.isEmpty
                                              ? true
                                              : false,
                                          '',
                                          true);
                                    },
                                    child: PackageCard(
                                      fifty: dashboardVariables
                                              .staticData?.saveMoreThan_50 ??
                                          '',
                                      price: data.price.toString(),
                                      title: data.title,
                                      description: data.description,
                                      getItNow: dashboardVariables
                                              .staticData?.monthlyAction ??
                                          '',
                                    ),
                                  );
                                },
                              ),
                        SizedBox(height: 50.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
