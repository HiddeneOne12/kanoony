import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/common_appbar.dart';
import '../../../../core/common_widgets/common_text_widget.dart';
import '../../../../core/constants/image_paths/image_paths.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';

class BlogDetailBody extends StatefulWidget {
  const BlogDetailBody({super.key});

  @override
  State<BlogDetailBody> createState() => _BlogDetailBodyState();
}

class _BlogDetailBodyState extends State<BlogDetailBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CommonAppBar(
          height: 0.15,
          isBack:  true,
          isBlogTextField: false,
          isFilter: false,
          isButton: false,
          isTextfield: false,
          mainText: 'BLOG DETAIL',
          subText: '',
          
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
              height: 0.74.sh,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: 16.h, right: 16.h, top: 20.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              CachedNetworkImage(
                                  key: UniqueKey(),
                                  imageUrl:
                                      'https://img.freepik.com/free-photo/business-people-shaking-hands-together_53876-13391.jpg',
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                        height: 205.h,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15.r)),
                                          border: Border.all(
                                              color: allColors.transparentColor,
                                              width: 1.w),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                  progressIndicatorBuilder: (context, url,
                                          downloadProgress) =>
                                      SizedBox(
                                          height: 60.w,
                                          width: 60.w,
                                          child: Center(
                                            child: CircularProgressIndicator
                                                .adaptive(
                                              value: downloadProgress.progress,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                      Theme.of(context)
                                                          .primaryColor),
                                            ),
                                          )),
                                  errorWidget: (context, url, error) => Icon(
                                        Icons.person,
                                        size: 60.w,
                                      )),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h, left: 10.h),
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
                                      text: '02 May 2024',
                                      size: 9.sp,
                                      weight: FontWeight.w500,
                                      padding: noPadding,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          CommonTextWidget(
                            color: allColors.textColor,
                            text:
                                'Employment policies: Protecting your business and employees',
                            size: 18.sp,
                            weight: FontWeight.w700,
                            padding: noPadding,
                            align: TextAlign.start,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 0.87.sw),
                            child: Divider(
                              color: allColors.primaryColor,
                              thickness: 1.w,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          CommonTextWidget(
                            color: allColors.textColor,
                            text:
                                'Despite the fact that very few are legally required in the UAE, employment policies serve a crucial role in outlining your mission and setting the tone for workplace practices. They safeguard the rights and interests of both the company and its staff, ensure uniformity in the employee experience, and uphold the commitments made to your customers. For those aiming to build a thriving business, establishing clear and comprehensive policies is essential.',
                            size: 13.sp,
                            weight: FontWeight.w400,
                            padding: noPadding,
                            align: TextAlign.start,
                          ),
                          SizedBox(height: 10.h),
                          CommonTextWidget(
                            color: allColors.textColor,
                            text:
                                'The role of employment policies in supporting your business',
                            size: 17.sp,
                            weight: FontWeight.w500,
                            padding: noPadding,
                            align: TextAlign.start,
                          ),
                          SizedBox(height: 10.h),
                          CommonTextWidget(
                            color: allColors.textColor,
                            text:
                                'Implementing Employment Policies offers numerous benefits for your business. They establish a clear framework and set of guidelines, fostering a cohesive and consistent environment for employees. This unity ensures that all team members understand their roles and responsibilities, promoting uniformity in task execution. Additionally, policies play a critical role in ensuring compliance with legal standards and regulations, safeguarding the business from potential legal and financial pitfalls. In today\'s rapidly evolving legal landscape, this aspect is particularly crucial. Moreover, well-crafted policies enhance operational efficiency and effectiveness, contributing to the overall health and success of the business.',
                            size: 13.sp,
                            weight: FontWeight.w400,
                            padding: noPadding,
                            align: TextAlign.start,
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
