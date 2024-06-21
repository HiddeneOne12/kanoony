// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/src/faq_screen/layout/widgets/faq_cardlising.dart';
import 'package:kanoony/src/faq_screen/layout/widgets/shimmer.dart';

import '../../../core/common_widgets/common_appbar.dart';
import '../../../core/constants/image_paths/image_paths.dart';

class FaqBody extends ConsumerStatefulWidget {
  const FaqBody({super.key});

  @override
  ConsumerState<FaqBody> createState() => _FaqBodyState();
}

class _FaqBodyState extends ConsumerState<FaqBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref
          .read(allProviderList.faqsProvider.notifier)
          .sendGetFaqsContentRequest();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);
    var faqVariables = ref.watch(allProviderList.faqsProvider);
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBar(
              mainText:
                  dashboardVariables.staticData?.frequentlyAskedQuestions ?? '',
              subText: '',
              height: 0.17,
              isBack: true,
              isFilter: false,
              isBlogTextField: false,
              isButton: false,
              isTextfield: false,
              isImage: true,
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
                SizedBox(
                  height: 0.75.sh,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 16.h,
                        ),
                        faqVariables.isLoaded
                            ? ShimmerFaqCard()
                            : FaqCardListing(
                                faqs: faqVariables.content ?? [],
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
