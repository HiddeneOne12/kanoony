// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common_widgets/common_appbar.dart';
import '../../../../core/constants/image_paths/image_paths.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../faq_screen/layout/widgets/shimmer.dart';
import 'widgets/paid_doc_listing.dart';

class PaidDocumentBody extends ConsumerStatefulWidget {
  String slug;
  PaidDocumentBody({super.key, required this.slug});

  @override
  ConsumerState<PaidDocumentBody> createState() => _PaidDocumentBodyState();
}

class _PaidDocumentBodyState extends ConsumerState<PaidDocumentBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref
          .read(allProviderList.dashboardProvider.notifier)
          .searchController
          .clear();
      ref.watch(allProviderList.dashboardProvider).searchedDoc.clear();
      await ref
          .read(allProviderList.paidDocProvider.notifier)
          .sendGetPaidDocRequest(widget.slug);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.paidDocProvider);
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
                        ? 0.3
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
              variables.isLoaded
                  ? Padding(
                      padding: EdgeInsets.only(top: 20.h),
                      child: const ShimmerFaqCard(),
                    )
                  : PaidDocListingItems(
                      height: 0.795,
                      title: variables.title ?? '',
                      list: variables.content,
                    ),
            ],
          ),
        ],
      ),
    );
  }
}
