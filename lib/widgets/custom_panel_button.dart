import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomPanelButton extends StatelessWidget {
  String? text;
  final VoidCallback? onTapHandler;

  // ignore: use_key_in_widget_constructors
  CustomPanelButton({required this.text, required this.onTapHandler});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapHandler,
      child: Container(
        // ignore: prefer_const_constructors
        margin: EdgeInsets.all(10),
        width: 150,
        height: 150,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Theme.of(context).primaryColor),
        child: Center(
          child: Text(
            text!.toString().toUpperCase(),
            // ignore: prefer_const_constructors
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
