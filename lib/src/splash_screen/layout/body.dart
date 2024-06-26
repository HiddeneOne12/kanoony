// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_sizebox_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/src/dashboard_screen/dashboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/constants/static_constants/static_constants.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      Future.delayed(const Duration(seconds: 1), () {
        checkIsUserLogin();
      });
    });

    super.initState();
  }

  Future<void> checkIsUserLogin() async {
    final localStorage = await SharedPreferences.getInstance();
    var isArabicLang = localStorage.getString("is_arabic");
    setState(() {
      isArabic = isArabicLang == "true" ? true : false;
      logger.i("Language =  $isArabic");
    });
    var bearerToken = localStorage.getString("token_key");

    Object? route = localStorage.get("login_value");
    await userProfileHelper.getUserData();
    if (route == "loginSuccessfully" &&
        bearerToken != null &&
        userProfileHelper.userData.id.isNotEmpty) {
      context.go(DashBoardScreen.dashboardRoute);
    } else {
      context.go(DashBoardScreen.dashboardRoute);
    }
  }

  Widget build(BuildContext context) {
    return Container(
        color: allColors.textColor,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CommonSizeBoxWidget(height: 0.4.sh, width: 0),
            Padding(
              padding: EdgeInsets.only(left: 16.h, right: 16.h),
              child: Image.asset(
                PngImagePaths.appLogoLightImg,
                height: 65.h,
                width: 255.w,
              ),
            ),
            Image.asset(
              PngImagePaths.splashDesignImg,
            ),
          ],
        ));
  }
}
