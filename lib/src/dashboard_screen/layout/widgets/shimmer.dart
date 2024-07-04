import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAppBar extends StatelessWidget {
  const ShimmerAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: allColors.shimmerBaseColor!,
      highlightColor: allColors.shimmerHighlightColor!,
      child: Container(
        height: 0.21.sh,
        color: Colors.grey[300],
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 45.h),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.grey[300]!, width: 1.w),
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    ),
                    height: 34.h,
                    width: 37.h,
                  ),
                  SizedBox(width: 10.w),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.grey[300]!, width: 1.w),
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    ),
                    height: 34.h,
                    width: 37.h,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(right: 40.h),
                      child: Container(
                        height: 27.h,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(color: Colors.grey[300]!, width: 1.w),
                      borderRadius: BorderRadius.all(Radius.circular(4.r)),
                    ),
                    height: 34.h,
                    width: 37.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuickLinksShimmer extends StatelessWidget {
  const QuickLinksShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110.h,
      padding: EdgeInsets.only(left: 16.h, right: 16.h),
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: allColors.shimmerBaseColor!,
            highlightColor: allColors.shimmerHighlightColor!,
            child: Padding(
              padding: EdgeInsets.only(left: 5.h, right: 5.h),
              child: Container(
                width: 169.0,
                height: 70.h,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}

class GridShimmer extends StatelessWidget {
  const GridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 5.h),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.76,
        crossAxisSpacing: 7.h,
      ),
      shrinkWrap: true,
      itemCount: 6,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Shimmer.fromColors(
            baseColor: allColors.shimmerBaseColor!,
            highlightColor: allColors.shimmerHighlightColor!,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        );
      },
    );
  }
}

class DocDetailShimmer extends StatelessWidget {
  const DocDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h),
      child: Column(
        children: [
          shimmerContainer(
              height: 60.h, width: double.infinity), // NameWidget shimmer
          SizedBox(height: 20),
          shimmerContainer(
              height: 100, width: double.infinity), // BasicInfoWidget shimmer
          SizedBox(height: 20),
          shimmerContainer(
              height: 160, width: double.infinity), // DescriptionWidget shimmer
          SizedBox(height: 20),
          shimmerContainer(
              height: 200, width: double.infinity), // SummeryWidget shimmer
          SizedBox(height: 20),
          shimmerContainer(
              height: 250,
              width: double.infinity), // RelatedDocumentWidget shimmer
        ],
      ),
    );
  }
}

Widget shimmerContainer({required double height, required double width}) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[100]!,
    child: Container(
      height: height,
      width: width,
      color: Colors.white,
    ),
  );
}

class ShimmerPackageCard extends StatelessWidget {
  const ShimmerPackageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: allColors.shimmerBaseColor!,
            highlightColor: allColors.shimmerHighlightColor!,
            child: Container(
              height: 350.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
