// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/helpers/logger.dart';
import '../model/get_paid_doc_model.dart';
import '../service/paid_doc_service.dart';

class PaidDocNotifier extends StateNotifier<PaidDocState> {
  PaidDocNotifier({required this.paidDocumentService})
      : super(PaidDocState.init());

  PaidDocService paidDocumentService;

  TextEditingController promoCodeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  CardEditController cardFieldController = CardEditController();
  sendGetPaidDocRequest(String slug) async {
    state = state.copyWith(isLoaded: true);
    var response = await paidDocumentService.getPaidDocRequest(slug);
    var data = response!.toOption().toNullable()?.categories;
    var title = response.toOption().toNullable()?.parent.title;
    if (response.isRight()) {
      state = state.copyWith(
        isLoaded: false,
        title: title,
        message: 'fetched Successfully',
        content: data,
      );
      dp(msg: "Response", arg: data.toString());
    } else {
      state = state.copyWith(isLoaded: false);
      state = PaidDocState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }

  sendDownloadPaidDocByPackageRequest(int id, String selectedValue) async {
    state = state.copyWith(isLoading: ValueNotifier(true));

    var response = await paidDocumentService.downloadPaidDocByPackageRequest(
      id,
      selectedValue,
    );
    var data = response!.toOption().toNullable()?.message;
    dp(msg: "Response", arg: data.toString());
    if (response.isRight()) {
      state = state.copyWith(
        isLoading: ValueNotifier(false),
        message: 'fetched Successfully',
      );

      dp(msg: "Response", arg: data.toString());

      cardFieldController.clear();
      nameController.clear();
      emailController.clear();
      promoCodeController.clear();
    } else {
      state = state.copyWith(isLoading: ValueNotifier(false));
      state = PaidDocState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }

  sendDownloadPaidDocRequest(int id, String selectedValue, bool isGuest) async {
    state = state.copyWith(isLoading: ValueNotifier(true));
    logger.i(
        "DTA :  ${cardFieldController.details} and initial :  ${cardFieldController.initalDetails}");

    var stripeToken = await paymentHelper.createToken(
        cardFieldController.details,
        promoCodeController.text,
        nameController.text);
    logger.i("message $stripeToken");

    var response = await paidDocumentService.downloadPaidDocRequest(
        id,
        isGuest ? emailController.text : userProfileHelper.userData.email,
        nameController.text,
        selectedValue,
        stripeToken,
        promoCodeController.text);
    var data = response!.toOption().toNullable()?.user;
    dp(msg: "Response", arg: data.toString());
    if (response.isRight()) {
      state = state.copyWith(
        isLoading: ValueNotifier(false),
        message: 'fetched Successfully',
      );

      dp(msg: "Response", arg: data.toString());

      cardFieldController.clear();
      nameController.clear();
      emailController.clear();
      promoCodeController.clear();
    } else {
      state = state.copyWith(isLoading: ValueNotifier(false));
      state = PaidDocState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }
}

class PaidDocState extends Equatable {
  bool isLoaded = true;
  ValueNotifier<bool>? isLoading = ValueNotifier(false);
  List<Category>? content = [];
  bool isError = false;
  String? title;
  String message;
  String? selectedType;

  PaidDocState({
    required this.isError,
    this.selectedType = '',
    required this.message,
    required this.title,
    this.isLoaded = false,
    this.isLoading,
    this.content = const [],
  });

  PaidDocState.init({this.message = '', this.isError = false});

  PaidDocState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  PaidDocState copyWith(
      {bool? isError,
      String? message,
      String? title,
      String? selectedType,
      bool? isLoaded,
      List<Category>? content,
      ValueNotifier<bool>? isLoading}) {
    return PaidDocState(
      content: content ?? this.content,
      title: title ?? this.title,
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      selectedType: selectedType ?? this.selectedType,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
