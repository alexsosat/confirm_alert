import 'package:flutter/material.dart';

/// Texts for the confirmation dialog.
class ConfirmationDialogTexts {
  /// The texts for the confirmation dialog.
  const ConfirmationDialogTexts({
    this.title,
    this.message,
    this.titleWidget,
    this.messageWidget,
    this.confirmButtonText,
    this.cancelButtonText,
  })  : assert(
          (title != null && titleWidget == null) ||
              (title == null && titleWidget != null),
          "Either title or titleWidget must be provided, but not both.",
        ),
        assert(
          (message != null && messageWidget == null) ||
              (message == null && messageWidget != null) ||
              (message == null && messageWidget == null),
          "Either message or messageWidget must be provided, but not both.",
        );

  /// The title of the dialog.
  final String? title;

  /// The message of the dialog.
  final String? message;

  /// The title widget of the dialog.
  ///
  /// If [title] is provided, this will be ignored.
  final Widget? titleWidget;

  /// The message widget of the dialog.
  ///
  /// If [message] is provided, this will be ignored.
  final Widget? messageWidget;

  /// The confirm button text.
  final String? confirmButtonText;

  /// The cancel button text.
  final String? cancelButtonText;
}
