import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';

import '../../../core/common_widgets/common_appbar.dart';
import '../../../core/common_widgets/content_shimmer.dart';
import '../../../core/constants/image_paths/image_paths.dart';
import '../../../core/constants/object_constants/object_constants.dart';

class TermsOfUseBody extends ConsumerStatefulWidget {
  const TermsOfUseBody({super.key});

  @override
  ConsumerState<TermsOfUseBody> createState() => _TermsOfUseBodyState();
}

class _TermsOfUseBodyState extends ConsumerState<TermsOfUseBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref
          .read(allProviderList.termsOfUseProvider.notifier)
          .sendGetTermsOfUseContentRequest();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.termsOfUseProvider);

    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonAppBar(
              mainText: 'TERMS OF USE',
              subText: '',
              height: 0.16,
              isBack: true,
              isBlogTextField: false,
              isFilter: false,
              isButton: false,
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
                SizedBox(
                  height: 0.7.sh,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        variables.isLoaded
                            ? Padding(
                                padding: EdgeInsets.only(top: 20.h),
                                child: const ContentShimmer(),
                              )
                            : Html(
                                style: {
                                  "p": Style(
                                      padding: HtmlPaddings.only(
                                          left: 5.h, right: 5.h),
                                      color: allColors.textColor,
                                      fontSize: FontSize(16),
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Tajawal'),
                                },
                                data: variables.content,
                              ),
                        SizedBox(
                          height: 50.h,
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
