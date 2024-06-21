import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/src/favorite_screen/layout/body.dart';

import '../../core/common_widgets/common_bottombar.dart';
import '../../core/common_widgets/common_end_drawer.dart';
import '../../core/common_widgets/common_profile_drawer.dart';
import '../../core/constants/static_constants/static_constants.dart';

class FavoriteScreen extends ConsumerWidget {
  static const String favoriteRoute = "/FavoriteScreen";
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          drawer: isArabic
              ? AppEndProfileDrawer().appEndDrawer(context, ref)
              : AppMenuProfileDrawer().appProfileDrawer(context, ref),
          endDrawer: isArabic
              ? AppMenuProfileDrawer().appProfileDrawer(context, ref)
              : AppEndProfileDrawer().appEndDrawer(context, ref),
          backgroundColor: allColors.scaffoldColor,
          resizeToAvoidBottomInset: false,
          bottomNavigationBar: const CommonBottomBar(),
          body: const FavoriteBody(),
        ),
      ),
    );
  }
}
