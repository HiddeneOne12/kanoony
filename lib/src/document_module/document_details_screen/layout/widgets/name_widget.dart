// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/src/document_module/document_details_screen/provider/doc_detail_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../core/common_widgets/common_confirmation_dialog.dart';
import '../../../../../core/common_widgets/common_download_popup.dart';
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
      padding: kLeftRightPadding16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          Text(
            variable.content?.title.upperCase() ?? '',
            style: context.headlineLarge,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40.h,
                    padding: EdgeInsets.only(left: 2.h, right: 2.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.onSurfaceColor,
                      borderRadius: BorderRadius.all(Radius.circular(0.r)),
                    ),
                    child: Padding(
                      padding: kTopPadding5,
                      child: Text(
                        variable.content?.documentPrice == '0'
                            ? "FREE"
                            : '${variable.content?.documentPrice} AED + VAT',
                        style: context.headlineSmall
                            ?.copyWith(color: context.onPrimaryColor),
                      ),
                    ),
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
                    height: 40.h,
                    padding: EdgeInsets.only(left: 2.h, right: 2.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: context.primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(0.r)),
                    ),
                    child: Padding(
                      padding: kTopPadding5,
                      child: Text(
                        dashboard.staticData?.downloadNow ?? '',
                        style: context.headlineSmall
                            ?.copyWith(color: context.onPrimaryColor),
                      ),
                    ),
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
