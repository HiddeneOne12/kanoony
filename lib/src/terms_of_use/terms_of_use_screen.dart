import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/src/terms_of_use/layout/body.dart';

import '../../core/common_widgets/common_bottombar.dart';
import '../../core/common_widgets/common_end_drawer.dart';
import '../../core/common_widgets/common_img_button_widget.dart';
import '../../core/common_widgets/common_profile_drawer.dart';
import '../../core/constants/object_constants/object_constants.dart';
import '../../core/constants/static_constants/static_constants.dart';
import '../service_module/widgets/request_callback_popup.dart';

class TermsOfUseScreen extends ConsumerWidget {
  static const String termOfUseRoute = "/TermsOfUseScreen";
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    var dashboardVaribles = ref.watch(allProviderList.dashboardProvider);
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: allColors.scaffoldColor,
          drawer: isArabic
              ? AppEndProfileDrawer().appEndDrawer(context, ref)
              : AppMenuProfileDrawer().appProfileDrawer(context, ref),
          endDrawer: isArabic
              ? AppMenuProfileDrawer().appProfileDrawer(context, ref)
              : AppEndProfileDrawer().appEndDrawer(context, ref),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: const CommonBottomBar(),
          bottomSheet: Container(
            decoration: BoxDecoration(
                color: allColors.scaffoldColor,
                borderRadius: BorderRadius.all(Radius.circular(0.r))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonImgButtonWidget(
                  fontColor: allColors.canvasColor,
                  fontSize: 16,
                  weight: FontWeight.w500,
                  isLoading: ValueNotifier(false),
                  height: 38,
                  radius: 6,
                  text: dashboardVaribles.staticData?.requestACallBack ?? '',
                  icon: Icon(
                    Icons.call,
                    size: 15.h,
                    color: allColors.canvasColor,
                  ),
                  backgroundColor: allColors.primaryColor,
                  borderColor: allColors.primaryColor,
                  padding: EdgeInsets.only(left: 16.h, right: 16.h),
                  onTap: () async {
                  //  await requestCallBackPopUp(context, ref);
                  },
                ),
                SizedBox(
                  height: 20.h,
                )
              ],
            ),
          ),
          body: const TermsOfUseBody(),
        ),
      ),
    );
  }
}
