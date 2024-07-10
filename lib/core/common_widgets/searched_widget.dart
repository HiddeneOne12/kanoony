// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/helpers/pascal_case_converter.dart';
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
      padding: EdgeInsets.only(left: 12.h, right: 12.h, top: 10.h),
      child: SizedBox(
        height: 160.h,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0), ),
          elevation: 4,
          color: Colors.white,
          surfaceTintColor: Colors.white,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.list.isNotEmpty) ...[
                  Padding(
                    padding: EdgeInsets.only(),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(left: 16.h, right: 16.h,top: 16,bottom: 16),
                      itemBuilder: (context, index) {
                        return SearchedHomeTile(
                          index: index,
                          searchedItem: widget.list,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                           Divider(color: allColors.borderColor.withOpacity(0.2),height: 28,),
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
                      capitalizeFirst(widget.searchedItem![widget.index].title),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                          color: allColors.textColor),
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
