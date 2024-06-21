// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../src/dashboard_screen/model/search_home_docs_model.dart';
import '../../src/document_module/document_details_screen/document_details_screen.dart';
import '../constants/object_constants/object_constants.dart';
import '../constants/static_constants/static_constants.dart';
import '../routing/routing_config.dart';

class SearchListingWidget extends ConsumerStatefulWidget {
  List<HomeSearchDoc> list;
  SearchListingWidget({super.key, required this.list});

  @override
  ConsumerState<SearchListingWidget> createState() =>
      _SearchListingWidgetState();
}

class _SearchListingWidgetState extends ConsumerState<SearchListingWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.h, right: 16.h, top: 6.h),
      child: Container(
        height: 120.h,
        child: Card(
          elevation: 5,
          color: allColors.scaffoldColor,
          surfaceTintColor: allColors.scaffoldColor,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.list.isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.only(left: 16.h, right: 16.h),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 5.h, top: 5.h),
                      itemBuilder: (context, index) {
                        return SearchedHomeTile(
                          index: index,
                          searchedItem: widget.list,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                      itemCount: widget.list.length,
                      shrinkWrap: true,
                    ),
                  ),
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchedHomeTile extends ConsumerStatefulWidget {
  final List<HomeSearchDoc>? searchedItem;
  int index;
  SearchedHomeTile({Key? key, this.searchedItem, required this.index})
      : super(key: key);

  @override
  ConsumerState<SearchedHomeTile> createState() => _SearchedHomeTileState();
}

class _SearchedHomeTileState extends ConsumerState<SearchedHomeTile> {
  @override
  Widget build(BuildContext context) {
    var variable = ref.watch(allProviderList.dashboardProvider);
    var provider = ref.read(allProviderList.dashboardProvider.notifier);
    return InkWell(
      onTap: () {
        RoutesUtils.context.push(
          DocumentDetailScreen.documentDetailRoute,
          extra: {
            TextUtils.slug: widget.searchedItem![widget.index].slug.toString()
          },
        );

        provider.searchController.clear();
        variable.searchedDoc.clear();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.search,
                color: allColors.textColor,
              ),
              SizedBox(
                width: 14.w,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.searchedItem![widget.index].title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 15.sp, color: allColors.textColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
