import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';

CircleAvatar buildProfileNetworkImage(String path) {
  return CircleAvatar(
    backgroundColor: allColors.primaryColor,
    minRadius: 106.r,
    maxRadius: 106.r,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(150),
      child: CachedNetworkImage(
          key: UniqueKey(),
          imageUrl: userProfileHelper.userData.profilePhotoUrl,
          imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(150.r)),
                  border: Border.all(color: allColors.textColor, width: 1.w),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              SizedBox(
                  height: 60.w,
                  width: 60.w,
                  child: Center(
                    child: CircularProgressIndicator.adaptive(
                      value: downloadProgress.progress,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor),
                    ),
                  )),
          errorWidget: (context, url, error) => Icon(
                Icons.person,
                size: 60.w,
              )),
    ),
  );
}
