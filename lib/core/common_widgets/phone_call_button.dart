import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';

class PhoneCallButton extends StatelessWidget {
  const PhoneCallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(100.r))),
      backgroundColor: allColors.primaryColor.withOpacity(0.3),
      onPressed: () {
        //TODO @Qasid call the user
      },
      child: Container(
        height: 68.h,
        width: 68.h,
        padding: EdgeInsets.all(6.h),
        decoration: BoxDecoration(
            color: allColors.primaryColor.withOpacity(0.3),
            borderRadius: BorderRadius.all(Radius.circular(100.r))),
        child: Container(
          decoration: BoxDecoration(
              color: allColors.primaryColor,
              borderRadius: BorderRadius.all(Radius.circular(100.r))),
          child: Icon(
            Icons.phone,
            color: allColors.textColor,
          ),
        ),
      ),
    );
  }
}
