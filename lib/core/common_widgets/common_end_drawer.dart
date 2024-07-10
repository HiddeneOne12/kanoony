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
import '../../src/service_module/document_translate_screen/document_translate_screen.dart';
import '../constants/static_constants/static_constants.dart';
import '../helpers/pascal_case_converter.dart';

class AppEndProfileDrawer {
    appEndDrawer(BuildContext context, WidgetRef ref) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    var provider = ref.read(allProviderList.dashboardProvider.notifier);
    return PopScope(
      onPopInvoked: (didPop) {
            provider.disposeEndDrawerValue();
           },
      child: Drawer(
        backgroundColor: allColors.popUpColor,
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
                              weight: variables.isLegal ? FontWeight.w700 : FontWeight.w500,
                              color: variables.isLegal
                                  ? allColors.primaryColor
                                  : allColors.textColor,
                              text: 
                                  capitalizeFirst(variables.menuContent.first.menuTitle),
                              onTap: () {
                                setState(() {
                                  variables.isLegal = !variables.isLegal;
                                });
                              },
                            ),
                          ),
                          if (variables.isLegal) ...[
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20.h,
                                right: 20.h,
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 10.h),
                                decoration: BoxDecoration(
                                    color: allColors.drawerColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r))),
                                child: ListView.builder(
                                  itemCount:
                                      variables.menuContent[0].categories.length,
                                  padding: EdgeInsets.only(bottom: 5.h),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var data = variables
                                        .menuContent[0].categories[index];
                                    return Column(
                                      children: [
                                        DrawerItem(
                                          padding: 0.06,
                                          isIcon: true,
                                          text: capitalizeFirst(data.categoryName),
                                          onTap: () {
                                            setState(() {
                                              if (index == 0) {
                                                variables.isLegalTem = !variables.isLegalTem;
                                              } else if (index == 1) {
                                                variables.isLegalTrans = !variables.isLegalTrans;
                                              }
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                        if (variables.isLegalTem && index == 0) ...[
                                          ListView.builder(
                                            itemCount: variables.menuContent[0]
                                                .categories[0].menus.length,
                                            padding: EdgeInsets.only(
                                                bottom: 10.h,
                                                left: 16.h,
                                                right: 16.h),
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              var data = variables.menuContent[0]
                                                  .categories[0].menus[index];
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(bottom: 10.h),
                                                child: Container(
                                                  padding: EdgeInsets.only(top:12.h,left: 10.w,right: 10.w,bottom: 8.h),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          allColors.canvasColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(  
                                                                  10.r))),
                                                  child: DrawerItem(
                                                    padding: 0.06,
                                                    isIcon: false,
                                                    text: capitalizeFirst(
                                                        data.menuTitle),
                                                    onTap: () {
                                                      RoutesUtils.context.push(
                                                        MenuDocumentScreen
                                                            .menuDocumentRoute,
                                                        extra: {
                                                          TextUtils.slug:
                                                              data.menuSlug
                                                        },
                                                      );
                                                      setState(() {
                                                        provider.searchController
                                                            .clear();
                                                        variables.searchedDoc =
                                                            [];
                                                      });
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ] else if (variables.isLegalTrans &&
                                            index == 1) ...[
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
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                    bottom: 10.h,
                                                    left: 16.h,
                                                    right: 16.h),
                                                child: Container(
                                                   padding: EdgeInsets.only(top:12.h,left: 10.w,right: 10.w,bottom: 8.h),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          allColors.canvasColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10.r))),
                                                  child: DrawerItem(
                                                    padding: 0.06,
                                                    isIcon: false,
                                                    text: capitalizeFirst(
                                                        data.menuTitle),
                                                    onTap: () {
                                                      RoutesUtils.context.push(
                                                          DocTranslateScreen
                                                              .docTranslateRoute);
                                                    },
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ],
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                          if (!variables.isLegal) ...[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.h,
                                  right: 20.h,
                                  bottom: 10.h,
                                  top: 0.h),
                              child: Divider(
                                color: allColors.drawerDividerColor,
                                thickness: 1.w,
                                height: 1.h,
                              ),
                            ),
                          ] else ...[
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                          Padding(
                            padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                            child: DrawerItem(
                              padding: 0.06,
                              isIcon: true,
                              color: variables.isSetup
                                  ? allColors.primaryColor
                                  : allColors.textColor,
                              weight: variables.isSetup ? FontWeight.w700 : FontWeight.w500,
                              text: capitalizeFirst( variables
                                  .menuContent[1].categories[0].categoryName),
                              onTap: () {
                                setState(() {
                                    variables.isSetup = !variables.isSetup;
                                });
                              },
                            ),
                          ),
                          if (variables.isSetup) ...[
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20.h,
                                right: 20.h,
                              ),
                              child: Container(
                                padding: EdgeInsets.only(top: 10.h),
                                decoration: BoxDecoration(
                                    color: allColors.drawerColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.r))),
                                child: ListView.builder(
                                  itemCount: variables
                                      .menuContent[1].categories[0].menus.length,
                                  padding: EdgeInsets.only(bottom: 0.h),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    var data = variables.menuContent[1]
                                        .categories[0].menus[index];
                                    return index != 3
                                        ? Padding(
                                            padding: EdgeInsets.only(
                                                bottom: 10.h,
                                                left: 16.h,
                                                right: 16.h),
                                            child: Container(
                                               padding: EdgeInsets.only(left: 10.w,right: 10.w,bottom: 10.h,top: 2.h
                                               ),
                                              decoration: BoxDecoration(
                                                  color: index == 3
                                                      ? allColors.drawerColor
                                                      : allColors.canvasColor,
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(10.r))),
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  if (variables.isSetup) ...[
                                                    DrawerItem(
                                                      padding: 0.06,
                                                      isIcon: false,
                                                      text: capitalizeFirst(
                                                          data.menuTitle),
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
                                                  ],
                                                ],
                                              ),
                                            ),
                                          )
                                        : const SizedBox();
                                  },
                                ),
                              ),
                            ),
                          ],
                          if (!variables.isSetup) ...[
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.h,
                                  right: 20.h,
                                  bottom: 10.h,
                                  top: 0.h),
                              child: Divider(
                                color: allColors.drawerDividerColor,
                                thickness: 1.w,
                                height: 1.h,
                              ),
                            ),
                          ] else ...[
                            SizedBox(
                              height: 10.h,
                            )
                          ],
                          ListView.builder(
                            itemCount: variables.menuContent[2].categories.length,
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
                                    color: variables.isWillReg && index == 0 ||
                                            variables.isVisa && index == 1
                                        ? allColors.primaryColor
                                        : allColors.textColor,
                                    weight: variables.isWillReg && index == 0 ||
                                            variables.isVisa && index == 1
                                        ? FontWeight.w700
                                        : FontWeight.w500,
                                    text: capitalizeFirst(data.categoryName),
                                    onTap: () {
                                      setState(() {
                                        if (index == 0) {
                                          variables.isWillReg = !variables.isWillReg;
                                        } else if (index == 1) {
                                          variables.isVisa = !variables.isVisa;
                                        }
                                      });
                                    },
                                  ),
                                  if (variables.isWillReg && index == 0) ...[
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 20.h,
                                        right: 20.h,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10.h),
                                        decoration: BoxDecoration(
                                            color: allColors.drawerColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.r))),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 10.h,
                                              left: 16.h,
                                              right: 16.h),
                                          child: Container(
                                             padding: EdgeInsets.only(top:12.h,left: 10.w,right: 10.w,bottom: 8.h),
                                            decoration: BoxDecoration(
                                                color: allColors.canvasColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.r))),
                                            child: DrawerItem(
                                              padding: 0.06,
                                              isIcon: false,
                                              text: capitalizeFirst(
                                                  data.menus[0].menuTitle),
                                              onTap: () {
                                                RoutesUtils.context.push(
                                                    RegisterWillScreen.willRoute);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                  if (index != 1) ...[
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
                                  ],
                                  if (variables.isVisa && index == 1) ...[
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 20.h,
                                        right: 20.h,
                                      ),
                                      child: Container(
                                        padding: EdgeInsets.only(top: 10.h),
                                        decoration: BoxDecoration(
                                            color: allColors.drawerColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.r))),
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              bottom: 10.h,
                                              left: 16.h,
                                              right: 16.h),
                                          child: Container(
                                             padding: EdgeInsets.only(top:12.h,left: 10.w,right: 10.w,bottom: 8.h),
                                            decoration: BoxDecoration(
                                                color: allColors.canvasColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10.r))),
                                            child: DrawerItem(
                                              padding: 0.06,
                                              isIcon: false,
                                              text: capitalizeFirst(
                                                  data.menus[0].menuTitle),
                                              onTap: () {
                                                RoutesUtils.context.push(
                                                    GoldenVisaScreen.visaRoute);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ]
                                ],
                              );
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
      ),
    );
  }
}
