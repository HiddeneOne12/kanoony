import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_appbar.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/document_module/document_details_screen/document_details_screen.dart';

import '../../../../core/common_widgets/common_confirmation_dialog.dart';
import '../../../faq_screen/layout/widgets/shimmer.dart';

class MyDocumentBody extends ConsumerStatefulWidget {
  const MyDocumentBody({super.key});

  @override
  ConsumerState<MyDocumentBody> createState() => _MyDocumentBodyState();
}

class _MyDocumentBodyState extends ConsumerState<MyDocumentBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref
          .read(allProviderList.userProfileProvider.notifier)
          .sendUserDetailRequest();
      await ref
          .read(allProviderList.myDocProvider.notifier)
          .sendGetMyDocRequest();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    var variables2 = ref.watch(allProviderList.myDocProvider);
    var provider = ref.read(allProviderList.myDocProvider.notifier);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            mainText: variables.staticData?.myDocuments ?? '',
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
                height: 0.73.sh,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      variables2.isLoaded
                          ? const ShimmerFaqCard()
                          : ListView.builder(
                              itemCount: variables2.content!.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.h, right: 16.h, bottom: 10.h),
                                  child: InkWell(
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
                                      padding: EdgeInsets.all(3.h),
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
                                                          size: 11.sp,
                                                          text: variables2
                                                              .content![index]
                                                              .documentsLang
                                                              .title,
                                                          weight:
                                                              FontWeight.w700,
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
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top: 1.h),
                                            child: InkWell(
                                              onTap: () async {
                                                await provider.downloadFile(
                                                    variables2.content![index]
                                                        .wordFilePath);
                                              },
                                              child: SizedBox(
                                                height: 20.h,
                                                width: 20.h,
                                                child: Image.asset(
                                                  PngImagePaths.wordImg,
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                          if (variables2
                                                  .content![index].isFinished ==
                                              "yes") ...[
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(top: 1.h),
                                              child: InkWell(
                                                onTap: () async {
                                                  await provider.downloadFile(
                                                      variables2.content![index]
                                                          .pdfFilePath);
                                                },
                                                child: SizedBox(
                                                    height: 20.h,
                                                    width: 20.h,
                                                    child: Icon(
                                                      Icons.picture_as_pdf,
                                                      color:
                                                          allColors.errorColor,
                                                    )),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10.w,
                                            ),
                                          ],
                                          InkWell(
                                            onTap: () {
                                              confirmationDialogBox(
                                                  RoutesUtils.context,
                                                  () async {
                                                await provider
                                                    .sendDeleteMyDocRequest(
                                                        int.parse(variables2
                                                            .content![index]
                                                            .id));
                                                print("call");
                                              }, 'Do you want to delete this document!');
                                            },
                                            child: SizedBox(
                                              height: 14.h,
                                              width: 14.h,
                                              child: Image.asset(
                                                PngImagePaths.binImg,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10.w,
                                          ),
                                        ],
                                      ),
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
            ],
          ),
        ],
      ),
    );
  }
}
