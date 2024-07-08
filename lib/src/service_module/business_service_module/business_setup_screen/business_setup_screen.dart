// ignore_for_file: annotate_overrides

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/core/common_widgets/phone_call_button.dart';

import '../../../../core/common_widgets/common_bottombar.dart';
import '../../../../core/common_widgets/common_end_drawer.dart';
import '../../../../core/common_widgets/common_profile_drawer.dart';

import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import 'layout/body.dart';

class BusinessSetupScreen extends ConsumerWidget {
  static const String businessSetupRoute = "/BusinessSetupScreen";
  const BusinessSetupScreen({super.key});

  Widget build(BuildContext context, ref) {
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
          bottomNavigationBar: const CommonBottomBar(),
          floatingActionButton: const PhoneCallButton(),
          body: const BusinessSetupBody(),
        ),
      ),
    );
  }
}
