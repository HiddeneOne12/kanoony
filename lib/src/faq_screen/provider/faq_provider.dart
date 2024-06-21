// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/core/helpers/logger.dart';
import 'package:kanoony/src/faq_screen/service/faq_service.dart';

import '../model/get_faq_listing.dart';

class FaqsNotifier extends StateNotifier<FaqsState> {
  FaqsNotifier({required this.faqService}) : super(FaqsState.init());

  FaqService faqService;

  sendGetFaqsContentRequest() async {
    state = state.copyWith(isLoaded: true);
    var response = await faqService.getFaqsContentRequest();
    var data = response!.toOption().toNullable();

    if (response.isRight()) {
      state = state.copyWith(
        isLoaded: false,
        message: 'fetched Successfully',
        content: data,
      );
      dp(msg: "Response", arg: data.toString());
    } else {
      state = state.copyWith(isLoaded: false);
      state = FaqsState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }
}

class FaqsState extends Equatable {
  bool isLoaded = true;

  List<FaqsUseModel>? content = [];
  bool isError = false;
  String message;

  FaqsState({
    required this.isError,
    required this.message,
    this.isLoaded = false,
    this.content = const [],
  });

  FaqsState.init({this.message = '', this.isError = false});

  FaqsState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  FaqsState copyWith({
    bool? isError,
    String? message,
    bool? isLoaded,
    List<FaqsUseModel>? content,
  }) {
    return FaqsState(
      content: content ?? this.content,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
