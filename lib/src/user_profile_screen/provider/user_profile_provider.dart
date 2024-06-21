import 'dart:io';

import 'package:flutter/material.dart';
// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/helpers/logger.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/user_profile_screen/layout/widgets/image_cropper_widget.dart';
import 'package:kanoony/src/user_profile_screen/model/get_user_detail_model.dart';
import 'package:kanoony/src/user_profile_screen/user_profile_service/user_profile_service.dart';

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  UserProfileNotifier({required this.userProfileService})
      : super(UserProfileState.init());

  UserProfileService userProfileService;
  FocusNode nameFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final form = GlobalKey<FormState>();
  fillData() {
    emailController.text = userProfileHelper.userData.email;
    nameController.text = userProfileHelper.userData.name;
    phoneController.text = userProfileHelper.userData.mobile == 'null'
        ? ''
        : userProfileHelper.userData.mobile;
    state.image = null;
    confirmPasswordController.clear();
    newPasswordController.clear();
    currentPasswordController.clear();
  }

  clearData() {
    state = state.copyWith(
        isLoading: false,
        image: null,
        isLoadingButton: ValueNotifier(false),
        isEnabled: false);
    emailController.clear();
    nameController.clear();
    phoneController.clear();
    confirmPasswordController.clear();
    newPasswordController.clear();
    currentPasswordController.clear();
  }

  Future pickImage(ImageSource source) async {
    try {
      state.isLoading = false;
      final images = await ImagePicker().pickImage(source: source);
      if (images == null) return null;

      var imageTemp = await Navigator.push(RoutesUtils.context,
          MaterialPageRoute(builder: (_) {
        return ImageCropper(path: images.path);
      }));
      print("path is ");

      print(imageTemp);

      state = state.copyWith(image: imageTemp);
      logger.i(state.image);
      await enableButton();
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  enableButton() {
    if (nameController.text != userProfileHelper.userData.name ||
        phoneController.text != userProfileHelper.userData.mobile ||
        state.image != null) {
      state = state.copyWith(isEnabled: true);
    }
  }

  sendUserDetailRequest() async {
    state = state.copyWith(isLoading: true);
    var response = await userProfileService.getUserProfileDetailRequest();
    var data = response!.toOption().toNullable();

    if (response.isRight()) {
      state = state.copyWith(
        isError: false,
        isEnabled: false,
        userProfile: data,
        message: 'User Fetched Successfully',
      );
      userProfileHelper.saveUserData(data!);
      await userProfileHelper.getUserData();
      dp(msg: "Message", arg: data.toString());

      await clearData();
    } else {
      state = state.copyWith(isLoading: false);
      state = UserProfileState.error(
          isError: true, message: "Error in posting data please try again");
    }
    state = state.copyWith(isLoading: false);
  }

  sendPostRequest() async {
    state = state.copyWith(isLoadingButton: ValueNotifier(true));
    var response = await userProfileService.postUpdateUserProfileRequest(
        nameController.text, state.image, phoneController.text);
    var data = response!.toOption().toNullable()?.message;

    if (response.isRight()) {
      state = state.copyWith(
        isError: false,
        isEnabled: false,
        message: 'User Updated Successfully',
      );
      dp(msg: "Message", arg: data.toString());

      await clearData();
    } else {
      state = state.copyWith(isLoading: false, isEnabled: false);
      state = UserProfileState.error(
          isError: true, message: "Error in posting data please try again");
    }
    state = state.copyWith(isLoadingButton: ValueNotifier(false));
  }
}

class UserProfileState extends Equatable {
  bool isLoading = false;
  bool isEnabled = false;
  ValueNotifier<bool>? isLoadingButton = ValueNotifier(false);
  File? image;
  UserDetailModel? userProfile;
  bool isError = false;
  String message;

  UserProfileState({
    required this.isLoading,
    required this.isLoadingButton,
    required this.isEnabled,
    required this.userProfile,
    required this.image,
    required this.isError,
    required this.message,
  });

  UserProfileState.init({this.message = '', this.isError = false});

  UserProfileState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  UserProfileState copyWith(
      {bool? isLoading,
      UserDetailModel? userProfile,
      bool? isEnabled,
      ValueNotifier<bool>? isLoadingButton,
      bool? isError,
      String? message,
      bool? obscureText,
      File? image}) {
    return UserProfileState(
        image: image ?? this.image,
        isLoadingButton: isLoadingButton ?? this.isLoadingButton,
        isLoading: isLoading ?? this.isLoading,
        isEnabled: isEnabled ?? this.isEnabled,
        isError: isError ?? this.isError,
        message: message ?? this.message,
        userProfile: userProfile ?? this.userProfile);
  }
}
