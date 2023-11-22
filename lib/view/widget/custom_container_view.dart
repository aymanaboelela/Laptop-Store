
import 'package:flutter/material.dart';

import '../../core/helper/responsive.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.changeImage,
  });

  final String changeImage;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Container(
        width: SizeConfig.defaultSize! * 38,
        height: 300,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x33000000),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 3,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset(
            changeImage,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
