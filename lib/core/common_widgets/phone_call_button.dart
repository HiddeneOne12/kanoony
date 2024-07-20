import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/extentions/themes_typography.dart';

import '../../src/service_module/widgets/request_callback_popup.dart';

class PhoneCallButton extends ConsumerWidget {
  const PhoneCallButton({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.r))),
      backgroundColor: allColors.primaryColor.withOpacity(0.3),
      onPressed: () async {
        await requestCallBackPopUp(context, ref, true, false);
      },
      child: Container(
        height: 68.h,
        width: 68.h,
        padding: EdgeInsets.all(6.h),
        decoration: BoxDecoration(
            color: context.primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(100.r))),
        child: Container(
          decoration: BoxDecoration(
              color: context.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(100.r))),
          child: Icon(
            Icons.phone,
            color: context.onSurfaceColor,
          ),
        ),
      ),
    );
  }
}
