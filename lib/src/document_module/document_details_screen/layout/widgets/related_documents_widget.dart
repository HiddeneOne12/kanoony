// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
import 'package:kanoony/src/document_module/document_details_screen/provider/doc_detail_provider.dart';

import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/routing/routing_config.dart';
import '../../document_details_screen.dart';

class RelatedDocumentWidget extends ConsumerWidget {
  DocDetailState variable;
  RelatedDocumentWidget({super.key, required this.variable});

  @override
  Widget build(BuildContext context, ref) {
    var dashboard = ref.watch(allProviderList.dashboardProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CommonTextWidget(
          color: allColors.textColor,
          size: 18.sp,
          align: TextAlign.start,
          text: dashboard.staticData?.relatedDocuments ?? '',
          weight: FontWeight.w500,
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h,),
        ),
        GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
            crossAxisSpacing: 7.h,
          ),
          shrinkWrap: true,
          itemCount: variable.content?.relatedDocuments.length,
          padding:
              EdgeInsets.only(top: 10.h, bottom: 10.h, left: 16.h, right: 16.h),
          itemBuilder: (context, index) {
            var data = variable.content?.relatedDocuments[index];
            return Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: InkWell(
                  onTap: () async {
                    RoutesUtils.context.push(
                      DocumentDetailScreen.documentDetailRoute,
                      extra: {TextUtils.slug: data?.slug.toString()},
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    height: 34.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: allColors.canvasColor,
                        borderRadius: BorderRadius.all(Radius.circular(8.r))),
                    child: CommonTextWidget(
                        color: allColors.textColor,
                        align: TextAlign.center,
                        size: 13,
                        text: capitalizeFirst(data?.title ?? ''),
                        maxLine: 3,
                        weight: FontWeight.w500,
                        padding: EdgeInsets.only(
                            top: 5.h, bottom: 5.h, left: 10.h, right: 10.h)),
                  )),
            );
          },
        ),
      ],
    );
  }
}
