// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/core/helpers/logger.dart';
import '../model/get_menu_documents_model.dart';
import '../service/menu_doc_service.dart';

class MenuDocNotifier extends StateNotifier<MenuDocState> {
  MenuDocNotifier({required this.menuDocService}) : super(MenuDocState.init());

  MenuDocService menuDocService;

  sendGetMenuDocRequest(String slug) async {
    state = state.copyWith(isLoaded: true);
    var response = await menuDocService.getMenuDocRequest(slug);
    var data = response!.toOption().toNullable()?.documents.first.data;
    var title = response.toOption().toNullable()?.documents.first.title;
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
      state = MenuDocState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }
}

class MenuDocState extends Equatable {
  bool isLoaded = true;

  List<MenuDoc>? content = [];
  bool isError = false;
  String? title;
  String message;

  MenuDocState({
    required this.isError,
    required this.message,
    required this.title,
    this.isLoaded = false,
    this.content = const [],
  });

  MenuDocState.init({this.message = '', this.isError = false});

  MenuDocState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  MenuDocState copyWith({
    bool? isError,
    String? message,
    String? title,
    String? selectedType,
    bool? isLoaded,
    List<MenuDoc>? content,
  }) {
    return MenuDocState(
      content: content ?? this.content,
      title: title ?? this.title,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
