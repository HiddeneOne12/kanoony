// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_payment_popup.dart';

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

  @override
  Widget build(BuildContext context) {
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
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
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.3.sw),
                child: Image.asset(
                  PngImagePaths.dashboardDesignImg,
                  height: 326.65.h,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                height: 0.795.sh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextWidget(
                          color: allColors.textColor,
                          size: 20.sp,
                          text: dashboardVariables
                                  .staticData?.contractTemplatePackages
                                  ?.toUpperCase() ??
                              '',
                          weight: FontWeight.w500,
                          padding: EdgeInsets.only(left: 16.h, right: 16.h)),
                      dashboardVariables.isLoaded
                          ? const ShimmerPackageCard()
                          : ListView.builder(
                              itemCount: dashboardVariables.allPackages.length,
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.h),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var data =
                                    dashboardVariables.allPackages[index];
                                return InkWell(
                                  onTap: () async {
                                    await paymentPopUp(
                                        context,
                                        ref,
                                        data,
                                        userProfileHelper.userData.id.isEmpty
                                            ? true
                                            : false,
                                        '',
                                        true);
                                  },
                                  child: PackageCard(
                                      fifty: dashboardVariables
                                              .staticData?.saveMoreThan_50 ??
                                          '',
                                      price: data.price.toString(),
                                      title: data.title,
                                      description: data.description,
                                      getItNow: dashboardVariables
                                              .staticData?.monthlyAction ??
                                          ''),
                                );
                              },
                            ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
