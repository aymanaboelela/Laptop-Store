
import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.title, this.onTap});
  final String? title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: 282,
            height: 48,
            alignment: Alignment.center,
            decoration: ShapeDecoration(
              gradient: kButtonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Text(title ?? "NO Title",style: const TextStyle(color: kWhite,fontSize: 20),)));
  }
}
