// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/common_widgets/common_bottombar.dart';
import '../../../core/common_widgets/common_end_drawer.dart';
import '../../../core/common_widgets/common_profile_drawer.dart';
import '../../../core/constants/object_constants/object_constants.dart';
import 'layout/body.dart';

class PaidDocumentScreen extends ConsumerWidget {
  static const String paidDocumentRoute = "/PaidDocumentScreen";
  String slug;
  PaidDocumentScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: allColors.scaffoldColor,
          drawer: AppMenuProfileDrawer().appProfileDrawer(context, ref),
          endDrawer: AppEndProfileDrawer().appEndDrawer(context, ref),
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: const CommonBottomBar(),
          body: PaidDocumentBody(
            slug: slug,
          ),
        ),
      ),
    );
  }
}
