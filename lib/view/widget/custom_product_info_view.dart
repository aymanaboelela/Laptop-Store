
import 'package:flutter/material.dart';

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key, required this.image, this.onTap});
  final String image;
  final void Function()? onTap;

//  final Function ?ontap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 100,
          height: 100,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 15,
                offset: Offset(0, 2),
                spreadRadius: -5,
              ),
            ],
          ),
          child: Image.asset(image, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
