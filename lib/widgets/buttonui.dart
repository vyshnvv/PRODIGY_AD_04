import 'package:flutter/material.dart';
import 'package:tictactoe/utils/colors.dart';

class Button1 extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonText;
  const Button1({super.key, required this.onTap, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(width / 5, 50),
          backgroundColor: olivegreen,
          foregroundColor: beige),
      child: Text(buttonText),
    );
  }
}
