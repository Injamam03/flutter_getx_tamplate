import 'package:flutter/material.dart';

class CustomTipsDialog extends StatelessWidget {
  final String title;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final Color? buttonColor;
  final TextStyle? titleStyle;
  final TextStyle? buttonTextStyle;

  const CustomTipsDialog({
    super.key,
    required this.title,
    this.buttonText = 'Give tips',
    this.onButtonPressed,
    this.buttonColor,
    this.titleStyle,
    this.buttonTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: titleStyle ?? const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),
            // Button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                if (onButtonPressed != null) {
                  onButtonPressed!();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor ?? Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                buttonText,
                style: buttonTextStyle ?? const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}