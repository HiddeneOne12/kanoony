import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:shimmer/shimmer.dart';

class BlogShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 15.h),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: allColors.shimmerBaseColor!,
            highlightColor: allColors.shimmerHighlightColor!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 205.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: double.infinity,
                  height: 20.h,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 0.87.sw),
                  child: Divider(
                    color: allColors.primaryColor,
                    thickness: 1.w,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: double.infinity,
                  height: 20.h,
                  color: Colors.white,
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 100.w,
                  height: 20.h,
                  color: Colors.white,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Shimmer.fromColors(
            baseColor: allColors.shimmerBaseColor!,
            highlightColor: allColors.shimmerHighlightColor!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 205.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: double.infinity,
                  height: 20.h,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 0.87.sw),
                  child: Divider(
                    color: allColors.primaryColor,
                    thickness: 1.w,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: double.infinity,
                  height: 20.h,
                  color: Colors.white,
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 100.w,
                  height: 20.h,
                  color: Colors.white,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Shimmer.fromColors(
            baseColor: allColors.shimmerBaseColor!,
            highlightColor: allColors.shimmerHighlightColor!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 205.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: double.infinity,
                  height: 20.h,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 0.87.sw),
                  child: Divider(
                    color: allColors.primaryColor,
                    thickness: 1.w,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: double.infinity,
                  height: 20.h,
                  color: Colors.white,
                ),
                SizedBox(height: 5.h),
                Container(
                  width: 100.w,
                  height: 20.h,
                  color: Colors.white,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
