import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final VoidCallback? onPressedHandler;

  // ignore: use_key_in_widget_constructors
  const CustomElevatedButton(
      {Key? key,
      required this.labelText,
      required this.icon,
      this.onPressedHandler});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressedHandler,
      icon: Icon(icon),
      label: Text(labelText),
    );
  }
}
