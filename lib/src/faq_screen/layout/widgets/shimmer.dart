import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFaqCard extends StatelessWidget {
  const ShimmerFaqCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 7.h),
          child: Shimmer.fromColors(
            baseColor: allColors.shimmerBaseColor!,
            highlightColor: allColors.shimmerHighlightColor!,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.grey,
                          height: 20.h,
                          width: 20.h,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          color: Colors.grey,
                          height: 20.h,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10.h),
                        ),
                      ),
                      Container(
                        height: 22.h,
                        width: 22.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    color: Colors.grey,
                    height: 20.h,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 7.h),
          child: Shimmer.fromColors(
            baseColor: allColors.shimmerBaseColor!,
            highlightColor: allColors.shimmerHighlightColor!,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.grey,
                          height: 20.h,
                          width: 20.h,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          color: Colors.grey,
                          height: 20.h,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10.h),
                        ),
                      ),
                      Container(
                        height: 22.h,
                        width: 22.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    color: Colors.grey,
                    height: 20.h,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 7.h),
          child: Shimmer.fromColors(
            baseColor: allColors.shimmerBaseColor!,
            highlightColor: allColors.shimmerHighlightColor!,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.grey,
                          height: 20.h,
                          width: 20.h,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          color: Colors.grey,
                          height: 20.h,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10.h),
                        ),
                      ),
                      Container(
                        height: 22.h,
                        width: 22.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    color: Colors.grey,
                    height: 20.h,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 16.h, right: 16.h, bottom: 7.h),
          child: Shimmer.fromColors(
            baseColor: allColors.shimmerBaseColor!,
            highlightColor: allColors.shimmerHighlightColor!,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                  left: 16.h, right: 16.h, top: 10.h, bottom: 5.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.grey,
                          height: 20.h,
                          width: 20.h,
                        ),
                      ),
                      Expanded(
                        flex: 10,
                        child: Container(
                          color: Colors.grey,
                          height: 20.h,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10.h),
                        ),
                      ),
                      Container(
                        height: 22.h,
                        width: 22.h,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(50.r)),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    color: Colors.grey,
                    height: 20.h,
                    width: double.infinity,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
