import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common_widgets/common_appbar.dart';
import '../../../../core/constants/image_paths/image_paths.dart';
import '../../../../core/constants/object_constants/object_constants.dart';
import '../../../../core/constants/static_constants/static_constants.dart';
import '../../../blog_module/blog_listing_screen/layout/widgets/blog_widget.dart';
import '../../../blog_module/blog_listing_screen/layout/widgets/shimmer.dart';
import '../../../dashboard_screen/layout/widgets/shimmer.dart';

class NewsListingBody extends ConsumerStatefulWidget {
  const NewsListingBody({super.key});

  @override
  ConsumerState<NewsListingBody> createState() => _NewsListingBodyState();
}

class _NewsListingBodyState extends ConsumerState<NewsListingBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref
          .read(allProviderList.dashboardProvider.notifier)
          .sendGetHomeContentRequest();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dashboardVariables = ref.watch(allProviderList.dashboardProvider);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            dashboardVariables.isLoaded
                ? const ShimmerAppBar()
                : CommonAppBar(
                    mainText: 'NEWS LISTINGS',
                    subText: '',
                    height: 0.22,
                    isBack: true,
                    isBlogTextField: true,
                    isFilter: true,
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
                SizedBox(
                  height: 0.76.sh,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        dashboardVariables.isLoaded
                            ? BlogShimmer()
                            : ListView.builder(
                                itemCount: dashboardVariables
                                    .news.length, // Length of the data list
                                shrinkWrap: true,
                                padding: EdgeInsets.only(top: 15.h),
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  var data = dashboardVariables.news[index];
                                  return Blog(
                                    date: dashboardVariables.staticData?.news ??
                                        '',
                                    title: data.title,
                                    description: data.summarytext,
                                    imageUrl: data.mediaUrl,
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
      ),
    );
  }
}
