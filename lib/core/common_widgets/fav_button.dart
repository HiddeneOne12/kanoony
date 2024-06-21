// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/common_widgets/common_confirmation_dialog.dart';
import 'package:kanoony/src/auth_module/login_screen/login_screen.dart';

import '../constants/object_constants/object_constants.dart';
import '../routing/routing_config.dart';

class FavButton extends ConsumerStatefulWidget {
  String id;
  FavButton({super.key, required this.id});

  @override
  ConsumerState<FavButton> createState() => _FavButtonState();
}

class _FavButtonState extends ConsumerState<FavButton> {
  @override
  Widget build(BuildContext context) {
    var provider = ref.read(allProviderList.favDocProvider.notifier);
    return InkWell(
      onTap: () async {
        if (userProfileHelper.userData.id.isNotEmpty) {
          confirmationDialogBox(RoutesUtils.context, () async {
            await provider.sendAddFavDocRequest(widget.id);
            print("call");
          }, 'Are you sure you want to add this document to favorites?');
        } else {
          confirmationDialogBox(RoutesUtils.context, () async {
            RoutesUtils.context.go(LoginScreen.loginRoute);
            print("call");
          }, 'You need to sign in to access this feature!');
        }
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: allColors.canvasColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(4.r))),
        height: 34.h,
        width: 37.h,
        child: Icon(
          Icons.favorite_border_outlined,
          size: 22.h,
          color: allColors.canvasColor,
        ),
      ),
    );
  }
}
