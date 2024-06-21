import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';

import '../../../core/common_widgets/common_appbar.dart';
import '../../../core/common_widgets/content_shimmer.dart';
import '../../../core/constants/object_constants/object_constants.dart';

class PrivacyBody extends ConsumerStatefulWidget {
  const PrivacyBody({super.key});

  @override
  ConsumerState<PrivacyBody> createState() => _PrivacyBodyState();
}

class _PrivacyBodyState extends ConsumerState<PrivacyBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref
          .read(allProviderList.privacyPolicyProvider.notifier)
          .sendGetPrivacyPolicyContentRequest();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.privacyPolicyProvider);
   
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            mainText: 'PRIVACY POLICY',
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
              Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
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
                                    fontSize: FontSize(13.sp),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Tajawal'),
                              },
                              data: variables.content,
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
