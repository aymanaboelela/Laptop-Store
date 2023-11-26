
import 'package:flutter/material.dart';

import '../../../core/helper/responsive.dart';

class CatogeryListView extends StatelessWidget {
  const CatogeryListView({
    super.key,
    required this.catogry,
  });

  final List catogry;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfig.defaultSize! * 60,
      height: SizeConfig.defaultSize! * 20,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return catogry[index];
        },
        itemCount: catogry.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
