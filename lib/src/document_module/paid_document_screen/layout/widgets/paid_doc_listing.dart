// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/constants/values.dart';
import 'package:kanoony/core/extentions/string_extentions.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';
import '../../../../../core/common_widgets/appbar_textfield.dart';
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
    return Container(
      height: widget.height.sh,
      padding: kLeftRightPadding16,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Text(
              widget.title.upperCase(),
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
            ListView.builder(
              itemCount: widget.list!.length,
              padding: noPadding,
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
                          color: context.onPrimaryColor,
                          borderRadius: kBorderRadius6,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 16.h, right: 16.h, top: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 10,
                                    child: Text(
                                      data.title.capitalizeFirstLetter(),
                                      style: context.titleLarge,
                                    ),
                                  ),
                                  Container(
                                    height: 22.h,
                                    width: 22.h,
                                    decoration: BoxDecoration(
                                        color: appTheme.darkGreyColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50.r))),
                                    child: Icon(
                                      Sindex == firstIndex
                                          ? Icons.keyboard_arrow_up
                                          : Icons.keyboard_arrow_down,
                                      color: context.onSurfaceColor,
                                      size: 19.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            if (Sindex == firstIndex) ...[
                              ListView.builder(
                                itemCount: widget.list![firstIndex].data.length,
                                padding:
                                    EdgeInsets.only(left: 16.h, right: 16.h),
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
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
                                            color: appTheme.darkGreyColor,
                                            borderRadius: kBorderRadius6,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: kLeftRightPadding16,
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                        flex: 10,
                                                        child: Text(
                                                          data.title
                                                              .capitalizeFirstLetter(),
                                                          style: context
                                                              .titleMedium,
                                                        )),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 5.h),
                                                      child: Container(
                                                        height: 22.h,
                                                        width: 22.h,
                                                        decoration: BoxDecoration(
                                                            color: appTheme
                                                                .darkGreyColor,
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        50.r))),
                                                        child: Icon(
                                                          S2index == firstIndex
                                                              ? Icons
                                                                  .keyboard_arrow_up
                                                              : Icons
                                                                  .keyboard_arrow_down,
                                                          color: context
                                                              .onSurfaceColor,
                                                          size: 20.h,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              if (S2index == secondIndex) ...[
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: 7.h, right: 7.h),
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
                                                          isPaidScreen: true,
                                                          onTap: () async {
                                                            RoutesUtils.context
                                                                .push(
                                                              DocumentDetailScreen
                                                                  .documentDetailRoute,
                                                              extra: {
                                                                TextUtils.slug:
                                                                    data.slug
                                                                        .toString()
                                                              },
                                                            );
                                                          },
                                                          icon:
                                                              SvgImagesAssetPath
                                                                  .documentSvg,
                                                          text: data.title
                                                              .capitalizeFirstLetter(),
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
    );
  }
}
