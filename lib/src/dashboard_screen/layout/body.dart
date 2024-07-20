// ignore_for_file: annotate_overrides
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/appbar_textfield.dart';
import 'package:kanoony/core/common_widgets/common_appbar.dart';
import 'package:kanoony/core/common_widgets/directionality_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/dashboard_screen/layout/widgets/home_carporate_services_widget.dart';
import 'package:kanoony/src/dashboard_screen/layout/widgets/home_packages_widget.dart';
import 'package:kanoony/src/dashboard_screen/layout/widgets/quick_links_widget.dart';
import 'package:kanoony/src/dashboard_screen/layout/widgets/shimmer.dart';
import 'package:kanoony/src/document_module/paid_document_screen/paid_doucment_screen.dart';
import 'package:kanoony/src/service_module/trademark_module/trademark_screen/trademark_screen.dart';
import '../../../core/common_widgets/common_payment_popup.dart';
import '../../../core/common_widgets/common_snackbar_widget.dart';
import 'dart:ui' as Ui;

import '../../service_module/business_service_module/business_setup_screen/business_setup_screen.dart';
import '../../service_module/document_translate_screen/document_translate_screen.dart';
import '../../service_module/golden_visa_screen/golden_visa_screen.dart';
import '../../service_module/register_will_module/register_will_screen/register_will_screen.dart';

class DashBoardBody extends ConsumerStatefulWidget {
  const DashBoardBody({super.key});

  @override
  ConsumerState<DashBoardBody> createState() => _DashBoardBodyState();
}

class _DashBoardBodyState extends ConsumerState<DashBoardBody>
    with SingleTickerProviderStateMixin {
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
  void initState() {
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

  int selectedIndex = -1;
  @override
  void dispose() {
    _scrollController.dispose();
    scrollController2.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);
    var dashboardProvider =
        ref.read(allProviderList.dashboardProvider.notifier);
    return Directionality(
      textDirection: isArabic ? Ui.TextDirection.rtl : Ui.TextDirection.ltr,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: CommonDirectionality(
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
                      child: Padding(
                        padding: kMainBodyPadding,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 40.h),
                            dashboardVariables.areLoaded
                                ? const QuickLinksShimmer()
                                : Padding(
                                    padding: kHeadlineBottomPadding,
                                    child: Text(
                                      dashboardVariables
                                              .staticData?.contractTemplates
                                              .upperCase() ??
                                          '',
                                      style: context.headlineLarge,
                                    ),
                                  ),
                            dashboardVariables.areLoaded
                                ? const QuickLinksShimmer()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      AppBarTemplateTextField(isFilter: false),
                                      Padding(
                                        padding: kSubTitlePadding,
                                        child: Text(
                                          translation.quickLinks
                                              .capitalizeFirstLetter(),
                                          style: context.titleLarge,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 105.h,
                                        child: ListView.builder(
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          controller: _scrollController,
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          itemCount: dashboardVariables
                                              .quickLinks!.length,
                                          itemBuilder: (context, index) {
                                            var data = dashboardVariables
                                                .quickLinks![index];

                                            return InkWell(
                                              onTap: () {
                                                RoutesUtils.context.push(
                                                  PaidDocumentScreen
                                                      .paidDocumentRoute,
                                                  extra: {
                                                    TextUtils.slug:
                                                        data.slug.toString()
                                                  },
                                                );
                                                setState(() {
                                                  dashboardProvider
                                                      .searchController
                                                      .clear();
                                                  dashboardVariables
                                                      .searchedDoc = [];
                                                });
                                              },
                                              child: QuickLinkWidget(
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
                                                  text: capitalizeFirst(
                                                      data.title)),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                            dashboardVariables.areLoaded
                                ? const SizedBox()
                                : Padding(
                                    padding: kSubTitlePadding,
                                    child: Text(
                                      dashboardVariables.staticData
                                              ?.contractTemplatePackages
                                              .capitalizeFirstLetter() ??
                                          '',
                                      style: context.titleLarge,
                                    ),
                                  ),
                            dashboardVariables.areLoaded
                                ? const GridShimmer()
                                : GridView.builder(
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.76,
                                      crossAxisSpacing: 7.h,
                                    ),
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount:
                                        dashboardVariables.allPackages.length,
                                    itemBuilder: (context, index) {
                                      var data =
                                          dashboardVariables.allPackages[index];
                                      return SizedBox(
                                        width: 1.sw,
                                        child: HomePackagesWidget(
                                          onTap: () async {
                                            selectedIndex = index;
                                            setState(() {});
                                            if (userProfileHelper
                                                .userData.id.isEmpty) {
                                              await paymentPopUp(
                                                  context,
                                                  ref,
                                                  data,
                                                  userProfileHelper
                                                          .userData.id.isEmpty
                                                      ? true
                                                      : false,
                                                  '',
                                                  true,
                                                  '',
                                                  '',
                                                  '');
                                              return;
                                            }
                                            if (userProfileHelper
                                                        .userData.packageName !=
                                                    "null" ||
                                                userProfileHelper.userData
                                                            .remainingDocument !=
                                                        "0" &&
                                                    DateTime.now().isAfter(
                                                        DateTime.tryParse(
                                                                userProfileHelper
                                                                    .userData
                                                                    .packageExpiry) ??
                                                            DateTime.now())) {
                                              showSnackBarMessage(
                                                  content:
                                                      "You have already subscribed a package!",
                                                  backgroundColor:
                                                      allColors.primaryColor,
                                                  contentColor:
                                                      allColors.canvasColor);
                                            } else {
                                              await paymentPopUp(
                                                  context,
                                                  ref,
                                                  data,
                                                  userProfileHelper
                                                          .userData.id.isEmpty
                                                      ? true
                                                      : false,
                                                  '',
                                                  true,
                                                  '',
                                                  '',
                                                  '');
                                            }
                                          },
                                          fifty: dashboardVariables.staticData
                                                  ?.saveMoreThan_50 ??
                                              '',
                                          price: data.price.toString(),
                                          title: data.title,
                                          description: data.description,
                                        ),
                                      );
                                    },
                                  ),
                            dashboardVariables.areLoaded
                                ? const SizedBox()
                                : Padding(
                                    padding: kHeadlineVerticalPadding,
                                    child: Text(
                                      dashboardVariables
                                              .staticData?.corporateService
                                              .upperCase() ??
                                          '',
                                      style: context.headlineLarge,
                                    ),
                                  ),
                            dashboardVariables.areLoaded
                                ? const GridShimmer()
                                : ListView(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    children: [
                                      HomeCarporateServicesWidget(
                                          onTap: () async {
                                            var variables = ref.watch(
                                                allProviderList
                                                    .dashboardProvider);
                                            var provider = ref.read(
                                                allProviderList
                                                    .dashboardProvider
                                                    .notifier);
                                            provider.searchController.clear();
                                            variables.searchedDoc = [];
                                            RoutesUtils.context.push(
                                                BusinessSetupScreen
                                                    .businessSetupRoute);
                                          },
                                          text: dashboardVariables
                                                  .staticData?.setupABusiness
                                                  .capitalizeFirstLetter() ??
                                              ''),
                                      HomeCarporateServicesWidget(
                                          onTap: () {
                                            var variables = ref.watch(
                                                allProviderList
                                                    .dashboardProvider);
                                            var provider = ref.read(
                                                allProviderList
                                                    .dashboardProvider
                                                    .notifier);
                                            provider.searchController.clear();
                                            variables.searchedDoc = [];
                                            RoutesUtils.context.push(
                                                TradeMarkScreen.trademarkRoute);
                                          },
                                          text: dashboardVariables.staticData
                                                  ?.registerATrademark
                                                  .capitalizeFirstLetter() ??
                                              ''),
                                      HomeCarporateServicesWidget(
                                          onTap: () {
                                            var variables = ref.watch(
                                                allProviderList
                                                    .dashboardProvider);
                                            var provider = ref.read(
                                                allProviderList
                                                    .dashboardProvider
                                                    .notifier);
                                            provider.searchController.clear();
                                            variables.searchedDoc = [];
                                            RoutesUtils.context.push(
                                                RegisterWillScreen.willRoute);
                                          },
                                          text: dashboardVariables
                                                  .staticData?.registerAWill
                                                  .capitalizeFirstLetter() ??
                                              ''),
                                      HomeCarporateServicesWidget(
                                          onTap: () {
                                            var variables = ref.watch(
                                                allProviderList
                                                    .dashboardProvider);
                                            var provider = ref.read(
                                                allProviderList
                                                    .dashboardProvider
                                                    .notifier);
                                            provider.searchController.clear();
                                            variables.searchedDoc = [];
                                            RoutesUtils.context.push(
                                                DocTranslateScreen
                                                    .docTranslateRoute);
                                          },
                                          text: dashboardVariables.staticData
                                                  ?.translateADocument
                                                  .capitalizeFirstLetter() ??
                                              ''),
                                      HomeCarporateServicesWidget(
                                          onTap: () {
                                            var variables = ref.watch(
                                                allProviderList
                                                    .dashboardProvider);
                                            var provider = ref.read(
                                                allProviderList
                                                    .dashboardProvider
                                                    .notifier);
                                            provider.searchController.clear();
                                            variables.searchedDoc = [];
                                            RoutesUtils.context.push(
                                                GoldenVisaScreen.visaRoute);
                                          },
                                          text: dashboardVariables
                                                  .staticData?.goldenVisa
                                                  .capitalizeFirstLetter() ??
                                              ''),
                                    ],
                                  ),
                            SizedBox(height: 50.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
