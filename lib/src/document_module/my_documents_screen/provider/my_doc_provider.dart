// ignore_for_file: deprecated_member_use

// ignore_for_file: must_be_immutable, use_build_context_synchronously
import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kanoony/core/common_widgets/common_snackbar_widget.dart';
import 'package:kanoony/core/helpers/logger.dart';
import 'package:kanoony/src/document_module/my_documents_screen/model/my_documents_model.dart';
import 'package:kanoony/src/document_module/my_documents_screen/service/my_document_service.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/constants/object_constants/object_constants.dart';

class MyDocNotifier extends StateNotifier<MyDocState> {
  MyDocNotifier({required this.myDocService}) : super(MyDocState.init());

  MyDocService myDocService;

  sendGetMyDocRequest() async {
    state = state.copyWith(isLoaded: true);
    var response = await myDocService.getMyDocRequest();
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
      state = MyDocState.error(
          isError: true, message: "Error in getting data please try again");
    }
  }

  Future<void> requestPermissions() async {
    if (await Permission.storage.request().isGranted) {
      // Download and open logic
    } else {
      // Handle permission denial
      print('Storage permission denied. Requesting again.');
      await Permission.storage.request();
    }
  }

  String replaceHttpWithHttps(String url) {
    return url.replaceFirst('http', 'https');
  }

  Future<void> downloadFile(String path) async {
    await requestPermissions();
   // state = state.copyWith(isLoaded: true);
    try {
      final secureUrl = replaceHttpWithHttps(path);
      logger.i("path file $secureUrl");
      final File? file = await FileDownloader.downloadFile(
        notificationType: NotificationType.all,
        url: secureUrl,
      );

      logger.i('FILE: ${file?.path}');
      if (file != null) {
        showSnackBarMessage(
            content: "Document downloaded successfully!",
            backgroundColor: allColors.successColor,
            contentColor: allColors.canvasColor);
      } else {
        showSnackBarMessage(
            content: "Document not found!",
            backgroundColor: allColors.errorColor,
            contentColor: allColors.canvasColor);
      }
    } catch (e) {
      logger.e('Error: $e');
      showSnackBarMessage(
          content: "Downloading failed!",
          backgroundColor: allColors.errorColor,
          contentColor: allColors.canvasColor);
    }

   // state = state.copyWith(isLoaded: false);
  }

  sendDeleteMyDocRequest(int id) async {
    state = state.copyWith(isLoaded: true);
    var response = await myDocService.deleteMyDocRequest(id);
    var data = response!.toOption().toNullable()?.message;

    if (response.isRight()) {
      state = state.copyWith(
        isLoaded: false,
        message: 'fetched Successfully',
      );

      dp(msg: "Response", arg: data.toString());
    } else {
      state = state.copyWith(isLoaded: false);
      state = MyDocState.error(
          isError: true, message: "Error in getting data please try again");
    }
    await sendGetMyDocRequest();
  }
}

class MyDocState extends Equatable {
  bool isLoaded = true;

  List<MyDoc>? content = [];
  bool isError = false;
  String message;

  MyDocState({
    required this.isError,
    required this.message,
    this.isLoaded = false,
    this.content = const [],
  });

  MyDocState.init({this.message = '', this.isError = false});

  MyDocState.error({
    required this.message,
    this.isError = true,
  });
  @override
  List<Object?> get props => [];
  MyDocState copyWith({
    bool? isError,
    String? message,
    bool? isLoaded,
    List<MyDoc>? content,
  }) {
    return MyDocState(
      content: content ?? this.content,
      isLoaded: isLoaded ?? this.isLoaded,
      isError: isError ?? this.isError,
      message: message ?? this.message,
    );
  }
}
