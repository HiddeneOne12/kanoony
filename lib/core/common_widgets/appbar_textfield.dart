// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_sizebox_widget.dart';
import 'package:kanoony/core/common_widgets/searched_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';

import '../../src/dashboard_screen/layout/widgets/quick_links_popup.dart';
import '../constants/static_constants/static_constants.dart';

class AppBarTemplateTextField extends ConsumerStatefulWidget {
  bool isFilter;
  AppBarTemplateTextField({super.key, required this.isFilter});

  @override
  ConsumerState<AppBarTemplateTextField> createState() =>
      _AppBarTemplateTextFieldState();
}

class _AppBarTemplateTextFieldState
    extends ConsumerState<AppBarTemplateTextField> {
  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    var provider = ref.read(allProviderList.dashboardProvider.notifier);
    return Stack(
      children: [
        Container(
          height: 38.h,
          padding: EdgeInsets.only(left: 16.h, right: 16.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextFormField(
                  controller: provider.searchController,
                  onChanged: (val) async {
                    if (val.isEmpty) {
                      setState(() {
                        provider.searchController.clear();
                        variables.searchedDoc.clear();
                        variables.searchedDoc = [];
                      });
                      print("data cleared nigga");
                      return;
                    }
                    provider.sendGetHomeSearchDocRequest(val);
                  },
                  onFieldSubmitted: (val) {},
                  textAlignVertical: TextAlignVertical.center,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: allColors.textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp),
                  decoration: InputDecoration(
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(
                          right: isArabic ? 0 : 8.h,
                          left: isArabic ? 8.h : 0.h),
                      child: Icon(
                        Icons.search,
                        color: allColors.textColor,
                        size: 20.h,
                      ),
                    ),
                    isDense: false,
                    isCollapsed: true,
                    hintText:
                        variables.staticData?.searchForContractTemplate ?? '',
                    fillColor: allColors.canvasColor,
                    filled: true,
                    hintStyle:
                        Theme.of(context).textTheme.displaySmall!.copyWith(
                              color: allColors.greyTextColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                    contentPadding: EdgeInsets.only(
                        top: 5.h,
                        right: isArabic ? 15.h : 0,
                        left: isArabic ? 0 : 15.h),
                    alignLabelWithHint: false,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                        borderSide: BorderSide(color: allColors.canvasColor)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 1.w, color: allColors.canvasColor),
                        borderRadius: BorderRadius.all(Radius.circular(0.r))),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0.r)),
                      borderSide:
                          BorderSide(width: 2.w, color: allColors.canvasColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0.r)),
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.error)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0.r)),
                      borderSide: BorderSide(
                          width: 1.0,
                          color: Theme.of(context).colorScheme.error),
                    ),
                    errorMaxLines: 3,
                  ),
                  cursorColor: allColors.textColor,
                ),
              ),
              if (widget.isFilter) ...[
                CommonSizeBoxWidget(height: 0, width: 5.w),
                InkWell(
                  onTap: () async {
                    print("tapped1");
                    await quickLinksPopUp(context, ref);
                    print("tapped2");
                  },
                  child: Container(
                    height: 38.h,
                    width: 53.h,
                    color: allColors.primaryColor,
                    child: const Icon(Icons.filter_alt),
                  ),
                )
              ],
            ],
          ),
        ),
        if (variables.searchedDoc.isNotEmpty) ...[
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: SearchListingWidget(
              list: variables.searchedDoc,
            ),
          ),
        ],
      ],
    );
  }
}

class AppBarBlogTextField extends ConsumerStatefulWidget {
  bool isFilter;
  AppBarBlogTextField({super.key, required this.isFilter});

  @override
  ConsumerState<AppBarBlogTextField> createState() =>
      _AppBarBlogTextFieldState();
}

class _AppBarBlogTextFieldState extends ConsumerState<AppBarBlogTextField> {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var variables = ref.watch(allProviderList.dashboardProvider);
    return Container(
      height: 38.h,
      padding: EdgeInsets.only(left: 16.h, right: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              controller: searchController,
              onChanged: (val) {},
              onFieldSubmitted: (val) {},
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: allColors.textColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp),
              decoration: InputDecoration(
                suffixIcon: Padding(
                  padding: EdgeInsets.only(
                      right: isArabic ? 0 : 8.h, left: isArabic ? 8.h : 0.h),
                  child: Icon(
                    Icons.search,
                    color: allColors.textColor,
                    size: 20.h,
                  ),
                ),
                isDense: false,
                isCollapsed: true,
                hintText: variables.staticData?.searchBlogsAndNews ?? '',
                fillColor: allColors.canvasColor,
                filled: true,
                hintStyle: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: allColors.greyTextColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                contentPadding: EdgeInsets.only(
                    top: 5.h,
                    right: isArabic ? 15.h : 0,
                    left: isArabic ? 0 : 15.h),
                counterText: '',
                alignLabelWithHint: true,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    borderSide: BorderSide(color: allColors.canvasColor)),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 1.w, color: allColors.canvasColor),
                    borderRadius: BorderRadius.all(Radius.circular(0.r))),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.r)),
                  borderSide:
                      BorderSide(width: 2.w, color: allColors.canvasColor),
                ),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(0.r)),
                    borderSide:
                        BorderSide(color: Theme.of(context).colorScheme.error)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.r)),
                  borderSide: BorderSide(
                      width: 1.0, color: Theme.of(context).colorScheme.error),
                ),
                errorMaxLines: 3,
              ),
              cursorColor: allColors.textColor,
            ),
          ),
          if (widget.isFilter) ...[
            CommonSizeBoxWidget(height: 0, width: 5.w),
            InkWell(
              onTap: () async {
                print("tapped1");
                await quickLinksPopUp(context, ref);
                print("tapped2");
              },
              child: Container(
                height: 38.h,
                width: 53.h,
                color: allColors.primaryColor,
                child: const Icon(Icons.filter_alt),
              ),
            )
          ],
        ],
      ),
    );
  }
}
