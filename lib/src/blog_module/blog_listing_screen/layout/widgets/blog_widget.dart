// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/blog_module/blog_detail_screen/blog_detail_screen.dart';

import '../../../../../core/constants/object_constants/object_constants.dart';

class Blog extends StatelessWidget {
  final String date;
  final String title;
  final String description;
  final String imageUrl;

  Blog({
    required this.date,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RoutesUtils.context.push(BlogDetailScreen.blogDetailRoute);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.h, right: 16.h),
                child: CachedNetworkImage(
                    key: UniqueKey(),
                    imageUrl: imageUrl,
                    imageBuilder: (context, imageProvider) => Container(
                          height: 205.h,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r)),
                            border: Border.all(
                                color: allColors.transparentColor, width: 1.w),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => SizedBox(
                            height: 60.w,
                            width: 60.w,
                            child: Center(
                              child: CircularProgressIndicator.adaptive(
                                value: downloadProgress.progress,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Theme.of(context).primaryColor),
                              ),
                            )),
                    errorWidget: (context, url, error) => Icon(
                          Icons.person,
                          size: 60.w,
                        )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.h, left: 26.h),
                child: Container(
                    height: 23.h,
                    width: 69.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: allColors.primaryColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: CommonTextWidget(
                      color: allColors.scaffoldColor,
                      text: date,
                      size: 9.sp,
                      weight: FontWeight.w500,
                      padding: noPadding,
                    )),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          CommonTextWidget(
            color: allColors.textColor,
            text: title,
            size: 18.sp,
            weight: FontWeight.w500,
            padding: EdgeInsets.only(left: 16.h, right: 16.h),
            align: TextAlign.start,
          ),
          Padding(
            padding: EdgeInsets.only(right: 0.87.sw, left: 16.h),
            child: Divider(
              color: allColors.primaryColor,
              thickness: 1.w,
            ),
          ),
          Html(
            style: {
              "p": Style(
                  padding: HtmlPaddings.only(
                      left: isArabic ? 0 : 5.h, right: isArabic ? 5.h : 0),
                  color: allColors.textColor,
                  fontSize: FontSize(13.sp),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Tajawal'),
            },
            data: description,
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.h, right: 16.h),
            child: InkWell(
              onTap: () {
                RoutesUtils.context.push(BlogDetailScreen.blogDetailRoute);
              },
              child: CommonTextWidget(
                color: allColors.textColor,
                text: 'EXPLORE NOW',
                size: 10.sp,
                weight: FontWeight.w700,
                padding: noPadding,
                align: TextAlign.start,
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
