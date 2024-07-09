import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kanoony/core/common_widgets/common_end_drawer.dart';
import 'package:kanoony/core/common_widgets/common_profile_drawer.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/common_widgets/directionality_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/constants/translations/translations.dart';

class DashBoardScreen extends ConsumerStatefulWidget {
  static const String dashboardRoute = "/";
  const DashBoardScreen({super.key});

  @override
  ConsumerState<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends ConsumerState<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: CommonDirectionality(
            child: Scaffold(
              onEndDrawerChanged: (isOpened) {
                if (!isOpened) {
                  ref
                      .read(allProviderList.dashboardProvider.notifier)
                      .disposeEndDrawerValue();
                }
              },
              drawer: isArabic
                  ? AppEndProfileDrawer().appEndDrawer(context, ref)
                  : AppMenuProfileDrawer().appProfileDrawer(context, ref),
              endDrawer: isArabic
                  ? AppMenuProfileDrawer().appProfileDrawer(context, ref)
                  : AppEndProfileDrawer().appEndDrawer(context, ref),
              backgroundColor: allColors.scaffoldColor,
              resizeToAvoidBottomInset: false,
              body: bodyItems[index],
              bottomNavigationBar: BottomNavigationBar(
                unselectedItemColor: allColors.textColor,
                selectedItemColor: allColors.primaryColor,
                currentIndex: index,
                type: BottomNavigationBarType.fixed,
                selectedFontSize: 0,
                unselectedFontSize: 0,
                onTap: (ind) {
                   
                    if (ind != 0) {
                      var variables =
                          ref.watch(allProviderList.dashboardProvider);
                      var provider =
                          ref.read(allProviderList.dashboardProvider.notifier);
                      provider.searchController.clear();
                      variables.searchedDoc = [];
                    }
                  
                  StaticTextTranslations().printCalled();
                  setState(() {
                    index = ind;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      label: '',
                      activeIcon: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 22.h,
                            width: 22.h,
                            child: SvgPicture.asset(
                              SvgImagesAssetPath.icHome,
                              color: allColors.primaryColor,
                            ),
                          ),
                          CommonTextWidget(
                              color: allColors.primaryColor,
                              size: 11,
                              text: StaticTextTranslations().home,
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 5.h))
                        ],
                      ),
                      icon: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 22.h,
                            width: 22.h,
                            child: SvgPicture.asset(
                              SvgImagesAssetPath.icHome,
                              color: allColors.textColor,
                            ),
                          ),
                          CommonTextWidget(
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
                            SizedBox(
                              height: 20.h,
                              width: 20.h,
                              child: SvgPicture.asset(
                                SvgImagesAssetPath.willSvg,
                                color: allColors.primaryColor,
                              ),
                            ),
                            CommonTextWidget(
                                maxLine: 1,
                                color: allColors.primaryColor,
                                size: 11,
                                text:
                                    StaticTextTranslations().corporateServices,
                                weight: FontWeight.w400,
                                padding: EdgeInsets.only(top: 9.h))
                          ],
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Column(
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
                                maxLine: 1,
                                color: allColors.textColor,
                                size: 11,
                                text:
                                    StaticTextTranslations().corporateServices,
                                weight: FontWeight.w400,
                                padding: EdgeInsets.only(top: 9.h))
                          ],
                        ),
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
                              padding: EdgeInsets.only(top: 9.h))
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
                              padding: EdgeInsets.only(top: 9.h))
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
                              padding: EdgeInsets.only(top: 9.h))
                        ],
                      ),
                      label: ''),
                ],
              ),
            ),
          )),
    );
  }
}
