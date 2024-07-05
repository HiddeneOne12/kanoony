import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/src/auth_module/login_screen/login_screen.dart';
import 'package:kanoony/src/dashboard_screen/layout/widgets/shimmer.dart';
import 'dart:ui' as Ui;
import '../../../core/common_widgets/common_appbar.dart';
import '../../../core/common_widgets/common_confirmation_dialog.dart';
import '../../../core/common_widgets/common_payment_popup.dart';
import '../../../core/common_widgets/common_snackbar_widget.dart';
import '../../../core/common_widgets/common_text_widget.dart';
import '../../../core/constants/image_paths/image_paths.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';
import '../../../core/routing/routing_config.dart';
import '../../favorite_screen/favorite_screen.dart';
import '../../document_module/my_documents_screen/my_document_screen.dart';
import '../../packages_screen/layout/widgets/package_cards.dart';
import 'widgets/home_package_cards.dart';
import '../../../core/common_widgets/service_cards.dart';
import 'package:intl/intl.dart';

class LoggedInDashboardBody extends ConsumerStatefulWidget {
  const LoggedInDashboardBody({super.key});

  @override
  ConsumerState<LoggedInDashboardBody> createState() =>
      _LoggedInDashboardBodyState();
}

class _LoggedInDashboardBodyState extends ConsumerState<LoggedInDashboardBody> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref
          .read(allProviderList.userProfileProvider.notifier)
          .sendUserDetailRequest();
      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendNotificationPostRequest();
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void scrollForward() {
    scrollController.animateTo(
      scrollController.offset + 500, // Scroll forward by 100 pixels
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void scrollBackward() {
    scrollController.animateTo(
      scrollController.offset - 500, // Scroll backward by 100 pixels
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);

    var userVariables = ref.watch(allProviderList.userProfileProvider);
    var packageProvider = ref.read(allProviderList.packageProvider.notifier);

    return Directionality(
        textDirection: isArabic ? Ui.TextDirection.rtl : Ui.TextDirection.ltr,
        child: userProfileHelper.userData.id.isNotEmpty
            ? SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonAppBar(
                      height: 0.16,
                      isBack: false,
                      isFilter: true,
                      isBlogTextField: false,
                      isDashboard: true,
                      isButton: false,
                      isTextfield: false,
                      mainText: dashboardVariables.staticData?.dashboard ?? '',
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
                          height: 0.76.sh,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h),
                                CommonTextWidget(
                                    color: allColors.textColor,
                                    size: 20.sp,
                                    text:
                                        'HELLO ${userProfileHelper.userData.name.toUpperCase()}',
                                    weight: FontWeight.w700,
                                    padding: EdgeInsets.only(
                                        left: 16.h, right: 16.h)),
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
                                            left: 16.h, right: 16.h, top: 10.h),
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: [
                                          ServiceCard(
                                              onTap: () async {
                                                RoutesUtils.context.push(
                                                    MyDocumentScreen
                                                        .myDocumentRoute);
                                              },
                                              icon: SvgImagesAssetPath.myDocSvg,
                                              text: dashboardVariables
                                                      .staticData
                                                      ?.myDocuments ??
                                                  ''),
                                          ServiceCard(
                                              onTap: () async {
                                                RoutesUtils.context.push(
                                                    FavoriteScreen
                                                        .favoriteRoute);
                                              },
                                              icon:
                                                  SvgImagesAssetPath.favDocSvg,
                                              text: dashboardVariables
                                                      .staticData
                                                      ?.myFavorites ??
                                                  ''),
                                        ],
                                      ),
                                SizedBox(height: 10.h),
                                if (userProfileHelper.userData.packageName !=
                                    'null') ...[
                                userVariables.isLoading
                                    ? SizedBox.shrink() :  CommonTextWidget(
                                      color: allColors.textColor,
                                      size: 20.sp,
                                      text: dashboardVariables
                                              .staticData?.currentPackage
                                              ?.toUpperCase() ??
                                          '',
                                      weight: FontWeight.w700,
                                      padding: EdgeInsets.only(
                                          left: 16.h, right: 16.h)),
                                ] else ...[
                                  Padding(
                                    padding: EdgeInsets.only(
                                        right: isArabic ? 0 : 16.h,
                                        left: isArabic ? 16.h : 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: CommonTextWidget(
                                              color: allColors.textColor,
                                              size: 20.sp,
                                              text: dashboardVariables
                                                      .staticData
                                                      ?.contractTemplatePackages
                                                      ?.toUpperCase() ??
                                                  '',
                                              weight: FontWeight.w500,
                                              padding: EdgeInsets.only(
                                                  right: isArabic ? 0 : 20.h,
                                                  left: isArabic ? 135.h : 0)),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 10.h),
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              50.r))),
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              50.r))),
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
                                ],
                                userVariables.isLoading
                                    ? const ShimmerPackageCard()
                                    : userVariables.userProfile?.packageName ==
                                            "null"
                                        ? SizedBox(
                                            height: 286.h,
                                            child: ListView.builder(
                                              itemCount: dashboardVariables
                                                  .allPackages.length,
                                              controller: scrollController,
                                              padding: EdgeInsets.all(0.h),
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              physics:
                                                  const AlwaysScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                var data = dashboardVariables
                                                    .allPackages[index];
                                                return SizedBox(
                                                  width: 1.sw,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      if (userProfileHelper
                                                          .userData
                                                          .id
                                                          .isEmpty) {
                                                        await paymentPopUp(
                                                            context,
                                                            ref,
                                                            data,
                                                            userProfileHelper
                                                                    .userData
                                                                    .id
                                                                    .isEmpty
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
                                                                  .userData
                                                                  .packageName !=
                                                              "null" ||
                                                          userProfileHelper
                                                                      .userData
                                                                      .remainingDocument !=
                                                                  "0" &&
                                                              DateTime.now().isAfter(DateTime.tryParse(
                                                                      userProfileHelper
                                                                          .userData
                                                                          .packageExpiry) ??
                                                                  DateTime
                                                                      .now())) {
                                                        showSnackBarMessage(
                                                            content:
                                                                "You have already subscribed a package!",
                                                            backgroundColor:
                                                                allColors
                                                                    .primaryColor,
                                                            contentColor:
                                                                allColors
                                                                    .canvasColor);
                                                      } else {
                                                        await paymentPopUp(
                                                            context,
                                                            ref,
                                                            data,
                                                            userProfileHelper
                                                                    .userData
                                                                    .id
                                                                    .isEmpty
                                                                ? true
                                                                : false,
                                                            '',
                                                            true,
                                                            '',
                                                            '',
                                                            '');
                                                      }
                                                    },
                                                    child: PackageCard(
                                                      onTap: () async {
                                                        if (userProfileHelper
                                                            .userData
                                                            .id
                                                            .isEmpty) {
                                                          await paymentPopUp(
                                                              context,
                                                              ref,
                                                              data,
                                                              userProfileHelper
                                                                      .userData
                                                                      .id
                                                                      .isEmpty
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
                                                                    .userData
                                                                    .packageName !=
                                                                "null" ||
                                                            userProfileHelper
                                                                        .userData
                                                                        .remainingDocument !=
                                                                    "0" &&
                                                                DateTime.now().isAfter(DateTime.tryParse(userProfileHelper
                                                                        .userData
                                                                        .packageExpiry) ??
                                                                    DateTime
                                                                        .now())) {
                                                          showSnackBarMessage(
                                                              content:
                                                                  "You have already subscribed a package!",
                                                              backgroundColor:
                                                                  allColors
                                                                      .primaryColor,
                                                              contentColor:
                                                                  allColors
                                                                      .canvasColor);
                                                        } else {
                                                          await paymentPopUp(
                                                              context,
                                                              ref,
                                                              data,
                                                              userProfileHelper
                                                                      .userData
                                                                      .id
                                                                      .isEmpty
                                                                  ? true
                                                                  : false,
                                                              '',
                                                              true,
                                                              '',
                                                              '',
                                                              '');
                                                        }
                                                      },
                                                      fifty: dashboardVariables
                                                              .staticData
                                                              ?.saveMoreThan_50 ??
                                                          '',
                                                      price:
                                                          data.price.toString(),
                                                      title: data.title,
                                                      description:
                                                          data.description,
                                                      getItNow: dashboardVariables
                                                              .staticData
                                                              ?.monthlyAction ??
                                                          '',
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        : CurrentPackageCard(
                                            resubscribe: () async {
                                              await paymentPopUp(
                                                  context,
                                                  ref,
                                                  null,
                                                  userProfileHelper
                                                          .userData.id.isEmpty
                                                      ? true
                                                      : false,
                                                  '',
                                                  true,
                                                  userVariables.userProfile
                                                          ?.packageName ??
                                                      '',
                                                  userVariables.userProfile
                                                          ?.packageId ??
                                                      '',
                                                  userVariables.userProfile
                                                          ?.packagePrice ??
                                                      '');
                                            },
                                            onCancel: () async {
                                              String formattedDate = DateFormat(
                                                      'd MMMM, yyyy')
                                                  .format(DateTime.tryParse(
                                                          userVariables
                                                                  .userProfile
                                                                  ?.packageExpiry ??
                                                              '2024-07-07') ??
                                                      DateTime.now());
                                              confirmationDialogBox(
                                                  RoutesUtils.context,
                                                  () async {
                                                await packageProvider
                                                    .sendCancelSubscriptionRequest();
                                                print("call");
                                              }, 'If you cancel now, you can still access your subscription until $formattedDate.');
                                            },
                                            remainingDoc: userVariables
                                                    .userProfile
                                                    ?.remainingDocument ??
                                                '',
                                            getItNow: dashboardVariables
                                                    .staticData
                                                    ?.monthlyAction ??
                                                '',
                                            cancelNow: dashboardVariables
                                                    .staticData
                                                    ?.cancelSubscription ??
                                                '',
                                            expiryDate: userVariables
                                                    .userProfile
                                                    ?.packageExpiry ??
                                                '',
                                            price: userVariables.userProfile
                                                    ?.packagePrice ??
                                                '',
                                            title: userVariables
                                                    .userProfile?.packageName ??
                                                '',
                                            description: userVariables
                                                    .userProfile
                                                    ?.packageDetailEn ??
                                                '',
                                            status: userVariables.userProfile
                                                    ?.subscriptionStatus ??
                                                ''),
                                SizedBox(height: 50.h),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonAppBar(
                    height: 0.16,
                    isBack: false,
                    isFilter: true,
                    isBlogTextField: false,
                    isDashboard: true,
                    isButton: false,
                    isTextfield: false,
                    mainText: dashboardVariables.staticData?.dashboard ?? '',
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
                        height: 0.5.sh,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 0.34.sh),
                              CommonTextWidget(
                                  color: allColors.textColor,
                                  size: 20.sp,
                                  text:
                                      'To access this screen you need to sign in',
                                  weight: FontWeight.w700,
                                  padding: EdgeInsets.only(
                                      left: 16.h, right: 16.h, bottom: 10.h)),
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 16.h, right: 16.h),
                                child: CommonButton(
                                    text: "SIGN IN",
                                    backgroundColor: allColors.primaryColor,
                                    onPressed: () {
                                      RoutesUtils.context
                                          .go(LoginScreen.loginRoute);
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ));
  }
      bool _isSubscribed() {
    return userProfileHelper.userData.id.isNotEmpty  && userProfileHelper.userData.packageName != "null" ||
        userProfileHelper.userData.remainingDocument != "0" &&
            DateTime.now().isAfter(
                DateTime.tryParse(userProfileHelper.userData.packageExpiry) ??
                    DateTime.now());
  }
}
