// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/helpers/logger.dart';
import 'package:kanoony/src/packages_screen/service/package_service.dart';

class PackageNotifier extends StateNotifier<PackageState> {
  PackageNotifier({required this.packageService}) : super(PackageState.init());

  PackageService packageService;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  CardEditController cardFieldController = CardEditController();

  sendSubscribePackageRequest(int id, bool isGuest) async {
    state = state.copyWith(isLoaded: ValueNotifier(true));
    logger.i(
        "DTA :  ${cardFieldController.details} and initial :  ${cardFieldController.initalDetails}");

    var stripeToken = await paymentHelper.createToken(
        cardFieldController.details, '', nameController.text);
    logger.i("message $stripeToken");
    state = state.copyWith(isLoaded: ValueNotifier(true));

    var response = await packageService.subscribePackageRequest(
      id,
      isGuest ? emailController.text : userProfileHelper.userData.email,
      nameController.text,
      stripeToken,
    );
    var data = response!.toOption().toNullable()?.user;
    dp(msg: "Response", arg: data.toString());
    if (response.isRight()) {
      state = state.copyWith(
        isLoaded: ValueNotifier(false),
        message: 'fetched Successfully',
      );

      cardFieldController.clear();
      nameController.clear();
      emailController.clear();
    } else {
      state = state.copyWith(isLoaded: ValueNotifier(false));
      state = PackageState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }

  sendCancelSubscriptionRequest() async {
    state = state.copyWith(isLoaded: ValueNotifier(true));

    var response = await packageService.cancelSubscribeRequest();
    var data = response!.toOption().toNullable()?.message;
    dp(msg: "Response", arg: data.toString());
    if (response.isRight()) {
      state = state.copyWith(
        isLoaded: ValueNotifier(false),
        message: 'fetched Successfully',
      );

      cardFieldController.clear();
      nameController.clear();
      emailController.clear();
    } else {
      state = state.copyWith(isLoaded: ValueNotifier(false));
      state = PackageState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }
}

class PackageState extends Equatable {
  ValueNotifier<bool>? isLoaded = ValueNotifier(false);

  bool isError = false;
  String message;

  PackageState({
    required this.isError,
    required this.message,
    this.isLoaded,
  });

  PackageState.init({this.message = '', this.isError = false});

  PackageState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  PackageState copyWith({
    bool? isError,
    String? message,
    String? selectedType,
    ValueNotifier<bool>? isLoaded,
  }) {
    return PackageState(
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
