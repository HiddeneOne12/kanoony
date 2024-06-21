// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/core/helpers/logger.dart';
import '../model/document_detail_model.dart';
import '../service/doc_detail_service.dart';

class DocDetailNotifier extends StateNotifier<DocDetailState> {
  DocDetailNotifier({required this.docDetailService})
      : super(DocDetailState.init());

  DocDetailService docDetailService;

  sendGetDocDetailRequest(String slug, String id) async {
    state = state.copyWith(isLoaded: true);
    var response = await docDetailService.getDocDetailRequest(slug, id);
    var data = response!.toOption().toNullable()?.data;

    if (response.isRight()) {
      state = state.copyWith(
        isLoaded: false,
        message: 'fetched Successfully',
        content: data,
      );
      dp(msg: "Response", arg: data.toString());
    } else {
      state = state.copyWith(isLoaded: false);
      state = DocDetailState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }
}

class DocDetailState extends Equatable {
  bool isLoaded = true;

  DocDetail? content;
  bool isError = false;
  String message;

  DocDetailState({
    required this.isError,
    required this.message,
    this.isLoaded = false,
    required this.content,
  });

  DocDetailState.init({this.message = '', this.isError = false});

  DocDetailState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  DocDetailState copyWith({
    bool? isError,
    String? message,
    bool? isLoaded,
    DocDetail? content,
  }) {
    return DocDetailState(
      content: content ?? this.content,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
