import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_appbar.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';

import '../../../core/routing/routing_config.dart';
import '../../document_module/document_details_screen/document_details_screen.dart';
import '../../faq_screen/layout/widgets/shimmer.dart';

class FavoriteBody extends ConsumerStatefulWidget {
  const FavoriteBody({super.key});

  @override
  ConsumerState<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends ConsumerState<FavoriteBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref
          .read(allProviderList.favDocProvider.notifier)
          .sendGetFavDocRequest();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    var variables2 = ref.watch(allProviderList.favDocProvider);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            mainText: variables.staticData?.myFavorites ?? '',
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
                height: 0.795.sh,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        variables2.isLoaded ||
                                variables2.content?.isEmpty == true
                            ? const SizedBox()
                            : Text(
                                variables.staticData?.myFavorites
                                        ?.upperCase() ??
                                    '',
                                style: context.headlineLarge,
                                textAlign: TextAlign.start,
                              ),
                        const SizedBox(
                          height: 10,
                        ),
                        variables2.isLoaded
                            ? const ShimmerFaqCard()
                            : ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: variables2
                                    .content?.length, // Length of the data list
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () async {
                                      RoutesUtils.context.push(
                                        DocumentDetailScreen
                                            .documentDetailRoute,
                                        extra: {
                                          TextUtils.slug: variables2
                                              .content![index]
                                              .documentsLang
                                              .slug
                                              .toString()
                                        },
                                      );
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 12),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3, vertical: 6),
                                      width: MediaQuery.sizeOf(context).width.w,
                                      decoration: BoxDecoration(
                                          color: allColors.canvasColor,
                                          border: Border.all(
                                              color:
                                                  allColors.buttonBorderColor),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(4.r))),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    Flexible(
                                                      child: CommonTextWidget(
                                                          color: allColors
                                                              .textColor,
                                                          size: 16,
                                                          text: capitalizeFirst(
                                                              variables2
                                                                  .content![
                                                                      index]
                                                                  .documentsLang
                                                                  .title),
                                                          weight:
                                                              FontWeight.w500,
                                                          align:
                                                              TextAlign.start,
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 16.h,
                                                                  right: 5.h,
                                                                  top: 10.h,
                                                                  bottom: 5.h)),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          // InkWell(
                                          //   onTap: () {},
                                          //   child: SizedBox(
                                          //     height: 20.h,
                                          //     width: 20.h,
                                          //     child: Image.asset(
                                          //       PngImagePaths.binImg,
                                          //     ),
                                          //   ),
                                          // ),
                                          // SizedBox(
                                          //   width: 10.w,
                                          // ),
                                        ],
                                      ),
                                    ),
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
