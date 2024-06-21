// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_draweritem.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_freezone_screen/business_setup_freezone_screen.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_mainland_screen/business_setup_mainland_screen.dart';
import 'package:kanoony/src/service_module/business_service_module/business_setup_offshore_screen/business_setup_offshore_screen.dart';
import 'package:kanoony/src/document_module/menu_document_screen/menu_document_screen.dart';
import 'package:kanoony/src/service_module/golden_visa_screen/golden_visa_screen.dart';

import 'package:kanoony/src/service_module/register_will_module/register_will_screen/register_will_screen.dart';
import '../../src/packages_screen/package_screen.dart';
import '../../src/service_module/document_translate_screen/document_translate_screen.dart';
import '../constants/static_constants/static_constants.dart';

bool isService = false;
bool isLegal = false;
bool isLegalTem = false;
bool isLegalTrans = false;
bool isBusiness = false;
bool isSetup = false;
bool isWillReg = false;
bool isVisa = false;

class AppEndProfileDrawer {
  Drawer appEndDrawer(BuildContext context, WidgetRef ref) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    return Drawer(
      backgroundColor: allColors.canvasColor,
      width: 0.8.sw,
      child: StatefulBuilder(builder: (context, setState) {
        return Directionality(
          textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: isArabic ? 0.63.sw : 0,
                      top: 0.05.sh,
                      right: isArabic ? 0 : 0.63.sw),
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
                  height: 30.h,
                ),
                SizedBox(
                  height: 0.85.sh,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: DrawerItem(
                            padding: 0.06,
                            isIcon: true,
                            weight: isLegal ? FontWeight.w700 : FontWeight.w500,
                            color: isLegal
                                ? allColors.primaryColor
                                : allColors.textColor,
                            text: variables.menuContent.first.menuTitle,
                            onTap: () {
                              setState(() {
                                isLegal = !isLegal;
                              });
                            },
                          ),
                        ),
                        if (isLegal) ...[
                          ListView.builder(
                            itemCount:
                                variables.menuContent[0].categories.length,
                            padding: EdgeInsets.only(bottom: 5.h),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var data =
                                  variables.menuContent[0].categories[index];
                              return Column(
                                children: [
                                  DrawerItem(
                                    padding: 0.06,
                                    isIcon: true,
                                    weight: isLegalTem && index == 0
                                        ? FontWeight.w700
                                        : isLegalTrans && index == 1
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                    text: data.categoryName,
                                    onTap: () {
                                      setState(() {
                                        if (index == 0) {
                                          isLegalTem = !isLegalTem;
                                        } else if (index == 1) {
                                          isLegalTrans = !isLegalTrans;
                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  if (isLegalTem && index == 0) ...[
                                    ListView.builder(
                                      itemCount: variables.menuContent[0]
                                          .categories[0].menus.length,
                                      padding: EdgeInsets.only(bottom: 10.h),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var data = variables.menuContent[0]
                                            .categories[0].menus[index];
                                        return Column(
                                          children: [
                                            DrawerItem(
                                              padding: 0.06,
                                              isIcon: false,
                                              text: data.menuTitle,
                                              onTap: () {
                                                RoutesUtils.context.push(
                                                  MenuDocumentScreen
                                                      .menuDocumentRoute,
                                                  extra: {
                                                    TextUtils.slug:
                                                        data.menuSlug
                                                  },
                                                );
                                              },
                                            ),
                                            Padding(
                                                padding: EdgeInsets.only(
                                                    left: 20.h,
                                                    right: 20.h,
                                                    top: 5.h,
                                                    bottom: data.menuTitle ==
                                                            'Terms, conditions, privacy policy & disclaimer templates'
                                                        ? 0
                                                        : 10.h),
                                                child: Divider(
                                                  color: allColors
                                                      .drawerDividerColor,
                                                  thickness: 1.w,
                                                  height: 1.h,
                                                ))
                                          ],
                                        );
                                      },
                                    ),
                                  ] else if (isLegalTrans && index == 1) ...[
                                    ListView.builder(
                                      itemCount: variables.menuContent[0]
                                          .categories[1].menus.length,
                                      padding: EdgeInsets.only(bottom: 0.h),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var data = variables.menuContent[0]
                                            .categories[1].menus[index];
                                        return DrawerItem(
                                          padding: 0.06,
                                          isIcon: false,
                                          text: data.menuTitle,
                                          onTap: () {
                                            RoutesUtils.context.push(
                                                DocTranslateScreen
                                                    .docTranslateRoute);
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ],
                              );
                            },
                          ),
                        ],
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.h, right: 20.h, bottom: 10.h, top: 0.h),
                          child: Divider(
                            color: allColors.drawerDividerColor,
                            thickness: 1.w,
                            height: 1.h,
                          ),
                        ),
                        DrawerItem(
                          padding: 0.06,
                          isIcon: true,
                          weight:
                              isBusiness ? FontWeight.w700 : FontWeight.w500,
                          color: isBusiness
                              ? allColors.primaryColor
                              : allColors.textColor,
                          text: variables.menuContent[1].menuTitle,
                          onTap: () {
                            setState(() {
                              isBusiness = !isBusiness;
                            });
                          },
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        if (isBusiness) ...[
                          DrawerItem(
                            padding: 0.06,
                            isIcon: true,
                            weight: isSetup ? FontWeight.w700 : FontWeight.w500,
                            text: variables
                                .menuContent[1].categories[0].categoryName,
                            onTap: () {
                              setState(() {
                                if (variables.menuContent[1].categories[0]
                                        .categoryName ==
                                    'SETUP YOUR COMPANY') {
                                  isSetup = !isSetup;
                                }
                              });
                            },
                          ),
                          if (isSetup) ...[
                            ListView.builder(
                              itemCount: variables
                                  .menuContent[1].categories[0].menus.length,
                              padding: EdgeInsets.only(bottom: 0.h),
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var data = variables
                                    .menuContent[1].categories[0].menus[index];
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    if (isSetup &&
                                        data.menuTitle != 'Guide me ') ...[
                                      DrawerItem(
                                        padding: 0.06,
                                        isIcon: false,
                                        text: data.menuTitle,
                                        onTap: () {
                                          if (index == 0) {
                                            RoutesUtils.context.push(
                                                BusinessSetupOffshoreScreen
                                                    .businessSetupOffshoreRoute);
                                          } else if (index == 1) {
                                            RoutesUtils.context.push(
                                                BusinessSetupFreeZoneScreen
                                                    .businessSetupRoute);
                                          } else if (index == 2) {
                                            RoutesUtils.context.push(
                                                BusinessSetupMainLandScreen
                                                    .businessSetupMainLandRoute);
                                          }
                                        },
                                      ),
                                      if (index != 2) ...[
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 20.h,
                                                right: 20.h,
                                                top: 10.h,
                                                bottom: 0.h),
                                            child: Divider(
                                              color:
                                                  allColors.drawerDividerColor,
                                              thickness: 1.w,
                                              height: 1.h,
                                            ))
                                      ],
                                    ],
                                  ],
                                );
                              },
                            ),
                          ],
                        ],
                        Padding(
                          padding: EdgeInsets.only(
                              left: 20.h, right: 20.h, bottom: 10.h, top: 0.h),
                          child: Divider(
                            color: allColors.drawerDividerColor,
                            thickness: 1.w,
                            height: 1.h,
                          ),
                        ),
                        DrawerItem(
                          padding: 0.06,
                          isIcon: true,
                          weight: isService ? FontWeight.w700 : FontWeight.w500,
                          color: isService
                              ? allColors.primaryColor
                              : allColors.textColor,
                          text: variables.menuContent[2].menuTitle,
                          onTap: () {
                            setState(() {
                              isService = !isService;
                            });
                          },
                        ),
                        if (isService) ...[
                          ListView.builder(
                            itemCount:
                                variables.menuContent[2].categories.length,
                            padding: EdgeInsets.only(bottom: 0.h),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              var data =
                                  variables.menuContent[2].categories[index];
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  DrawerItem(
                                    padding: 0.06,
                                    isIcon: true,
                                    weight: isWillReg && index == 0
                                        ? FontWeight.w700
                                        : isVisa && index == 1
                                            ? FontWeight.w700
                                            : FontWeight.w500,
                                    text: data.categoryName,
                                    onTap: () {
                                      setState(() {
                                        if (index == 0) {
                                          isWillReg = !isWillReg;
                                        } else if (index == 1) {
                                          isVisa = !isVisa;
                                        }
                                      });
                                    },
                                  ),
                                  if (isWillReg && index == 0) ...[
                                    // SizedBox(
                                    //   height: 10.h,
                                    // ),
                                    DrawerItem(
                                      padding: 0.06,
                                      isIcon: false,
                                      text: data.menus[0].menuTitle,
                                      onTap: () {
                                        RoutesUtils.context
                                            .push(RegisterWillScreen.willRoute);
                                      },
                                    ),
                                  ],
                                  //  if (isWillReg && index== 0) ...[
                                  // Padding(
                                  //     padding: EdgeInsets.only(
                                  //         left: 20.h,
                                  //         right: 20.h,
                                  //         top: 10.h,
                                  //         bottom: 10.h),
                                  //     child: Divider(
                                  //       color: allColors.drawerDividerColor,
                                  //       thickness: 1.w,
                                  //       height: 1.h,
                                  //     )),
                                  //   ],
                                  if (isVisa && index == 1) ...[
                                    DrawerItem(
                                      padding: 0.06,
                                      isIcon: false,
                                      text: data.menus[0].menuTitle,
                                      onTap: () {
                                        RoutesUtils.context
                                            .push(GoldenVisaScreen.visaRoute);
                                      },
                                    ),
                                  ]
                                ],
                              );
                            },
                          ),
                        ],
                        Padding(
                            padding: EdgeInsets.only(
                                left: 20.h,
                                right: 20.h,
                                top: 10.h,
                                bottom: 10.h),
                            child: Divider(
                              color: allColors.drawerDividerColor,
                              thickness: 1.w,
                              height: 1.h,
                            )),
                        DrawerItem(
                          padding: 0.06,
                          isIcon: false,
                          text: variables.menuContent[3].menuTitle,
                          onTap: () {
                            RoutesUtils.context
                                .push(PackageScreen.packageRoute);
                          },
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
