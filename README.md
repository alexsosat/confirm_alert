# Confirm Alert

A Flutter package that provides beautiful, animated confirmation dialogs with customizable options and multiple dialog types.

## Features

- 🎨 **Multiple Dialog Types**: Success, Error, Warning, and Info dialogs
- ✨ **Smooth Animations**: Built-in fade and scale animations with Flutter Animate
- 🎭 **Lottie Animations**: Custom Lottie animations for each dialog type
- 🎛️ **Highly Customizable**: Customizable colors, text, and behavior options
- 📱 **Responsive Design**: Adapts to different screen sizes and orientations
- ♿ **Accessibility**: Proper button handling and keyboard navigation
- 🎯 **Easy to Use**: Simple API with sensible defaults

## Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  confirm_alert: ^0.0.1
```

## Quick Start

### Basic Confirmation Dialog

```dart
import 'package:confirm_alert/confirm_alert.dart';

// Show a basic confirmation dialog
final result = await showConfirmationDialog(
  context: context,
  texts: ConfirmationDialogTexts(
    title: "Confirm Action",
    message: "Are you sure you want to proceed?",
  ),
);

if (result == true) {
  // User confirmed
  print("User confirmed the action");
} else {
  // User cancelled or dismissed
  print("User cancelled the action");
}
```

### Pre-built Dialog Types

#### Success Dialog
```dart
await showSuccessDialog(
  context: context,
  texts: ConfirmationDialogTexts(
    title: "Success!",
    message: "Your action was completed successfully.",
  ),
);
```

#### Error Dialog
```dart
await showErrorDialog(
  context: context,
  texts: ConfirmationDialogTexts(
    title: "Error",
    message: "Something went wrong. Please try again.",
  ),
);
```

#### Warning Dialog
```dart
await showWarningDialog(
  context: context,
  texts: ConfirmationDialogTexts(
    title: "Warning",
    message: "This action cannot be undone. Are you sure?",
  ),
);
```

## Advanced Usage

### Custom Styling

```dart
await showConfirmationDialog(
  context: context,
  texts: ConfirmationDialogTexts(
    title: "Custom Styled Dialog",
    message: "This dialog has custom colors and text.",
    confirmButtonText: "Proceed",
    cancelButtonText: "Go Back",
  ),
  options: ConfirmationDialogOptions(
    type: DialogType.info,
    confirmButtonColor: Colors.purple,
    cancelButtonColor: Colors.orange,
    barrierDismissible: false,
    showCancel: true,
  ),
);
```

### Custom Widgets

```dart
await showConfirmationDialog(
  context: context,
  texts: ConfirmationDialogTexts(
    titleWidget: Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        SizedBox(width: 8),
        Text("Special Title"),
      ],
    ),
    messageWidget: Column(
      children: [
        Text("Custom message with"),
        Text("multiple lines and widgets"),
        Icon(Icons.check_circle, color: Colors.green),
      ],
    ),
  ),
);
```

### Handling Different Dialog Types

```dart
// Show different dialogs based on conditions
if (operationSuccessful) {
  await showSuccessDialog(
    context: context,
    texts: ConfirmationDialogTexts(
      title: "Operation Complete",
      message: "Your data has been saved successfully.",
    ),
  );
} else if (hasError) {
  await showErrorDialog(
    context: context,
    texts: ConfirmationDialogTexts(
      title: "Operation Failed",
      message: "An error occurred while processing your request.",
    ),
  );
} else {
  await showWarningDialog(
    context: context,
    texts: ConfirmationDialogTexts(
      title: "Confirm Action",
      message: "This action will affect your data. Continue?",
    ),
  );
}
```

## Dependencies

This package uses the following dependencies:
- `flutter_animate: ^4.5.2` - For smooth animations
- `lottie: ^3.3.1` - For custom Lottie animations

## Assets

The package includes Lottie animations for each dialog type:
- `assets/animations/dialog/success.json` - Success animation
- `assets/animations/dialog/error.json` - Error animation
- `assets/animations/dialog/warning.json` - Warning animation
- `assets/animations/dialog/info.json` - Info animation

## Example

See the `example/` folder for a complete working example of how to use this package.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the terms specified in the LICENSE file.
