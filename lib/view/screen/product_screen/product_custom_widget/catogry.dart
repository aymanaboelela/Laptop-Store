
import 'package:flutter/material.dart';

import '../../../../core/helper/responsive.dart';


class Category extends StatelessWidget {
  const Category({
    super.key,
    required this.image,
  });
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        width: SizeConfig.defaultSize! * 35,
        height: SizeConfig.defaultSize! * 17,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
        ),  
        child: Image.asset(
          image,
        ),
      ),
    );
  }
}
