import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonForm extends StatelessWidget {
  const ButtonForm({
    super.key,
    required this.name,
    required this.onTap
  });

  final String name;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 230,
        decoration: BoxDecoration(
          color: const Color(0xFF138acc),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Center(
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ),
      ),
    );
  }
}
