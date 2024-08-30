import 'package:flutter/material.dart';

class TitleForm extends StatelessWidget {

  const TitleForm({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.sizeOf(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.check_circle_outline,
          color: Colors.white,
          size: 100,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 30
          ),
        )
      ],
    );
  }
}
