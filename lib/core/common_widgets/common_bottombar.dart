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
        selectedLabelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
              color: allColors.primaryColor,
            ),
        unselectedLabelStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 10.sp,
              color: allColors.textColor,
            ),
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
                  Icon(
                    Icons.home_outlined,
                    size: 25.h,
                    color: allColors.primaryColor,
                  ),
                  CommonTextWidget(
                      color: allColors.primaryColor,
                      size: 11,
                      text: StaticTextTranslations().home,
                      weight: FontWeight.w400,
                      padding: EdgeInsets.only(top: 10.h))
                ],
              ),
              icon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.home_outlined,
                    size: 25.h,
                    color: allColors.textColor,
                  ),
                  CommonTextWidget(
                      color: allColors.textColor,
                      size: 11,
                      text: StaticTextTranslations().home,
                      weight: FontWeight.w400,
                      padding: EdgeInsets.only(top: 10.h))
                ],
              )),
          BottomNavigationBarItem(
              activeIcon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: SvgPicture.asset(
                      SvgImagesAssetPath.willSvg,
                      color: allColors.primaryColor,
                    ),
                  ),
                  CommonTextWidget(
                      color: allColors.primaryColor,
                      size: 11,
                      text: StaticTextTranslations().corporateServices,
                      weight: FontWeight.w400,
                      padding: EdgeInsets.only(top: 10.h))
                ],
              ),
              icon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 20.h,
                    child: SvgPicture.asset(
                      SvgImagesAssetPath.willSvg,
                      color: allColors.textColor,
                    ),
                  ),
                  CommonTextWidget(
                      color: allColors.textColor,
                      size: 11,
                      text: StaticTextTranslations().corporateServices,
                      weight: FontWeight.w400,
                      padding: EdgeInsets.only(top: 15.h))
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              activeIcon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 23.h,
                    width: 23.h,
                    child: SvgPicture.asset(
                      SvgImagesAssetPath.paperSvg,
                      color: allColors.primaryColor,
                    ),
                  ),
                  CommonTextWidget(
                      color: allColors.primaryColor,
                      size: 11,
                      text: StaticTextTranslations().templatePackages,
                      weight: FontWeight.w400,
                      padding: EdgeInsets.only(top: 11.h))
                ],
              ),
              icon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 23.h,
                    width: 23.h,
                    child: SvgPicture.asset(
                      SvgImagesAssetPath.paperSvg,
                      color: allColors.textColor,
                    ),
                  ),
                  CommonTextWidget(
                      color: allColors.textColor,
                      size: 11,
                      text: StaticTextTranslations().templatePackages,
                      weight: FontWeight.w400,
                      padding: EdgeInsets.only(top: 11.h))
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
                      padding: EdgeInsets.only(top: 11.h))
                ],
              ),
              icon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.dashboard_customize_outlined,
                    size: 23.h,
                    color: allColors.textColor,
                  ),
                  CommonTextWidget(
                      color: allColors.textColor,
                      size: 11,
                      text: StaticTextTranslations().dashboard,
                      weight: FontWeight.w400,
                      padding: EdgeInsets.only(top: 11.h))
                ],
              ),
              label: ''),
        ],
      ),
    );
  }
}
