/// Extension to get the animation and repeat properties of a dialog type.
extension DialogTypeExtension on DialogType {
  /// Returns the animation path to show in the dialog.
  String get animation => switch (this) {
        DialogType.info => "assets/animations/dialog/info.json",
        DialogType.error => "assets/animations/dialog/error.json",
        DialogType.success => "assets/animations/dialog/success.json",
        DialogType.warning => "assets/animations/dialog/warning.json",
      };
}

/// The type of dialog to show.
enum DialogType {
  /// A dialog to show the user an action has been done successfully.
  success,

  /// A dialog showing information to the user.
  info,

  /// A dialog to show the user an error ocurred during the transaction.
  error,

  /// A dialog to warn the user before doing a transaction.
  warning,
}
