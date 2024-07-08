// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../core/common_widgets/common_text_widget.dart';
import '../../../../../core/constants/object_constants/object_constants.dart';
import '../../provider/doc_detail_provider.dart';
import 'basic-info_cards.dart';

class BasicInfoWidget extends ConsumerStatefulWidget {
  DocDetailState variables;
  BasicInfoWidget({super.key, required this.variables});

  @override
  ConsumerState<BasicInfoWidget> createState() => _BasicInfoWidgetState();
}

class _BasicInfoWidgetState extends ConsumerState<BasicInfoWidget> {
  bool selectedBasicInfo = true;
  @override
  Widget build(BuildContext context) {
    var dashboard = ref.watch(allProviderList.dashboardProvider);
    String formattedDate = DateFormat('d MMMM, yyyy').format(
        DateTime.tryParse(widget.variables.content?.documentUpdatedAt ?? '') ??
            DateTime.now());
    return Padding(
        padding:
            EdgeInsets.only(left: 16.h, right: 16.h, bottom: 0.h, top: 10.h),
        child: Container(
          alignment: Alignment.center,
          padding:
              EdgeInsets.only(left: 16.h, right: 16.h, top: 10.h, bottom: 0.h),
          decoration: BoxDecoration(
            color: allColors.canvasColor,
            border: Border.all(color: allColors.canvasColor, width: 1.w),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    selectedBasicInfo = !selectedBasicInfo;
                  });
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 10,
                        child: CommonTextWidget(
                            color: allColors.textColor,
                            size: 18.sp,
                            align: TextAlign.start,
                            text: dashboard.staticData?.basicInfo ?? '',
                            weight: FontWeight.w700,
                            padding: EdgeInsets.only(left: 0.h, right: 0.h))),
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Container(
                        height: 22.h,
                        width: 22.h,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.r))),
                        child: Icon(
                          selectedBasicInfo
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: allColors.textColor,
                          size: 20.h,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedBasicInfo) ...[
                Row(
                  children: [
                    Expanded(
                      child: BasicInfoCards(
                          name: dashboard.staticData?.applicableRegion ?? '',
                          value: widget.variables.content?.region ?? ''),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: BasicInfoCards(
                          name: dashboard.staticData?.documentNumber ?? '',
                          value: widget.variables.content?.documentNo ?? ''),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: BasicInfoCards(
                          name: dashboard.staticData?.version ?? '',
                          value: widget.variables.content?.version ?? ''),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                        child: BasicInfoCards(
                            name: dashboard.staticData?.lastUpdated ?? '',
                            value: formattedDate)),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h, top: 5.h),
                  child: Container(
                    height: 70.h,
                    width: MediaQuery.sizeOf(context).width.sw,
                    decoration: BoxDecoration(
                        color: allColors.textFieldColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CommonTextWidget(
                            color: allColors.textColor,
                            size: 16,
                            align: TextAlign.justify,
                            text:
                                dashboard.staticData?.availableLanguages ?? '',
                            weight: FontWeight.w500,
                            padding: EdgeInsets.only(
                                right: 20.h, bottom: 5.h, left: 20.h)),
                        Padding(
                          padding: EdgeInsets.only(left: 16.h, right: 16.h),
                          child: Row(
                            children: [
                              if (widget.variables.content?.englishattachment !=
                                  'null') ...[
                                Container(
                                padding: EdgeInsets.symmetric(vertical: 2,horizontal: 15),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: allColors.primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.r))),
                                  child: CommonTextWidget(
                                      color: allColors.canvasColor,
                                      size: 14,
                                      align: TextAlign.justify,
                                      text: 'English',
                                      weight: FontWeight.w500,
                                      padding: EdgeInsets.only(
                                          right: 0.h, top: 5.h, left: 0.h)),
                                ),
                                SizedBox(
                                  width: 5.h,
                                ),
                              ],
                              if (widget.variables.content?.arabicattachment !=
                                  'null') ...[
                                Container(
                                padding: EdgeInsets.symmetric(vertical: 2,horizontal: 15),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: allColors.primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.r))),
                                  child: CommonTextWidget(
                                      color: allColors.canvasColor,
                                      size: 4,
                                      align: TextAlign.justify,
                                      text: 'Arabic',
                                      weight: FontWeight.w500,
                                      padding: EdgeInsets.only(
                                          right: 0.h, top: 5.h, left: 0.h)),
                                ),
                                SizedBox(
                                  width: 5.h,
                                ),
                              ],
                              if (widget.variables.content?.combineattacment !=
                                  'null') ...[
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 2,horizontal: 15),
                                  
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: allColors.primaryColor,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(2.r))),
                                  child: CommonTextWidget(
                                      color: allColors.canvasColor,
                                      size: 14,
                                      align: TextAlign.center,
                                      text: 'English & Arabic',
                                      weight: FontWeight.w500,
                                      padding: EdgeInsets.only(
                                          right: 0.h, top: 5.h, left: 0.h)),
                                ),
                                SizedBox(
                                  width: 5.h,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ));
  }
}
