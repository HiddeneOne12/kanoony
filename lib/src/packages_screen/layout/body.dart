// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_payment_popup.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';

import 'package:kanoony/src/packages_screen/layout/widgets/package_cards.dart';
import '../../../core/common_widgets/common_appbar.dart';
import '../../../core/common_widgets/common_text_widget.dart';
import '../../../core/constants/image_paths/image_paths.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';
import '../../dashboard_screen/layout/widgets/shimmer.dart';

class PackageBody extends ConsumerStatefulWidget {
  bool isHome;
  PackageBody({super.key, required this.isHome});

  @override
  ConsumerState<PackageBody> createState() => _PackageBodyState();
}

class _PackageBodyState extends ConsumerState<PackageBody> {
  Map<String, dynamic>? paymentIntentData;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.watch(allProviderList.dashboardProvider).allPackages = [];

      await ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendGetHomeContentRequest();
    });
    super.initState();
  }
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBar(
              mainText: dashboardVariables.staticData?.package ?? '',
              subText: '',
              height: 0.16,
              isBack: false,
              isBlogTextField: false,
              isFilter: false,
              isButton: false,
              isDashboard: false,
              isTextfield: false,
            ),
            Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 0.3.sw),
                  child: Image.asset(
                    PngImagePaths.dashboardDesignImg,
                    height: 326.65.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: kMainBodyPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      dashboardVariables.isLoaded
                          ? const SizedBox.shrink() :
                          Text(dashboardVariables
                                  .staticData?.contractTemplatePackages.capitalizeFirstLetter()
                                  ??
                              '',style: context.headlineLarge,),
                          const SizedBox(height: 8,),
                      dashboardVariables.isLoaded
                          ? const ShimmerPackageCard()
                          : SizedBox(
                            height: 570.h,
                            child: ListView.builder(
                                itemCount: dashboardVariables.allPackages.length,
                                shrinkWrap: true,
                                padding: const EdgeInsets.only(bottom: 30),
                                physics: const AlwaysScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  selectedIndex = index;
                                  var data =
                                      dashboardVariables.allPackages[index];
                                  return InkWell(
                                    child: PackageCard(
                                        onTap: () async {
                                          if (userProfileHelper
                                              .userData.id.isEmpty) {
                                            await paymentPopUp(
                                                context,
                                                ref,
                                                data,
                                                userProfileHelper
                                                        .userData.id.isEmpty
                                                    ? true
                                                    : false,
                                                '',
                                                true,
                                                '',
                                                '',
                                                '');
                                            return;
                                          }
                                          if (userProfileHelper.userData.packageId == dashboardVariables.allPackages[index].packgeId && userProfileHelper
                                                      .userData.packageName !=
                                                  "null" ||
                                              userProfileHelper.userData
                                                          .remainingDocument !=
                                                      "0" &&
                                                  DateTime.now().isAfter(
                                                      DateTime.tryParse(
                                                              userProfileHelper
                                                                  .userData
                                                                  .packageExpiry) ??
                                                          DateTime.now())) {
                                            // showSnackBarMessage(
                                            //     content:
                                            //         "You have already subscribed a package!",
                                            //     backgroundColor:
                                            //         allColors.primaryColor,
                                            //     contentColor:
                                            //         allColors.canvasColor);
                                          } else {
                                            await paymentPopUp(
                                                context,
                                                ref,
                                                data,
                                                userProfileHelper
                                                        .userData.id.isEmpty
                                                    ? true
                                                    : false,
                                                '',
                                                true,
                                                '',
                                                '',
                                                '');
                                          }
                                        },
                                        fifty: dashboardVariables
                                                .staticData?.saveMoreThan_50 ??
                                            '',
                                        price: data.price.toString(),
                                        title: data.title,
                                        description: data.description,
                                        getItNow: dashboardVariables
                                                .staticData?.monthlyAction ??
                                            '',
                                            ),
                                  );
                                },
                              ),
                          ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
     bool _isSubscribed() {
    return userProfileHelper.userData.id.isNotEmpty  && userProfileHelper.userData.packageName != "null" ||
        userProfileHelper.userData.remainingDocument != "0" &&
            DateTime.now().isAfter(
                DateTime.tryParse(userProfileHelper.userData.packageExpiry) ??
                    DateTime.now());
  }
}
