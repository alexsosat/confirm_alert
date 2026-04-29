import "package:confirm_alert/classes/confirmation_dialog_texts.dart";
import "package:confirm_alert/classes/dialog_result_enum.dart";
import "package:confirm_alert/classes/dialog_types_enum.dart";
import "package:flutter/material.dart";

import "widgets/confirmation_dialog.dart";
import "classes/confirmation_dialog_options.dart";

export "classes/confirmation_dialog_options.dart";
export "classes/confirmation_dialog_texts.dart";
export "classes/dialog_types_enum.dart";

/// Opens a confirmation dialog with a [title] and a [messageString]
/// inside the application.
///
/// The actions of the button are set in the [onCancel] and [onConfirm] parameters
Future<DialogResult> showConfirmationDialog({
  required BuildContext context,
  required ConfirmationDialogTexts texts,
  ConfirmationDialogOptions options = const ConfirmationDialogOptions(),
}) async {
  final result = await showDialog<DialogResult>(
    context: context,
    builder: (context) => ScaffoldMessenger(
      child: Builder(
        builder: (context) => ConfirmationDialog(
          texts: texts,
          options: options,
        ),
      ),
    ),
  );

  if (result == null) {
    return DialogResult.dismiss;
  }

  return result;
}

/// Opens an error dialog with a [title] and a [messageString]
Future<DialogResult> showWarningDialog(
        {required BuildContext context,
        required ConfirmationDialogTexts texts,
        ConfirmationDialogOptions options = const ConfirmationDialogOptions(
          type: DialogType.warning,
          showCancel: false,
          barrierDismissible: false,
        )}) =>
    showConfirmationDialog(
      context: context,
      texts: texts,
      options: options,
    );

/// Opens an error dialog with a [title] and a [messageString]
Future<DialogResult> showErrorDialog({
  required BuildContext context,
  required ConfirmationDialogTexts texts,
  ConfirmationDialogOptions options = const ConfirmationDialogOptions(
    type: DialogType.error,
    showCancel: false,
    barrierDismissible: false,
  ),
}) =>
    showConfirmationDialog(
      context: context,
      texts: texts,
      options: options,
    );

/// Shows a success dialog
Future<DialogResult> showSuccessDialog({
  required BuildContext context,
  required ConfirmationDialogTexts texts,
  ConfirmationDialogOptions options = const ConfirmationDialogOptions(
    type: DialogType.success,
    showCancel: false,
    barrierDismissible: false,
  ),
}) =>
    showConfirmationDialog(
      context: context,
      texts: texts,
      options: options,
    );

/// Shows a info dialog
Future<DialogResult> showInfoDialog({
  required BuildContext context,
  required ConfirmationDialogTexts texts,
  ConfirmationDialogOptions options = const ConfirmationDialogOptions(
    type: DialogType.info,
    showCancel: false,
    barrierDismissible: false,
  ),
}) =>
    showConfirmationDialog(
      context: context,
      texts: texts,
      options: options,
    );
