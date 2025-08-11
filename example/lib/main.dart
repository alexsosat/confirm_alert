import 'package:confirm_alert/show_confirmation_dialog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ConfirmAlertExampleApp());
}

class ConfirmAlertExampleApp extends StatelessWidget {
  const ConfirmAlertExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confirm Alert Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ConfirmAlertExamplePage(),
    );
  }
}

class ConfirmAlertExamplePage extends StatefulWidget {
  const ConfirmAlertExamplePage({super.key});

  @override
  State<ConfirmAlertExamplePage> createState() =>
      _ConfirmAlertExamplePageState();
}

class _ConfirmAlertExamplePageState extends State<ConfirmAlertExamplePage> {
  String _lastResult = 'No dialog shown yet';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Alert Examples'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Result display
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Last Dialog Result:',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _lastResult,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontFamily: 'monospace',
                            backgroundColor: Colors.grey.shade100,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Basic confirmation dialog
            _buildSection(
              context,
              'Basic Confirmation Dialog',
              'Shows a simple confirmation dialog with custom title and message',
              () => _showBasicConfirmationDialog(context),
            ),

            // Warning dialog
            _buildSection(
              context,
              'Warning Dialog',
              'Pre-built warning dialog with warning animation',
              () => _showWarningDialog(context),
            ),

            // Error dialog
            _buildSection(
              context,
              'Error Dialog',
              'Pre-built error dialog with error animation',
              () => _showErrorDialog(context),
            ),

            // Success dialog
            _buildSection(
              context,
              'Success Dialog',
              'Pre-built success dialog with success animation',
              () => _showSuccessDialog(context),
            ),

            // Info dialog
            _buildSection(
              context,
              'Info Dialog',
              'Pre-built info dialog with info animation',
              () => _showInfoDialog(context),
            ),

            // Custom options dialog
            _buildSection(
              context,
              'Custom Options Dialog',
              'Dialog with custom colors, non-dismissible, and no cancel button',
              () => _showCustomOptionsDialog(context),
            ),

            // Custom widgets dialog
            _buildSection(
              context,
              'Custom Widgets Dialog',
              'Dialog with custom title and message widgets instead of plain text',
              () => _showCustomWidgetsDialog(context),
            ),

            // Different dialog types
            _buildSection(
              context,
              'Dialog Type Examples',
              'Show the same content with different dialog types',
              () => _showDialogTypeExamples(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context,
    String title,
    String description,
    VoidCallback onPressed,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text('Show $title'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Basic confirmation dialog
  Future<void> _showBasicConfirmationDialog(BuildContext context) async {
    final result = await showConfirmationDialog(
      context: context,
      texts: ConfirmationDialogTexts(
        title: "Delete Item",
        message:
            "Are you sure you want to delete this item? This action cannot be undone.",
        confirmButtonText: "Delete",
        cancelButtonText: "Cancel",
      ),
    );

    setState(() {
      _lastResult = 'Basic Confirmation: ${result ? "Confirmed" : "Cancelled"}';
    });
  }

  // Warning dialog
  Future<void> _showWarningDialog(BuildContext context) async {
    final result = await showWarningDialog(
      context: context,
      texts: ConfirmationDialogTexts(
        title: "Warning",
        message:
            "This action will permanently delete your account. Are you sure you want to proceed?",
        confirmButtonText: "Yes, Delete Account",
        cancelButtonText: "Cancel",
      ),
    );

    setState(() {
      _lastResult = 'Warning Dialog: ${result ? "Confirmed" : "Cancelled"}';
    });
  }

  // Error dialog
  Future<void> _showErrorDialog(BuildContext context) async {
    final result = await showErrorDialog(
      context: context,
      texts: ConfirmationDialogTexts(
        title: "Connection Error",
        message:
            "Failed to connect to the server. Please check your internet connection and try again.",
        confirmButtonText: "Retry",
        cancelButtonText: "Cancel",
      ),
    );

    setState(() {
      _lastResult = 'Error Dialog: ${result ? "Retry" : "Cancelled"}';
    });
  }

  // Success dialog
  Future<void> _showSuccessDialog(BuildContext context) async {
    final result = await showSuccessDialog(
      context: context,
      texts: ConfirmationDialogTexts(
        title: "Success!",
        message:
            "Your profile has been updated successfully. All changes have been saved.",
        confirmButtonText: "Great!",
      ),
    );

    setState(() {
      _lastResult = 'Success Dialog: ${result ? "Confirmed" : "Dismissed"}';
    });
  }

  // Info dialog
  Future<void> _showInfoDialog(BuildContext context) async {
    final result = await showInfoDialog(
      context: context,
      texts: ConfirmationDialogTexts(
        title: "New Feature Available",
        message:
            "We've added new customization options to your dashboard. Check them out!",
        confirmButtonText: "Got it!",
      ),
    );

    setState(() {
      _lastResult = 'Info Dialog: ${result ? "Confirmed" : "Dismissed"}';
    });
  }

  // Custom options dialog
  Future<void> _showCustomOptionsDialog(BuildContext context) async {
    final result = await showConfirmationDialog(
      context: context,
      texts: ConfirmationDialogTexts(
        title: "Important Action",
        message:
            "This dialog has custom options: non-dismissible, custom colors, and no cancel button.",
        confirmButtonText: "Proceed",
      ),
      options: ConfirmationDialogOptions(
        type: DialogType.warning,
        barrierDismissible: false,
        showCancel: false,
        confirmButtonColor: Colors.deepPurple,
      ),
    );

    setState(() {
      _lastResult =
          'Custom Options Dialog: ${result ? "Confirmed" : "Dismissed"}';
    });
  }

  // Custom widgets dialog
  Future<void> _showCustomWidgetsDialog(BuildContext context) async {
    final result = await showConfirmationDialog(
      context: context,
      texts: ConfirmationDialogTexts(
        titleWidget: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber, size: 24),
            const SizedBox(width: 8),
            Text(
              "Premium Feature",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber.shade800,
              ),
            ),
          ],
        ),
        messageWidget: Column(
          children: [
            Text(
              "This dialog demonstrates custom widgets:",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 20),
                const SizedBox(width: 4),
                Text("Custom title with icon"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 20),
                const SizedBox(width: 4),
                Text("Custom message layout"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 20),
                const SizedBox(width: 4),
                Text("Rich content support"),
              ],
            ),
          ],
        ),
        confirmButtonText: "Awesome!",
        cancelButtonText: "Maybe Later",
      ),
      options: ConfirmationDialogOptions(
        type: DialogType.info,
        confirmButtonColor: Colors.blue,
      ),
    );

    setState(() {
      _lastResult =
          'Custom Widgets Dialog: ${result ? "Confirmed" : "Cancelled"}';
    });
  }

  // Dialog type examples
  Future<void> _showDialogTypeExamples(BuildContext context) async {
    final dialogTypes = [
      (DialogType.success, "Success", "This is a success dialog"),
      (DialogType.info, "Information", "This is an info dialog"),
      (DialogType.warning, "Warning", "This is a warning dialog"),
      (DialogType.error, "Error", "This is an error dialog"),
    ];

    for (final (type, title, message) in dialogTypes) {
      final result = await showConfirmationDialog(
        context: context,
        texts: ConfirmationDialogTexts(
          title: title,
          message: message,
          confirmButtonText: "Continue",
          cancelButtonText: "Skip",
        ),
        options: ConfirmationDialogOptions(
          type: type,
          barrierDismissible: true,
          showCancel: true,
        ),
      );

      setState(() {
        _lastResult = '$title Dialog: ${result ? "Continue" : "Skip"}';
      });

      // Small delay between dialogs
      await Future.delayed(const Duration(milliseconds: 500));
    }
  }
}
