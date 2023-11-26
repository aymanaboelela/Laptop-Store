
import 'package:flutter/material.dart';

import '../../../core/helper/responsive.dart';


class CotogeryListViwe2 extends StatelessWidget {
  const CotogeryListViwe2({
    super.key,
    required this.catogryProdact,
  });

  final List catogryProdact;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.screenWidth! * 20,
      height: SizeConfig.defaultSize! * 5,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: catogryProdact.length,
        itemBuilder: (context, index) {
          return catogryProdact[index];
        },
      ),
    );
  }
}
