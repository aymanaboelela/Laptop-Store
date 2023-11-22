
import 'package:flutter/material.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/helper/responsive.dart';

class CustemAllprodects extends StatelessWidget {
  const CustemAllprodects({
    super.key,
    required this.image,
    required this.text,
  });
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Container(
        width: SizeConfig.defaultSize! * 13,
        decoration: ShapeDecoration(
          color: kBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 8,
              offset: Offset(2, 2),
              spreadRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                width: 40,
                height: 40,
                decoration: ShapeDecoration(
                  color: kWhite,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 8,
                      offset: Offset(2, 2),
                      spreadRadius: 4,
                    ),
                  ],
                ),
                child: CircleAvatar(
                    backgroundColor: kWhite,
                    backgroundImage: AssetImage(image)),
              ),
            ),
            const SizeHorizontal(value: 1),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontFamily: 'Inter',
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }
}
