// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/src/document_module/document_details_screen/document_details_screen.dart';

import '../../../../core/common_widgets/common_appbar.dart';
import '../../../../core/constants/image_paths/image_paths.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/routing/routing_config.dart';
import '../../../dashboard_screen/layout/widgets/shimmer.dart';
import '../../widgets/doc_card.dart';

class FreeDocumentBody extends ConsumerStatefulWidget {
  bool isHome;
  FreeDocumentBody({super.key, required this.isHome});

  @override
  ConsumerState<FreeDocumentBody> createState() => _FreeDocumentBodyState();
}

class _FreeDocumentBodyState extends ConsumerState<FreeDocumentBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref
          .read(allProviderList.freeDocProvider.notifier)
          .sendGetFreeDocRequest();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);
    var variables = ref.watch(allProviderList.freeDocProvider);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            mainText: dashboardVariables.staticData?.freeDocuments ?? '',
            subText: '',
            height: dashboardVariables.searchedDoc.isNotEmpty ? 0.35 : 0.21,
            isBack: widget.isHome ? false : true,
            isBlogTextField: false,
            isFilter: true,
            isButton: false,
            isDashboard: widget.isHome ? true : false,
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
                height: 0.795.sh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      variables.isLoaded
                          ? const GridShimmer()
                          : Padding(
                              padding: EdgeInsets.only(left: 16.h, right: 16.h),
                              child: GridView.builder(
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
                                      text: data.title);
                                },
                              ),
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
