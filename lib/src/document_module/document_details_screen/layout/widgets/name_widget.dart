// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/src/document_module/document_details_screen/provider/doc_detail_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/common_widgets/common_confirmation_dialog.dart';
import '../../../../../core/common_widgets/common_download_popup.dart';
import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/routing/routing_config.dart';
import '../../../../auth_module/login_screen/login_screen.dart';

class NameWidget extends ConsumerWidget {
  DocDetailState variable;
  NameWidget({super.key, required this.variable});

  @override
  Widget build(BuildContext context, ref) {
    var dashboard = ref.watch(allProviderList.dashboardProvider);
    return Padding(
      padding: EdgeInsets.only(right: 16.h, top: 16.h, left: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CommonTextWidget(
              color: allColors.textColor,
              size: 18.sp,
              text: variable.content?.title.toUpperCase() ?? '',
              weight: FontWeight.w500,
              align: TextAlign.start,
              padding: EdgeInsets.only(left: 0.h, right: 0.h, top: 5.h)),
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 30.h,
                    padding: EdgeInsets.only(left: 2.h, right: 2.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: allColors.textColor,
                      borderRadius: BorderRadius.all(Radius.circular(0.r)),
                    ),
                    child: CommonTextWidget(
                        color: allColors.canvasColor,
                        size: 10.sp,
                        text: variable.content?.documentPrice == '0'
                            ? "FREE"
                            : '${variable.content?.documentPrice} AED + VAT',
                        weight: FontWeight.w700,
                        align: TextAlign.center,
                        padding:
                            EdgeInsets.only(left: 0.h, right: 0.h, top: 5.h)),
                  ),
                ),
              ),
              SizedBox(
                width: 10.h,
              ),
              Expanded(
                child: InkWell(
                  onTap: () async {
                    if (variable.content?.documentPrice == '0') {
                      if (userProfileHelper.userData.id.isNotEmpty) {
                        await downloadDocumentPopUp(
                            context, ref, variable.content!);
                      } else {
                        confirmationDialogBox(RoutesUtils.context, () async {
                          final localStorage =
                              await SharedPreferences.getInstance();
                          localStorage.setString(
                              "doc_detail", variable.content!.slug);

                          index = 0;

                          RoutesUtils.context.go(LoginScreen.loginRoute);
                          print("call");
                        }, 'You need to sign in to access this feature!');
                      }
                    } else {
                      await downloadDocumentPopUp(
                          context, ref, variable.content!);
                    }
                  },
                  child: Container(
                    height: 30.h,
                    padding: EdgeInsets.only(left: 2.h, right: 2.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: allColors.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(0.r)),
                    ),
                    child: CommonTextWidget(
                        color: allColors.canvasColor,
                        size: 10.sp,
                        text: dashboard.staticData?.downloadNow ?? '',
                        weight: FontWeight.w700,
                        align: TextAlign.center,
                        padding:
                            EdgeInsets.only(left: 0.h, right: 0.h, top: 5.h)),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
