import 'package:flutter/material.dart';

class ButtonForgotPassword extends StatelessWidget {
  const ButtonForgotPassword({
    super.key,
    required this.onTap
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: const Text(
        'Forgot Password?',
        style: TextStyle(
          color: Colors.blue
        ),
      ),
    );
  }
}
