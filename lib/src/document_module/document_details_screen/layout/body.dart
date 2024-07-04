// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/src/dashboard_screen/layout/widgets/shimmer.dart';
import 'package:kanoony/src/document_module/document_details_screen/layout/widgets/description_widget.dart';
import 'package:kanoony/src/document_module/document_details_screen/layout/widgets/related_documents_widget.dart';
import '../../../../core/common_widgets/common_appbar.dart';
import '../../../../core/constants/image_paths/image_paths.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import 'widgets/summery_widget.dart';
import 'widgets/basic_info_widget.dart';
import 'widgets/name_widget.dart';

class DocumentDetailBody extends ConsumerStatefulWidget {
  String slug;
  DocumentDetailBody({super.key, required this.slug});

  @override
  ConsumerState<DocumentDetailBody> createState() => _DocumentDetailBodyState();
}

class _DocumentDetailBodyState extends ConsumerState<DocumentDetailBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref
          .read(allProviderList.userProfileProvider.notifier)
          .sendUserDetailRequest();
      await ref
          .read(allProviderList.docDetailProvider.notifier)
          .sendGetDocDetailRequest(
              widget.slug,
              ref.watch(allProviderList.userProfileProvider).userProfile?.id ??
                  '');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var variables2 = ref.watch(allProviderList.docDetailProvider);
    var variables = ref.watch(allProviderList.userProfileProvider);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            mainText: 'DOCUMENT DETAIL',
            subText: '',
            height: 0.16,
            isBack: true,
            isBlogTextField: false,
            isFav: true,
            isFilter: false,
            isSearch: false,
            isButton: false,
            isTextfield: false,
            id: variables2.content?.id.toString() ?? '',
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
                  child: variables2.isLoaded || variables.isLoading
                      ? Padding(
                          padding: EdgeInsets.only(top: 16.h),
                          child: const DocDetailShimmer(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            NameWidget(
                              variable: variables2,
                            ),
                            BasicInfoWidget(
                              variables: variables2,
                            ),
                            DescriptionWidget(
                              variable: variables2,
                            ),
                            SummeryWidget(
                              variable: variables2,
                            ),
                            RelatedDocumentWidget(
                              variable: variables2,
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
