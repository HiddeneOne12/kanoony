import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/phone_call_button.dart';
import 'package:kanoony/src/privacy_policy_screen/layout/body.dart';

import '../../core/common_widgets/common_bottombar.dart';
import '../../core/common_widgets/common_end_drawer.dart';
import '../../core/common_widgets/common_img_button_widget.dart';
import '../../core/common_widgets/common_profile_drawer.dart';
import '../../core/constants/object_constants/object_constants.dart';
import '../../core/constants/static_constants/static_constants.dart';

class PrivacyScreen extends ConsumerWidget {
  static const String privacyRoute = "/PrivacyScreen";
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);
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
          bottomNavigationBar: const CommonBottomBar(),
          backgroundColor: allColors.scaffoldColor,
          resizeToAvoidBottomInset: false,
          floatingActionButton: const PhoneCallButton(),
          body: const PrivacyBody(),
        ),
      ),
    );
  }
}
