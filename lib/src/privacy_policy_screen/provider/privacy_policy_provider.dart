// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/core/helpers/logger.dart';
import 'package:kanoony/src/privacy_policy_screen/service/privacy_policy_service.dart';

class PrivacyPolicyNotifier extends StateNotifier<PrivacyPolicyState> {
  PrivacyPolicyNotifier({required this.privacyPolicyService})
      : super(PrivacyPolicyState.init());

  PrivacyPolicyService privacyPolicyService;

  sendGetPrivacyPolicyContentRequest() async {
    state = state.copyWith(isLoaded: true);
    var response = await privacyPolicyService.getPrivacyPolicyContentRequest();
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
      state = PrivacyPolicyState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }
}

class PrivacyPolicyState extends Equatable {
  bool isLoaded = true;

  String content = '';
  bool isError = false;
  String message;

  PrivacyPolicyState({
    required this.isError,
    required this.message,
    this.isLoaded = false,
    this.content = '',
  });

  PrivacyPolicyState.init({this.message = '', this.isError = false});

  PrivacyPolicyState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  PrivacyPolicyState copyWith({
    bool? isError,
    String? message,
    bool? isLoaded,
    String? content,
  }) {
    return PrivacyPolicyState(
      content: content ?? this.content,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
