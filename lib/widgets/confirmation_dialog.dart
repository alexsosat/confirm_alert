import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:lottie/lottie.dart";

import "../classes/confirmation_dialog_options.dart";
import "../classes/confirmation_dialog_texts.dart";
import "../classes/dialog_types_enum.dart";

part "vertical_stack.dart";
part "confirmation_button.dart";

/// Dialog overlay whice presents a confirm and cancel button.
///
/// Returns true if the user confirms the action, false otherwise.
class ConfirmationDialog extends StatelessWidget {
  /// Dialog overlay whice presents a confirm and cancel button.
  ///
  /// Returns true if the user confirms the action, false otherwise.
  const ConfirmationDialog({
    required this.texts,
    required this.options,
    super.key,
  });

  /// The texts for the confirmation dialog.
  final ConfirmationDialogTexts texts;

  /// Options for the confirmation dialog.
  final ConfirmationDialogOptions options;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: PopScope(
          canPop: options.barrierDismissible,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (options.barrierDismissible) {
                Navigator.of(context).pop(false);
              }
            },
            child: Center(
              child: Animate(
                effects: const [
                  FadeEffect(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  ),
                  ScaleEffect(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  ),
                ],
                child: _VerticalStack(
                  dialogBackgroundColor: Theme.of(context).cardColor,
                  header: Lottie.asset(
                    options.type.animation,
                    package: "confirm_alert",
                    repeat: options.type == DialogType.info,
                  ),
                  body: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      texts.titleWidget ??
                          Text(
                            texts.title ?? "",
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                      if (texts.message != null ||
                          texts.messageWidget != null) ...[
                        const SizedBox(height: 10),
                        texts.messageWidget ??
                            Text(
                              texts.message ?? "",
                              textAlign: TextAlign.center,
                            ),
                      ],
                    ],
                  ),
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                    bottom: 10,
                  ),
                  btnOk: _ConfirmationButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    color:
                        options.confirmButtonColor ?? const Color(0xFF00CA71),
                    padding: 10,
                    child: Text(
                      texts.confirmButtonText ?? "confirm",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  btnCancel: options.showCancel
                      ? _ConfirmationButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          color: options.cancelButtonColor ?? Colors.grey,
                          padding: 10,
                          child: Text(
                            texts.cancelButtonText ?? "cancel",
                            style: const TextStyle(color: Colors.white),
                          ),
                        )
                      : null,
                ),
              ),
            ),
          ),
        ),
      );
}
