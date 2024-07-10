import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/common_widgets/directionality_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/translations/translations.dart';

import '../../src/dashboard_screen/dashboard_screen.dart';
import '../constants/object_constants/object_constants.dart';
import '../constants/static_constants/static_constants.dart';
import '../routing/routing_config.dart';

class CommonBottomBar extends ConsumerStatefulWidget {
  const CommonBottomBar({super.key});

  @override
  ConsumerState<CommonBottomBar> createState() => _CommonBottomBarState();
}

class _CommonBottomBarState extends ConsumerState<CommonBottomBar> {
  @override
  Widget build(BuildContext context) {
    return CommonDirectionality(
      child: BottomNavigationBar(
        unselectedItemColor: allColors.textColor,
        selectedItemColor: allColors.primaryColor,
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 0,
        
        unselectedFontSize: 0,
        onTap: (ind) {
          setState(() {
            index = ind;
          });
          RoutesUtils.context.push(DashBoardScreen.dashboardRoute);
        },
        items: [
                  BottomNavigationBarItem(
                      label: '',
                      activeIcon: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.home,size: 25,),
                          CommonTextWidget(
                            height: 0.6,
                              color: allColors.textColor,
                              size: 11,
                              text: StaticTextTranslations().home,
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 9.h))
                        ],
                      ),
                      icon: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.home,size: 25,),
                          CommonTextWidget(
                            height: 0.6,
                              color: allColors.textColor,
                              size: 11,
                              text: StaticTextTranslations().home,
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 9.h))
                        ],
                      )),
                  BottomNavigationBarItem(
                      activeIcon: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                                                        const SizedBox(height: 7,),

                            SizedBox(
                              height: 19,
                              width: 19,
                              child: SvgPicture.asset(
                                SvgImagesAssetPath.willSvg,
                                color: allColors.primaryColor,
                                 height: 19,
                              width: 19,
                              ),
                            ),
                            CommonTextWidget(
                                maxLine: 1,
                                color: allColors.primaryColor,
                                size: 11,
                                 text:
                                    StaticTextTranslations().corporateServices,
                                weight: FontWeight.w400,
                                padding: EdgeInsets.only(top: 7.h))
                          ],
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 7,),
                            SizedBox(
                              height: 19,
                              width: 19,
                              child: SvgPicture.asset(
                                SvgImagesAssetPath.willSvg,
                                color: allColors.textColor,
                                 height: 19,
                              width: 19,
                              ),
                            ),
                            CommonTextWidget(
                                maxLine: 1,
                                color: allColors.textColor,
                                size: 11,
                                 text:
                                    StaticTextTranslations().corporateServices,
                                weight: FontWeight.w400,
                                padding: EdgeInsets.only(top: 7.h))
                          ],
                        ),
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      activeIcon: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 3,),
                          SizedBox(
                            height: 23,
                            width: 23,
                            child: SvgPicture.asset(
                              SvgImagesAssetPath.paperSvg,
                              color: allColors.primaryColor,
                               height: 23,
                            width: 23,
                            ),
                          ),
                          CommonTextWidget(
                              color: allColors.primaryColor,
                              size: 11,
                              text: StaticTextTranslations().templatePackages,
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 5.h))
                        ],
                      ),
                      icon: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                                                    const SizedBox(height: 3,),

                          SizedBox(
                            height: 23,
                            width: 23,
                            child: SvgPicture.asset(
                              SvgImagesAssetPath.paperSvg,
                              color: allColors.textColor,
                               height: 23,
                            width: 23,
                            ),
                          ),
                          CommonTextWidget(
                              color: allColors.textColor,
                              size: 11,
                              text: StaticTextTranslations().templatePackages,
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 7.h))
                        ],
                      ),
                      label: ''),
                  BottomNavigationBarItem(
                      activeIcon: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.dashboard_customize_outlined,
                            size: 23.h,
                            color: allColors.primaryColor,
                          ),
                          CommonTextWidget(
                              color: allColors.primaryColor,
                              size: 11,
                              text: StaticTextTranslations().dashboard,
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 9.h))
                        ],
                      ),
                      icon: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 2,)
,                          Icon(
                            Icons.dashboard_customize_outlined,
                            size: 23.h,
                            color: allColors.textColor,
                          ),
                          CommonTextWidget(
                              color: allColors.textColor,
                              size: 11,
                              text: StaticTextTranslations().dashboard,
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 7.h))
                        ],
                      ),
                      label: ''),
                ],
      ),
    );
  }
}
