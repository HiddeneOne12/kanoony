import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/common_widgets/common_sizebox_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'common_button_widget.dart';

showImagePickupPopUp(
    context, void Function()? onCameraTap, void Function()? onGalleryTap) {
  showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: allColors.canvasColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.r,
              ),
            ),
          ),
          titlePadding: EdgeInsets.only(top: 15.h, bottom: 10.h),
          contentPadding: EdgeInsets.all(0.h),
          title: Text(
            "Pick image",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                fontSize: 17.sp,
                fontWeight: FontWeight.w700,
                color: allColors.textColor),
            textAlign: TextAlign.center,
          ),
          content: Padding(
            padding: EdgeInsets.only(
                left: 16.h, right: 16.h, bottom: 20.h, top: 10.h),
            child: Container(
              width: 400.w,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: allColors.textColor.withOpacity(0.5),
                      spreadRadius: 7,
                      blurRadius: 7,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: allColors.canvasColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.r))),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: 25.h, bottom: 25.h, left: 16.h, right: 16.h),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CommonButton(
                          height: 30.h,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.sp,
                                  color: allColors.canvasColor),
                          backgroundColor: allColors.primaryColor,
                          text: 'Gallery',
                          onPressed: onGalleryTap),
                      CommonSizeBoxWidget(height: 10.h, width: 0),
                      CommonButton(
                          height: 30.h,
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.sp,
                                  color: allColors.canvasColor),
                          backgroundColor: allColors.successColor,
                          text: 'Camera',
                          onPressed: onCameraTap),
                    ]),
              ),
            ),
          ),
        );
      });
}
