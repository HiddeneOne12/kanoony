import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:kanoony/core/common_widgets/common_button_widget.dart';
import 'package:kanoony/core/constants/object_constants/object_constants.dart';

confirmationDialogBox(
    BuildContext context, VoidCallback onOkClick, String dec) {
  return AwesomeDialog(
    isDense: true,
    width: double.infinity,
    context: context,
    dialogType: DialogType.question,
    animType: AnimType.rightSlide,
    btnCancel: CommonButton(
      backgroundColor: allColors.textColor,
      onPressed: () {
        Navigator.pop(context);
      },
      text: "Cancel",
    ),
    btnOk: CommonButton(
      backgroundColor: allColors.primaryColor,
      onPressed: () {
        FocusScope.of(context).unfocus();
        Navigator.pop(context);
        onOkClick();
      },
      text: "Ok",
    ),
    title: 'Confirmation',
    btnOkText: "Update",
    desc: dec,
  )..show();
}
