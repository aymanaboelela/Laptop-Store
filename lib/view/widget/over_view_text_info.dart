
import 'package:flutter/material.dart';

class OverViewText extends StatelessWidget {
  const OverViewText({
    super.key,
    required this.overViewText,
  });
  final String overViewText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 361,
      height: 392,
      child: Text(
        overViewText,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 0,
        ),
      ),
    );
  }
}