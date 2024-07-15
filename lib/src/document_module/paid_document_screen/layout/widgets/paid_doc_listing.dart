// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
import '../../../../../core/common_widgets/appbar_textfield.dart';
import '../../../../../core/common_widgets/callback_button.dart';
import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/image_paths/image_paths.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../../../../core/constants/static_constants/static_constants.dart';
import '../../../../../core/routing/routing_config.dart';
import '../../../document_details_screen/document_details_screen.dart';
import '../../../widgets/doc_card.dart';
import '../../model/get_paid_doc_model.dart';

class PaidDocListingItems extends StatefulWidget {
  List<Category>? list;
  double height;
  String title;
  PaidDocListingItems({
    super.key,
    required this.list,
    required this.height,
    required this.title,
  });

  @override
  State<PaidDocListingItems> createState() => _PaidDocListingItemsState();
}

class _PaidDocListingItemsState extends State<PaidDocListingItems> {
  int Sindex = 0;
  int S2index = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(widget.title.upperCase(),style: context.displayMedium,),
              // CommonTextWidget(
              //     color: allColors.textColor,
              //     size: 18.sp,
              //     align: TextAlign.center,
              //     text: capitalizeFirst(),
              //     weight: FontWeight.w500,
              //     padding: EdgeInsets.only(top: 0.h)),
              SizedBox(
                height: 15.h,
              ),
              AppBarTemplateTextField(isFilter: false),
              SizedBox(
                height: 15.h,
              ),
              // Padding(
              //   padding: EdgeInsets.only(
              //     left: isArabic ? 0 : 0.23.sw,
              //     right: isArabic ? 0.23.sw : 0,
              //   ),
              //   child: const FreeTemplateButton(),
              // ),
              // SizedBox(
              //   height: 10.h,
              // ),
              ListView.builder(
                itemCount: widget.list!.length,
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, firstIndex) {
                  var data = widget.list![firstIndex];
                  return Padding(
                      padding: EdgeInsets.only(bottom: 7.h),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (Sindex == firstIndex) {
                              Sindex = -1;
                            } else {
                              Sindex = firstIndex;
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
                          decoration: BoxDecoration(
                            color: allColors.canvasColor,
                            borderRadius: BorderRadius.circular(6.r),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: 16.h, right: 16.h, top: 10),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 10,
                                        child: 
                                        Text(data.title.capitalizeFirstLetter(), style: context.titleLarge,),
                                       ),
                                      
                                    Container(
                                      height: 22.h,
                                      width: 22.h,
                                      decoration: BoxDecoration(
                                          color: allColors.darkGreyColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50.r))),
                                      child: Icon(
                                        Sindex == firstIndex
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        color: allColors.textColor,
                                        size: 19.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               const SizedBox(height: 10,),
                              if (Sindex == firstIndex) ...[
                                ListView.builder(
                                  itemCount:
                                      widget.list![firstIndex].data.length,
                                  padding: EdgeInsets.only(
                                      left: 16.h, right: 16.h),
                                  shrinkWrap: true,
                                  physics:
                                      const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, secondIndex) {
                                    var data = widget
                                        .list![firstIndex].data[secondIndex];
                                    return Padding(
                                        padding: EdgeInsets.only(bottom: 7.h),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              if (S2index == secondIndex) {
                                                S2index = -1;
                                              } else {
                                                S2index = secondIndex;
                                              }
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: EdgeInsets.only(
                                                top: 10.h, bottom: 5.h),
                                            decoration: BoxDecoration(
                                              color: allColors.darkGreyColor,
                                              borderRadius:
                                                  BorderRadius.circular(6.r),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 16.h,
                                                      right: 16.h),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .start,
                                                    children: [
                                                      Expanded(
                                                          flex: 10,
                                                          child: Text(data.title.capitalizeFirstLetter(), style: context.titleMedium,)),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                bottom: 5.h),
                                                        child: Container(
                                                          height: 22.h,
                                                          width: 22.h,
                                                          decoration: BoxDecoration(
                                                              color: allColors
                                                                  .darkGreyColor,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          50.r))),
                                                          child: Icon(
                                                            S2index == firstIndex
                                                                ? Icons
                                                                    .keyboard_arrow_up
                                                                : Icons
                                                                    .keyboard_arrow_down,
                                                            color: allColors
                                                                .textColor,
                                                            size: 20.h,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (S2index ==
                                                    secondIndex) ...[
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 7.h,
                                                        right: 7.h),
                                                    child: GridView.builder(
                                                      physics:
                                                          const NeverScrollableScrollPhysics(),
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        childAspectRatio: 1.4,
                                                        crossAxisSpacing: 5.h,
                                                      ),
                                                      shrinkWrap: true,
                                                      itemCount: widget
                                                          .list![firstIndex]
                                                          .data[secondIndex]
                                                          .data
                                                          .length,
                                                      padding:
                                                          EdgeInsets.all(0.h),
                                                      itemBuilder:
                                                          (context, index) {
                                                        var data = widget
                                                            .list![firstIndex]
                                                            .data[secondIndex]
                                                            .data[index];
                                                        return DocCard(
                                                            isPaidScreen:
                                                                true,
                                                            onTap: () async {
                                                              RoutesUtils
                                                                  .context
                                                                  .push(
                                                                DocumentDetailScreen
                                                                    .documentDetailRoute,
                                                                extra: {
                                                                  TextUtils
                                                                          .slug:
                                                                      data.slug
                                                                          .toString()
                                                                },
                                                              );
                                                            },
                                                            icon: SvgImagesAssetPath
                                                                .documentSvg,
                                                            text: capitalizeFirst(
                                                                data.title),
                                                            price: data
                                                                .documentPrice);
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                ),
                              ],
                            ],
                          ),
                        ),
                      ));
                },
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
