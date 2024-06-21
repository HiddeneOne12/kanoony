// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/core/helpers/logger.dart';
import 'package:kanoony/src/terms_of_use/service/terms_of_use_service.dart';

class TermsOfUseNotifier extends StateNotifier<TermsOfUseState> {
  TermsOfUseNotifier({required this.termsOfUseService})
      : super(TermsOfUseState.init());

  TermsOfUseService termsOfUseService;

  sendGetTermsOfUseContentRequest() async {
    state = state.copyWith(isLoaded: true);
    var response = await termsOfUseService.getTermsOfUseContentRequest();
    var data = response!.toOption().toNullable()?.detailsDescription;

    if (response.isRight()) {
      state = state.copyWith(
        isLoaded: false,
        message: 'fetched Successfully',
        content: data,
      );
      dp(msg: "Response", arg: data.toString());
    } else {
      state = state.copyWith(isLoaded: false);
      state = TermsOfUseState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }
}

class TermsOfUseState extends Equatable {
  bool isLoaded = true;

  String content = '';
  bool isError = false;
  String message;

  TermsOfUseState({
    required this.isError,
    required this.message,
    this.isLoaded = false,
    this.content = '',
  });

  TermsOfUseState.init({this.message = '', this.isError = false});

  TermsOfUseState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  TermsOfUseState copyWith({
    bool? isError,
    String? message,
    bool? isLoaded,
    String? content,
  }) {
    return TermsOfUseState(
      content: content ?? this.content,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
