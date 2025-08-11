import "dart:ui";

import "dialog_types_enum.dart";

/// Options for the confirmation dialog.
class ConfirmationDialogOptions {
  /// Extra options for the confirmation dialog.
  const ConfirmationDialogOptions({
    this.type = DialogType.warning,
    this.barrierDismissible = true,
    this.showCancel = true,
    this.confirmButtonColor,
    this.cancelButtonColor,
  });

  /// The type of dialog to show.
  final DialogType type;

  /// True if the dialog is dismissible by tapping outside.
  final bool barrierDismissible;

  /// True if the dialog should show the cancel button.
  final bool showCancel;

  /// The color of the confirm button.
  final Color? confirmButtonColor;

  /// The color of the cancel button.
  final Color? cancelButtonColor;
}
