import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kanoony/core/common_widgets/common_end_drawer.dart';
import 'package:kanoony/core/common_widgets/common_profile_drawer.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';

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
          child: Scaffold(
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
              selectedLabelStyle:
                  Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: allColors.primaryColor,
                      ),
              unselectedLabelStyle:
                  Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: allColors.textColor,
                      ),
              onTap: (ind) {
                setState(() {
                  index = ind;
                });
              },
              items: [
                BottomNavigationBarItem(
                    label: '',
                    activeIcon: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Column(
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
                              text: "Home",
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 15.h))
                        ],
                      ),
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
                            text: "Home",
                            weight: FontWeight.w400,
                            padding: EdgeInsets.only(top: 15.h))
                      ],
                    )),
                BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: EdgeInsets.only(top: 10.h),
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
                              color: allColors.primaryColor,
                              size: 11,
                              text: 'Free \n Documents',
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 10.h))
                        ],
                      ),
                    ),
                    icon: Padding(
                      padding: EdgeInsets.only(top: 10.h),
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
                              color: allColors.textColor,
                              size: 11,
                              text: 'Free \n Documents',
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 10.h))
                        ],
                      ),
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: SizedBox(
                            height: 23.h,
                            width: 23.h,
                            child: SvgPicture.asset(
                              SvgImagesAssetPath.paperSvg,
                              color: allColors.primaryColor,
                            ),
                          ),
                        ),
                        CommonTextWidget(
                            color: allColors.primaryColor,
                            size: 11,
                            text: "Packages",
                            weight: FontWeight.w400,
                            padding: EdgeInsets.only(top: 15.h))
                      ],
                    ),
                    icon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 5.h),
                          child: SizedBox(
                            height: 23.h,
                            width: 23.h,
                            child: SvgPicture.asset(
                              SvgImagesAssetPath.paperSvg,
                              color: allColors.textColor,
                            ),
                          ),
                        ),
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 11,
                            text: "Packages",
                            weight: FontWeight.w400,
                            padding: EdgeInsets.only(top: 15.h))
                      ],
                    ),
                    label: ''),
                BottomNavigationBarItem(
                    activeIcon: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.h,
                            child: SvgPicture.asset(
                              SvgImagesAssetPath.businessSvg,
                              color: allColors.primaryColor,
                            ),
                          ),
                          CommonTextWidget(
                              color: allColors.primaryColor,
                              size: 11,
                              text: 'Corporate Services',
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 10.h))
                        ],
                      ),
                    ),
                    icon: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.h,
                            child: SvgPicture.asset(
                              SvgImagesAssetPath.businessSvg,
                              color: allColors.textColor,
                            ),
                          ),
                          CommonTextWidget(
                              color: allColors.textColor,
                              size: 11,
                              text: 'Corporate Services',
                              weight: FontWeight.w400,
                              padding: EdgeInsets.only(top: 10.h))
                        ],
                      ),
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
                            text: "Dashboard",
                            weight: FontWeight.w400,
                            padding: EdgeInsets.only(top: 15.h))
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
                            text: "Dashboard",
                            weight: FontWeight.w400,
                            padding: EdgeInsets.only(top: 15.h))
                      ],
                    ),
                    label: ''),
              ],
            ),
          )),
    );
  }
}
