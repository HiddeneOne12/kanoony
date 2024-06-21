// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';
import 'package:kanoony/core/helpers/logger.dart';
import 'package:kanoony/core/routing/routing_config.dart';
import 'package:kanoony/src/document_module/free_document_screen/service/free_document_service.dart';
import '../model/get_free_documents_model.dart';

class FreeDocNotifier extends StateNotifier<FreeDocState> {
  FreeDocNotifier({required this.freeDocumentService})
      : super(FreeDocState.init());

  FreeDocumentService freeDocumentService;

  sendGetFreeDocRequest() async {
    state = state.copyWith(isLoaded: true);
    var response = await freeDocumentService.getFreeDocRequest();
    var data = response!.toOption().toNullable()?.categories.first.data;

    if (response.isRight()) {
      state = state.copyWith(
        isLoaded: false,
        message: 'fetched Successfully',
        content: data,
      );
      dp(msg: "Response", arg: data.toString());
    } else {
      state = state.copyWith(isLoaded: false);
      state = FreeDocState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }

  sendDownloadFreeDocRequest(int id, String type) async {
    state = state.copyWith(isLoaded: true);

    var response = await freeDocumentService.downloadFreeDocRequest(
        id,
        userProfileHelper.userData.email,
        userProfileHelper.userData.name,
        type);
    var data = response!.toOption().toNullable()?.message;

    if (response.isRight()) {
      state = state.copyWith(
        isLoaded: false,
        message: 'fetched Successfully',
      );
      dp(msg: "Response", arg: data.toString());
      RoutesUtils.context.pop();
    } else {
      state = state.copyWith(isLoaded: false);
      state = FreeDocState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }
}

class FreeDocState extends Equatable {
  bool isLoaded = true;

  List<FreeDoc>? content = [];
  bool isError = false;
  String message;

  FreeDocState({
    required this.isError,
    required this.message,
    this.isLoaded = false,
    this.content = const [],
  });

  FreeDocState.init({this.message = '', this.isError = false});

  FreeDocState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  FreeDocState copyWith({
    bool? isError,
    String? message,
    bool? isLoaded,
    List<FreeDoc>? content,
  }) {
    return FreeDocState(
      content: content ?? this.content,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
