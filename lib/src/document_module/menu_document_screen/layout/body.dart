// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../../core/common_widgets/appbar_textfield.dart';
import '../../../../core/common_widgets/common_appbar.dart';
import '../../../../core/constants/image_paths/image_paths.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../../core/routing/routing_config.dart';
import '../../../dashboard_screen/layout/widgets/shimmer.dart';
import '../../document_details_screen/document_details_screen.dart';
import '../../widgets/doc_card.dart';

class MenuDocumentBody extends ConsumerStatefulWidget {
  String slug;
  MenuDocumentBody({super.key, required this.slug});

  @override
  ConsumerState<MenuDocumentBody> createState() => _MenuDocumentBodyState();
}

class _MenuDocumentBodyState extends ConsumerState<MenuDocumentBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref
          .read(allProviderList.dashboardProvider.notifier)
          .searchController
          .clear();
      ref.watch(allProviderList.dashboardProvider).searchedDoc.clear();
      await ref
          .read(allProviderList.menuDocProvider.notifier)
          .sendGetMenuDocRequest(widget.slug);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.menuDocProvider);
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            mainText: variables.isLoaded ? '' : variables.title ?? '',
            subText: '',
            height: variables.isLoaded
                ? 0.28
                : dashboardVariables.searchedDoc.isNotEmpty
                    ? 0.44
                    : variables.title!.length >= 30
                        ? 0.29
                        : 0.26,
            isBack: true,
            isBlogTextField: false,
            isFilter: false,
            isButton: false,
            isFreeButton: true,
            isTextfield: true,
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
                height: 0.8.sh,
                child: SingleChildScrollView(
                  padding: kLeftRightPadding16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        variables.title.upperCase(),
                        style: context.headlineLarge,
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AppBarTemplateTextField(isFilter: false),
                      SizedBox(
                        height: 20.h,
                      ),
                      variables.isLoaded
                          ? const GridShimmer()
                          : GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1.5,
                                crossAxisSpacing: 7.h,
                              ),
                              shrinkWrap: true,
                              itemCount: variables.content!.length,
                              padding: EdgeInsets.all(0.h),
                              itemBuilder: (context, index) {
                                var data = variables.content![index];
                                return DocCard(
                                    price: data.documentPrice,
                                    onTap: () async {
                                      RoutesUtils.context.push(
                                        DocumentDetailScreen
                                            .documentDetailRoute,
                                        extra: {
                                          TextUtils.slug: data.slug.toString()
                                        },
                                      );
                                    },
                                    icon: SvgImagesAssetPath.documentSvg,
                                    text: data.title.capitalizeFirstLetter());
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
