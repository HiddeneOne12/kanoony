// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_draweritem.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/auth_module/login_screen/login_screen.dart';
import 'package:kanoony/src/dashboard_screen/dashboard_screen.dart';
import 'package:kanoony/src/faq_screen/faq_screen.dart';
import 'package:kanoony/src/favorite_screen/favorite_screen.dart';
import 'package:kanoony/src/document_module/my_documents_screen/my_document_screen.dart';
import 'package:kanoony/src/privacy_policy_screen/privacy_screen.dart';
import 'package:kanoony/src/terms_of_use/terms_of_use_screen.dart';
import 'package:kanoony/src/user_profile_screen/user_profile_screen.dart';

import 'common_confirmation_dialog.dart';

class AppMenuProfileDrawer {
  Drawer appProfileDrawer(BuildContext context, WidgetRef ref) {
    var provider = ref.read(allProviderList.dashboardProvider.notifier);
    var dashboard = ref.read(allProviderList.dashboardProvider);
    var profile = ref.watch(allProviderList.userProfileProvider);
    return Drawer(
      backgroundColor: allColors.primaryColor.withOpacity(0.9),
      width: 0.65.sw,
      child: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: isArabic ? 0 : 0.52.sw,
                  top: 0.05.sh,
                  right: isArabic ? 0.52.sw : 0),
              child: InkWell(
                  onTap: () {
                    RoutesUtils.context.pop();
                  },
                  child: Icon(
                    Icons.close,
                    size: 35.h,
                    color: allColors.textColor,
                  )),
            ),
            SizedBox(
              height: 0.05.sh,
            ),
            InkWell(
              onTap: () {
                RoutesUtils.context.push(UserProfileScreen.profileRoute);
                print(userProfileHelper.userData.profilePhotoUrl);
              },
              child: CachedNetworkImage(
                imageUrl: profile.userProfile?.profilePhotoUrl ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  height: 75.h,
                  width: 75.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: allColors.textColor,
                    borderRadius: BorderRadius.all(Radius.circular(100.r)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    SizedBox(
                        height: 60.w,
                        width: 60.w,
                        child: Center(
                          child: CircularProgressIndicator.adaptive(
                            value: downloadProgress.progress,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor),
                          ),
                        )),
                errorWidget: (context, url, error) => Container(
                  height: 75.h,
                  width: 75.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: allColors.textColor,
                      borderRadius: BorderRadius.all(Radius.circular(100.r))),
                  child: Icon(
                    Icons.person,
                    size: 20.h,
                    color: allColors.canvasColor,
                  ),
                ),
              ),
            ),

            CommonTextWidget(
                color: allColors.textColor,
                size: 24.sp,
                text: userProfileHelper.userData.name.isNotEmpty
                    ? userProfileHelper.userData.name
                    : 'Guest User',
                weight: FontWeight.w700,
                padding: EdgeInsets.only(top: 15.h, bottom: 5.h)),
            Padding(
              padding: EdgeInsets.only(left: 55.h, right: 55.h),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      if (isArabic) {
                        await provider.changeLanguage(false);
                      } else {
                        RoutesUtils.context.pop();
                        showSnackBarMessage(
                            content: translation.defaultLangMess,
                            backgroundColor: allColors.primaryColor,
                            contentColor: allColors.canvasColor);
                      }
                    },
                    child: Container(
                      height: 36.h,
                      width: 70.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isArabic
                              ? allColors.transparentColor
                              : allColors.textColor,
                          border: Border.all(
                              color: allColors.textColor, width: 1.w),
                          borderRadius: BorderRadius.all(Radius.circular(4.r))),
                      child: CommonTextWidget(
                          color: isArabic
                              ? allColors.textColor
                              : allColors.canvasColor,
                          size: 13.sp,
                          text: 'ENGLISH',
                          weight: FontWeight.w600,
                          padding: EdgeInsets.only(top: 5.h)),
                    ),
                  )),
                  SizedBox(width: 8.w),
                  Expanded(
                      child: InkWell(
                    onTap: () async {
                      if (!isArabic) {
                        await provider.changeLanguage(true);
                      } else {
                        RoutesUtils.context.pop();
                        showSnackBarMessage(
                            content: translation.defaultLangMess,
                            backgroundColor: allColors.primaryColor,
                            contentColor: allColors.canvasColor);
                      }
                    },
                    child: Container(
                      height: 36.h,
                      width: 70.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: isArabic
                              ? allColors.textColor
                              : allColors.transparentColor,
                          border: Border.all(
                              color: allColors.textColor, width: 1.w),
                          borderRadius: BorderRadius.all(Radius.circular(4.r))),
                      child: CommonTextWidget(
                          color: isArabic
                              ? allColors.canvasColor
                              : allColors.textColor,
                          size: 13.sp,
                          text: 'ARABIC',
                          weight: FontWeight.w600,
                          padding: EdgeInsets.only(top: 5.h)),
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 0.05.sh,
            ),
            DrawerItem(
              text: dashboard.staticData?.dashboard ?? '',
              onTap: () {
                index = 4;
                RoutesUtils.context.push(DashBoardScreen.dashboardRoute);
              },
              padding: 0.1,
            ),
            SizedBox(
              height: 25.h,
            ),
            userProfileHelper.userData.id.isNotEmpty
                ? DrawerItem(
                    text: dashboard.staticData?.myDocuments ?? '',
                    onTap: () async {
                      if (userProfileHelper.userData.id.isNotEmpty) {
                        RoutesUtils.context
                            .push(MyDocumentScreen.myDocumentRoute);
                      }
                    },
                    padding: 0.1,
                  )
                : SizedBox(),
            userProfileHelper.userData.id.isNotEmpty
                ? SizedBox(
                    height: 25.h,
                  )
                : SizedBox(),
            userProfileHelper.userData.id.isNotEmpty
                ? DrawerItem(
                    padding: 0.1,
                    text: dashboard.staticData?.myFavorites ?? '',
                    onTap: () {
                      if (userProfileHelper.userData.id.isNotEmpty) {
                        RoutesUtils.context.push(FavoriteScreen.favoriteRoute);
                      }

                      //  RoutesUtils.context.pop();
                    },
                  )
                : SizedBox(),
            userProfileHelper.userData.id.isNotEmpty
                ? SizedBox(
                    height: 25.h,
                  )
                : SizedBox(),
            DrawerItem(
              padding: 0.1,
              text: 'Privacy Policy',
              onTap: () {
                RoutesUtils.context.push(PrivacyScreen.privacyRoute);
              },
            ),
            SizedBox(
              height: 25.h,
            ),
            DrawerItem(
              padding: 0.1,
              text: 'Terms of Use',
              onTap: () {
                RoutesUtils.context.push(TermsOfUseScreen.termOfUseRoute);
              },
            ),
            SizedBox(
              height: 25.h,
            ),
            DrawerItem(
              padding: 0.1,
              text: 'Settings',
              onTap: () {
                RoutesUtils.context.pop();
              },
            ),
            SizedBox(
              height: 25.h,
            ),
            DrawerItem(
              padding: 0.1,
              text: dashboard.staticData?.faq ?? '',
              onTap: () {
                RoutesUtils.context.push(
                  FaqScreen.faqRoute,
                  extra: {
                    TextUtils.isBusiness: false,
                    TextUtils.isFreeZone: false,
                    TextUtils.isMainland: false,
                    TextUtils.isOffshore: false,
                    TextUtils.isTrademark: false
                  },
                );
              },
            ),
            SizedBox(
              height: 25.h,
            ),
            userProfileHelper.userData.id.isNotEmpty
                ? DrawerItem(
                    padding: 0.1,
                    text: 'Logout',
                    onTap: () {
                      confirmationDialogBox(RoutesUtils.context, () async {
                        RoutesUtils.context.pop();
                        await provider.logOutRequest();
                        print("call");
                      }, 'Are you sure you want to logout?');
                    })
                : DrawerItem(
                    padding: 0.1,
                    text: dashboard.staticData?.signIn ?? '',
                    onTap: () {
                      RoutesUtils.context.push(LoginScreen.loginRoute);
                    }),

            // SizedBox(
            //   height: 25.h,
            // ),
            // DrawerItem(
            //   padding: 0.1,
            //   text: 'FAQ',
            //   onTap: () {
            //     RoutesUtils.context.pop();
            //   },
            // ),
            // SizedBox(
            //   height: 25.h,
            // ),
            // DrawerItem(
            //   padding: 0.1,
            //   text: 'COOKIES POLICY',
            //   onTap: () {
            //     RoutesUtils.context.pop();
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
