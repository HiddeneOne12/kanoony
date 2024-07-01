// ignore_for_file: annotate_overrides

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_appbar.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/dashboard_screen/layout/widgets/shimmer.dart';
import 'package:kanoony/src/document_module/paid_document_screen/paid_doucment_screen.dart';
import 'package:kanoony/src/service_module/document_translate_screen/document_translate_screen.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/trademark_screen.dart';
import '../../../core/common_widgets/common_payment_popup.dart';
import '../../service_module/business_service_module/business_setup_screen/business_setup_screen.dart';
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
  final ScrollController _scrollController = ScrollController();
  final ScrollController scrollController2 = ScrollController();
  late Timer _timer;
  bool _scrollingForward = true;
  void initState() {
    _startAutoScroll();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      //   if (userProfileHelper.userData.id.isNotEmpty) {
      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendGetStaticContentRequest();
      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendGetHomeContentRequest();
      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendGetMenuContentRequest();
      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendGetQuickLinkCategoriesRequest();

      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendNotificationPostRequest();
      await ref
          .read(allProviderList.userProfileProvider.notifier)
          .sendUserDetailRequest();
      // }
    });
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    scrollController2.dispose();
    super.dispose();
  }

  void scrollForward() {
    scrollController2.animateTo(
      scrollController2.offset + 500, // Scroll forward by 100 pixels
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollBackward() {
    scrollController2.animateTo(
      scrollController2.offset - 500, // Scroll backward by 100 pixels
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (_scrollController.hasClients) {
        double maxScrollExtent = _scrollController.position.maxScrollExtent;
        double minScrollExtent = _scrollController.position.minScrollExtent;
        double currentOffset = _scrollController.offset;

        if (_scrollingForward) {
          if (currentOffset >= maxScrollExtent) {
            _scrollingForward = false;
          } else {
            _scrollController.animateTo(
              currentOffset + 3.0,
              duration: const Duration(milliseconds: 30),
              curve: Curves.linear,
            );
          }
        } else {
          if (currentOffset <= minScrollExtent) {
            _scrollingForward = true;
          } else {
            _scrollController.animateTo(
              currentOffset - 3.0,
              duration: const Duration(milliseconds: 30),
              curve: Curves.linear,
            );
          }
        }
      }
    });
  }

  Widget build(BuildContext context) {
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);
    var dashboardProvider =
        ref.read(allProviderList.dashboardProvider.notifier);
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
                  height: 0.82.sh,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 20.sp,
                            text: dashboardVariables
                                    .staticData?.contractTemplates
                                    ?.toUpperCase() ??
                                '',
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(
                                left: 16.h,
                                right: 16.h,
                                bottom: 10.h,
                                top: 10.h)),
                        dashboardVariables.areLoaded
                            ? const GridShimmer()
                            : Container(
                                height: 110.h,
                                padding:
                                    EdgeInsets.only(left: 16.h, right: 16.h),
                                child: ListView.builder(
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  controller: _scrollController,
                                  shrinkWrap: true,
                                  itemCount:
                                      dashboardVariables.quickLinks!.length,
                                  itemBuilder: (context, index) {
                                    var data =
                                        dashboardVariables.quickLinks![index];
                                    return InkWell(
                                      onTap: () {
                                        RoutesUtils.context.push(
                                          PaidDocumentScreen.paidDocumentRoute,
                                          extra: {
                                            TextUtils.slug: data.slug.toString()
                                          },
                                        );
                                        setState(() {
                                          dashboardProvider.searchController
                                              .clear();
                                          dashboardVariables.searchedDoc = [];
                                        });
                                      },
                                      child: SizedBox(
                                        width: 169.h,
                                        child: ServiceCard(
                                            isPng: true,
                                            onTap: () {
                                              RoutesUtils.context.push(
                                                PaidDocumentScreen
                                                    .paidDocumentRoute,
                                                extra: {
                                                  TextUtils.slug:
                                                      data.slug.toString()
                                                },
                                              );
                                            },
                                            icon: icons[index],
                                            text: toPascalCase(data.title)),
                                      ),
                                    );
                                  },
                                ),
                              ),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 20.sp,
                            text: dashboardVariables
                                    .staticData?.corporateService
                                    ?.toUpperCase() ??
                                '',
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(
                                left: 16.h, right: 16.h, top: 10.h)),
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
                                      text: toPascalCase(dashboardVariables
                                              .staticData?.setupABusiness ??
                                          '')),
                                  ServiceCard(
                                      onTap: () {
                                        RoutesUtils.context.push(
                                            TradeMarkScreen.trademarkRoute);
                                      },
                                      icon: SvgImagesAssetPath.tradeMarkSvg,
                                      text: toPascalCase(dashboardVariables
                                              .staticData?.registerATrademark ??
                                          '')),
                                  ServiceCard(
                                      onTap: () {
                                        RoutesUtils.context
                                            .push(RegisterWillScreen.willRoute);
                                      },
                                      icon: SvgImagesAssetPath.willSvg,
                                      text: toPascalCase(dashboardVariables
                                              .staticData?.registerAWill ??
                                          '')),
                                  ServiceCard(
                                      onTap: () {
                                        RoutesUtils.context.push(
                                            DocTranslateScreen
                                                .docTranslateRoute);
                                      },
                                      icon: SvgImagesAssetPath.documentSvg,
                                      text: toPascalCase(dashboardVariables
                                              .staticData?.translateADocument ??
                                          '')),
                                  ServiceCard(
                                      onTap: () {
                                        RoutesUtils.context
                                            .push(GoldenVisaScreen.visaRoute);
                                      },
                                      icon: SvgImagesAssetPath.visaSvg,
                                      text: toPascalCase(dashboardVariables
                                              .staticData?.goldenVisa ??
                                          '')),
                                ],
                              ),
                        SizedBox(height: 10.h),
                        Padding(
                          padding: EdgeInsets.only(
                              right: isArabic ? 0 : 16.h,
                              left: isArabic ? 16.h : 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CommonTextWidget(
                                    color: allColors.textColor,
                                    size: 20.sp,
                                    text: dashboardVariables.staticData
                                            ?.contractTemplatePackages
                                            ?.toUpperCase() ??
                                        '',
                                    weight: FontWeight.w500,
                                    padding: EdgeInsets.only(
                                        right: isArabic ? 0 : 20.h,
                                        left: isArabic ? 135.h : 0)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 10.h),
                                child: InkWell(
                                  onTap: () {
                                    scrollBackward();
                                  },
                                  child: Container(
                                    height: 25.h,
                                    width: 25.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: allColors.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50.r))),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: isArabic ? 0 : 3.h,
                                          right: isArabic ? 3.h : 0),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: allColors.textColor,
                                        size: 12.h,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(bottom: 9.h),
                                child: InkWell(
                                  onTap: () {
                                    scrollForward();
                                  },
                                  child: Container(
                                    height: 25.h,
                                    width: 25.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: allColors.primaryColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50.r))),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: isArabic ? 0 : 3.h,
                                          right: isArabic ? 3.h : 0),
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: allColors.textColor,
                                        size: 12.h,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 5.h),
                        dashboardVariables.isLoaded
                            ? const ShimmerPackageCard()
                            : SizedBox(
                                height: 286.h,
                                child: ListView.builder(
                                  itemCount:
                                      dashboardVariables.allPackages.length,
                                  controller: scrollController2,
                                  padding: EdgeInsets.all(0.h),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  physics:
                                      const AlwaysScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var data =
                                        dashboardVariables.allPackages[index];
                                    return SizedBox(
                                      width: 1.sw,
                                      child: InkWell(
                                        onTap: () async {
                                          await paymentPopUp(
                                              context,
                                              ref,
                                              data,
                                              userProfileHelper
                                                      .userData.id.isEmpty
                                                  ? true
                                                  : false,
                                              '',
                                              true);
                                        },
                                        child: PackageCard(
                                          fifty: dashboardVariables.staticData
                                                  ?.saveMoreThan_50 ??
                                              '',
                                          price: data.price.toString(),
                                          title: data.title,
                                          description: data.description,
                                          getItNow: dashboardVariables
                                                  .staticData?.monthlyAction ??
                                              '',
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
