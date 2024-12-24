import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    required this.text,
    this.color = Colors.red,
    this.textColor = Colors.white,
  });

  final Function()? onPressed;
  final String text;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(color)),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 16.8),
      ),
    );
  }
}
