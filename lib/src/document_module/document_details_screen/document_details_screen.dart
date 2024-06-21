// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common_widgets/common_bottombar.dart';
import '../../../core/common_widgets/common_end_drawer.dart';
import '../../../core/common_widgets/common_profile_drawer.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import '../../../core/constants/static_constants/static_constants.dart';
import 'layout/body.dart';

class DocumentDetailScreen extends ConsumerWidget {
  String slug;
  static const String documentDetailRoute = "/DocumentDetailScreen";
  DocumentDetailScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: allColors.scaffoldColor,
          drawer: isArabic
              ? AppEndProfileDrawer().appEndDrawer(context, ref)
              : AppMenuProfileDrawer().appProfileDrawer(context, ref),
          endDrawer: isArabic
              ? AppMenuProfileDrawer().appProfileDrawer(context, ref)
              : AppEndProfileDrawer().appEndDrawer(context, ref),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: const CommonBottomBar(),
          body: DocumentDetailBody(
            slug: slug,
          ),
        ),
      ),
    );
  }
}
