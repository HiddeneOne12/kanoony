// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/fav_button.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import '../../src/dashboard_screen/dashboard_screen.dart';


class CommonAppBar extends StatelessWidget {
  String mainText;
  String subText;
  bool isBack;
  bool isTextfield;
  bool isBlogTextField;
  bool isFilter;
  bool isButton;
  bool isImage;
  bool isSearch;
  double height;
  bool isDashboard;
  bool isFreeButton;
  bool isClick;
  void Function()? onClickTap = () {};
  bool isFav;
  String id;

  CommonAppBar(
      {super.key,
      required this.mainText,
      this.isFreeButton = false,
      this.isFav = false,
      this.isSearch = true,
      this.isClick = false,
      this.onClickTap,
      this.id = '',
      this.isImage = false,
      this.isDashboard = false,
      required this.isBlogTextField,
      required this.isTextfield,
      required this.isFilter,
      required this.height,
      required this.subText,
      required this.isButton,
      required this.isBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: isImage ? null : allColors.textColor,
          image: isImage
              ? DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(PngImagePaths.appBarBackgroundImg))
              : null),
      height: Platform.isIOS ? 125.h  : 100.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 0.04.sh),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                if (isBack) ...[
                  InkWell(
                    onTap: () {
                      RoutesUtils.context.pop();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isImage
                                  ? allColors.canvasColor
                                  : allColors.borderColor,
                              width: 1.w),
                          borderRadius: BorderRadius.all(Radius.circular(4.r))),
                      height: 34.h,
                      width: 37.h,
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        size: 15.h,
                        color: allColors.canvasColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                ],
                Flexible(
                  child: InkWell(
                      onTap: () {
                        index = 0;
                        RoutesUtils.context
                            .push(DashBoardScreen.dashboardRoute);
                      },
                      child: Image.asset(PngImagePaths.appLogoLightImg,
                          height: 35.h)),
                ),
                Spacer(),
                if (isFav) ...[
                  FavButton(
                    id: id,
                  ),
                  SizedBox(
                    width: 10.h,
                  )
                ],
                InkWell(
                  onTap: () {
                    if (isArabic) {
                      Scaffold.of(context).openEndDrawer();
                    } else {
                      Scaffold.of(context).openDrawer();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: isImage
                                ? allColors.canvasColor
                                : allColors.borderColor,
                            width: 1.w),
                        borderRadius: BorderRadius.all(Radius.circular(4.r))),
                    height: 34.h,
                    width: 37.h,
                    child: Icon(
                      Icons.person,
                      size: 22.h,
                      color: allColors.canvasColor,
                    ),
                  ),
                  //       ],
                ),
                SizedBox(
                  width: 10.h,
                ),
                InkWell(
                  onTap: () async {
                    if (isArabic) {
                      Scaffold.of(context).openDrawer();
                    } else {
                      Scaffold.of(context).openEndDrawer();
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: isImage
                                ? allColors.canvasColor
                                : allColors.borderColor,
                            width: 1.w),
                        borderRadius: BorderRadius.all(Radius.circular(4.r))),
                    height: 34.h,
                    width: 37.h,
                    child: Icon(
                      Icons.menu,
                      size: 22.h,
                      color: allColors.canvasColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
    
          // Padding(
          //   padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 40.h),
          //   child: Row(
          //     children: [
          //       if (isBack) ...[
          //         InkWell(
          //           onTap: () {
          //             RoutesUtils.context.pop();
          //           },
          //           child: Container(
          //             decoration: BoxDecoration(
          //                 border: Border.all(
          //                     color: allColors.canvasColor, width: 1.w),
          //                 borderRadius: BorderRadius.all(Radius.circular(4.r))),
          //             height: 34.h,
          //             width: 37.h,
          //             child: Icon(
          //               Icons.arrow_back_ios_new,
          //               size: 15.h,
          //               color: allColors.canvasColor,
          //             ),
          //           ),
          //         ),
          //         SizedBox(
          //           width: 10.w,
          //         ),
          //         InkWell(
          //           onTap: () {
          //             if (isArabic) {
          //               Scaffold.of(context).openEndDrawer();
          //             } else {
          //               Scaffold.of(context).openDrawer();
          //             }
          //           },
          //           child: Container(
          //             decoration: BoxDecoration(
          //                 border: Border.all(
          //                     color: allColors.canvasColor, width: 1.w),
          //                 borderRadius: BorderRadius.all(Radius.circular(4.r))),
          //             height: 34.h,
          //             width: 37.h,
          //             child: Icon(
          //               Icons.person,
          //               size: 22.h,
          //               color: allColors.canvasColor,
          //             ),
          //           ),
          //         ),
          //       ] else ...[
          //         InkWell(
          //           onTap: () {
          //             if (isArabic) {
          //               Scaffold.of(context).openEndDrawer();
          //             } else {
          //               Scaffold.of(context).openDrawer();
          //             }
          //           },
          //           child: Container(
          //             decoration: BoxDecoration(
          //                 border: Border.all(
          //                     color: allColors.borderColor, width: 1.w),
          //                 borderRadius: BorderRadius.all(Radius.circular(4.r))),
          //             height: 34.h,
          //             width: 37.h,
          //             child: Icon(
          //               Icons.person,
          //               size: 22.h,
          //               color: allColors.canvasColor,
          //             ),
          //           ),
          //         ),
          //       ],
          //       Expanded(
          //           child: Padding(
          //         padding: EdgeInsets.only(
          //             left: isArabic
          //                 ? isBack && !isFav
          //                     ? 0.1.sw
          //                     : 0
          //                 : 0,
          //             right: isArabic
          //                 ? 0
          //                 : isBack && !isFav
          //                     ? 0.1.sw
          //                     : 0),
          //         child: InkWell(
          //             onTap: () {
          //               index = 0;
          //               RoutesUtils.context
          //                   .push(DashBoardScreen.dashboardRoute);
          //             },
          //             child: Image.asset(PngImagePaths.appLogoLightImg,
          //                 height: 35.h)),
          //       )),
          //       if (isFav) ...[
          //         FavButton(
          //           id: id,
          //         ),
          //         SizedBox(
          //           width: 10.h,
          //         )
          //       ],
          //       InkWell(
          //         onTap: () async {
          //           if (isArabic) {
          //             Scaffold.of(context).openDrawer();
          //           } else {
          //             Scaffold.of(context).openEndDrawer();
          //           }
          //         },
          //         child: Container(
          //           decoration: BoxDecoration(
          //               border: Border.all(
          //                   color: isBack
          //                       ? allColors.canvasColor
          //                       : allColors.borderColor,
          //                   width: 1.w),
          //               borderRadius: BorderRadius.all(Radius.circular(4.r))),
          //           height: 34.h,
          //           width: 37.h,
          //           child: Icon(
          //             Icons.menu,
          //             size: 22.h,
          //             color: allColors.canvasColor,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // CommonSizeBoxWidget(height: 20.h, width: 0.w),
          // CommonTextWidget(
          //     color: allColors.canvasColor,
          //     size: 20.sp,
          //     text: mainText,
          //     weight: FontWeight.w700,
          //     padding: EdgeInsets.only(bottom: 5.h, left: 15.h, right: 15.h)),
          // if (subText.isNotEmpty) ...[
          //   CommonTextWidget(
          //       color: allColors.primaryColor,
          //       size: 25.sp,
          //       text: subText,
          //       weight: FontWeight.w700,
          //       padding: noPadding),
          // ],
          // if (isTextfield) ...[
          //   AppBarTemplateTextField(isFilter: isFilter)
          // ] else if (isBlogTextField) ...[
          //   AppBarBlogTextField(isFilter: isFilter)
          // ],
          // if (isButton) ...[
          //   CallBackButton()
          // ] else if (isFreeButton) ...[
          //   SizedBox(
          //     height: 10.h,
          //   ),
          //   FreeTemplateButton(),
          // ] else if (isClick) ...[
          //   ClickHereButton(
          //     onTap: onClickTap,
          //   ),
          // ]
        ],
      ),
    );
  }
}
