// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/core/helpers/logger.dart';
import '../model/my_fav_docs_model.dart';
import '../services/fav_doc_services.dart';

class FavDocNotifier extends StateNotifier<FavDocState> {
  FavDocNotifier({required this.favDocService}) : super(FavDocState.init());

  FavDocService favDocService;

  sendGetFavDocRequest() async {
    state = state.copyWith(isLoaded: true);
    var response = await favDocService.getFavDocRequest();
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
      state = FavDocState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }

  sendAddFavDocRequest(id) async {
    state = state.copyWith(isLoaded: true);
    var response = await favDocService.postAddFavDocRequest(id);
    var data = response!.toOption().toNullable()?.message;

    if (response.isRight()) {
      state = state.copyWith(
        isLoaded: false,
        message: 'fetched Successfully',
      );
      dp(msg: "Response", arg: data.toString());
    } else {
      state = state.copyWith(isLoaded: false);
      state = FavDocState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }
}

class FavDocState extends Equatable {
  bool isLoaded = true;

  List<FavDocs>? content = [];
  bool isError = false;
  String message;

  FavDocState({
    required this.isError,
    required this.message,
    this.isLoaded = false,
    this.content = const [],
  });

  FavDocState.init({this.message = '', this.isError = false});

  FavDocState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  FavDocState copyWith({
    bool? isError,
    String? message,
    bool? isLoaded,
    List<FavDocs>? content,
  }) {
    return FavDocState(
      content: content ?? this.content,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
