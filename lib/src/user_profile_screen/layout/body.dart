import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kanoony/core/common_widgets/common_appbar.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/core/common_widgets/common_image_picker_popup.dart';
import 'package:kanoony/core/common_widgets/common_sizebox_widget.dart';
import 'package:kanoony/core/common_widgets/common_text_widget.dart';
import 'package:kanoony/core/common_widgets/common_textfield_widget.dart';
import 'package:kanoony/core/constants/image_paths/image_paths.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/constants/static_constants/static_constants.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/user_profile_screen/layout/widgets/network_image.dart';

class UserProfileBody extends ConsumerStatefulWidget {
  const UserProfileBody({super.key});

  @override
  ConsumerState<UserProfileBody> createState() => _UserProfileBodyState();
}

class _UserProfileBodyState extends ConsumerState<UserProfileBody> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      ref.read(allProviderList.userProfileProvider.notifier).fillData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var dashboard = ref.watch(allProviderList.dashboardProvider);
    var variables = ref.watch(allProviderList.userProfileProvider);
    var provider = ref.read(allProviderList.userProfileProvider.notifier);
    return Directionality(
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonAppBar(
            mainText: dashboard.staticData?.editProfile ?? '',
            subText: '',
            height: 0.16,
            isBack: true,
            isBlogTextField: false,
            isFilter: false,
            isButton: false,
            isTextfield: false,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 0.3.sw),
                child: Image.asset(
                  PngImagePaths.dashboardDesignImg,
                  height: 326.65.h,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: 620.h,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 20.h),
                                  child: InkWell(
                                    onTap: () async {
                                      await showImagePickupPopUp(context, () {
                                        RoutesUtils.context.pop();
                                        provider.pickImage(ImageSource.camera);
                                      }, () {
                                        RoutesUtils.context.pop();
                                        provider.pickImage(ImageSource.gallery);
                                      });
                                      provider.enableButton();
                                    },
                                    child: SizedBox(
                                      height: 106.w,
                                      width: 106.w,
                                      child: Stack(
                                        children: <Widget>[
                                          if (variables.image != null) ...[
                                            CircleAvatar(
                                              radius: 150.r,
                                              backgroundColor:
                                                  allColors.canvasColor,
                                              child: Container(
                                                  height: 106.w,
                                                  width: 106.w,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                150.r)),
                                                    border: Border.all(
                                                        color:
                                                            allColors.textColor,
                                                        width: 1.w),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            150.r),
                                                    child: Image.file(
                                                      variables.image!,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )),
                                            )
                                          ] else if (userProfileHelper.userData
                                              .profilePhotoUrl.isNotEmpty) ...[
                                            buildProfileNetworkImage(
                                                userProfileHelper
                                                    .userData.profilePhotoUrl),
                                          ] else ...[
                                            SizedBox(
                                              height: 106.w,
                                              width: 106.w,
                                              child: CircleAvatar(
                                                radius: 150.r,
                                                backgroundColor:
                                                    allColors.primaryColor,
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            150.r),
                                                    child: Icon(
                                                      Icons.person,
                                                      size: 60.w,
                                                      color:
                                                          allColors.canvasColor,
                                                    )),
                                              ),
                                            )
                                          ],
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              height: 30.w,
                                              width: 30.w,
                                              decoration: BoxDecoration(
                                                  color: allColors.textColor,
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                      color: allColors.textColor
                                                          .withOpacity(0.1),
                                                      width: 1.0)),
                                              child: Center(
                                                heightFactor: 15,
                                                widthFactor: 15,
                                                child: InkResponse(
                                                  onTap: () async {
                                                    await showImagePickupPopUp(
                                                        context, () {
                                                      RoutesUtils.context.pop();
                                                      provider.pickImage(
                                                          ImageSource.camera);
                                                    }, () {
                                                      RoutesUtils.context.pop();
                                                      provider.pickImage(
                                                          ImageSource.gallery);
                                                    });
                                                  },
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                    size: 13.w,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CommonSizeBoxWidget(height: 20.h, width: 0),
                      CommonTextField(
                        onChanged: (val) {
                          provider.enableButton();
                        },
                        focusNode: provider.nameFocus,
                        textEditingController: provider.nameController,
                        hintText: dashboard.staticData?.name ?? '',
                        labelText: dashboard.staticData?.name ?? '',
                        isProfile: true,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextField(
                        readOnly: true,
                        focusNode: FocusNode(),
                        textEditingController: provider.emailController,
                        hintText: dashboard.staticData?.enterEmailAddress ?? '',
                        labelText: dashboard.staticData?.email ?? '',
                        isProfile: true,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CommonTextField(
                        focusNode: provider.phoneFocus,
                        onChanged: (val) {
                          provider.enableButton();
                        },
                        inputType: TextInputType.number,
                        textEditingController: provider.phoneController,
                        hintText: dashboard.staticData?.enterPhoneNumber ?? '',
                        labelText: dashboard.staticData?.mobileNumber ?? '',
                        isProfile: true,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      // CommonTextField(
                      //   focusNode: FocusNode(),
                      //   textEditingController:
                      //       provider.currentPasswordController,
                      //   hintText: "Enter Current Password",
                      //   labelText: 'Current Password',
                      //   isHidden: true,
                      //   isProfile: true,
                      // ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      // CommonTextField(
                      //   focusNode: FocusNode(),
                      //   textEditingController: provider.newPasswordController,
                      //   hintText: "Enter New Password",
                      //   labelText: 'New Password',
                      //   isHidden: true,
                      //   isProfile: true,
                      // ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      // CommonTextField(
                      //   focusNode: FocusNode(),
                      //   textEditingController:
                      //       provider.confirmPasswordController,
                      //   hintText: "Confirm Password",
                      //   labelText: 'Confirm Password',
                      //   isHidden: true,
                      //   isProfile: true,
                      // ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: 16.h, right: 16.h),
                      //   child: Container(
                      //     height: 68.h,
                      //     width: MediaQuery.sizeOf(context).width.w,
                      //     decoration: BoxDecoration(
                      //         color: allColors.canvasColor,
                      //         border: Border.all(
                      //             color: allColors.buttonBorderColor),
                      //         borderRadius:
                      //             BorderRadius.all(Radius.circular(4.r))),
                      //     child: Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         CommonTextWidget(
                      //             color: allColors.textColor,
                      //             size: 10.sp,
                      //             text: 'Two-factor authentication',
                      //             weight: FontWeight.w700,
                      //             padding: EdgeInsets.only(
                      //                 left: 16.h,
                      //                 right: 16.h,
                      //                 top: 5.h,
                      //                 bottom: 5.h)),
                      //         CommonTextWidget(
                      //             color: allColors.greyTextColor,
                      //             size: 10.sp,
                      //             weight: FontWeight.w300,
                      //             align: TextAlign.start,
                      //             text:
                      //                 'Help protect your account from unauthorized access by \nrequiring second authentication ',
                      //             padding: EdgeInsets.only(
                      //                 left: 16.h,
                      //                 right: 16.h,
                      //                 top: 5.h,
                      //                 bottom: 5.h)),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      CommonSizeBoxWidget(height: 0.01.sh, width: 0),
                      CommonButton(
                          loadingNotifier: variables.isLoadingButton,
                          height: 45.h,
                          radius: 20,
                          padding: EdgeInsets.only(left: 16.h, right: 16.h),
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.sp,
                                  color: allColors.canvasColor),
                          backgroundColor: !variables.isEnabled
                              ? allColors.primaryColor.withOpacity(0.3)
                              : allColors.primaryColor,
                          text: 'SAVE CHANGES',
                          onPressed: () async {
                            if (variables.isEnabled) {
                              FocusScope.of(context).unfocus();
                              if (variables.isEnabled) {
                                await provider.sendPostRequest();
                              }
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
