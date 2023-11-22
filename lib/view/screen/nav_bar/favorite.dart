import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import '../../../core/helper/responsive.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: kBackgroundScreen),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite_border,
                size: 100,
                color: kWhite,
              ),
              SizeVertical(value: 5),
              Text(
                "Favorite",
                style: TextStyle(
                  color: kBlack,
                  fontSize: 36,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
