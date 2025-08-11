part of 'confirmation_dialog.dart';

/// A pill shaped button.
class _ConfirmationButton extends StatelessWidget {
  /// A pill shaped button.
  const _ConfirmationButton({
    required this.onPressed,
    required this.child,
    this.padding = 18,
    this.color,
  });

  /// Method executed when this button is pressed
  final Function() onPressed;

  /// The button filled color
  final Color? color;

  /// The content inside the button
  final Widget child;

  /// The padding surrounding the content
  final double padding;

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          padding: EdgeInsets.all(padding),
          backgroundColor: color ?? Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        child: child,
      );
}
