
import 'package:flutter/material.dart';
import '../../core/constant/color.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.image,
  });
  final VoidCallback onTap;
  final String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(7),
        width: 60,
        height: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: kWhite,
          boxShadow: [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 7,
              offset: Offset(2, 2),
              spreadRadius: 3,
            ),
          ],
        ),
        child: Image.asset(
          image,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
