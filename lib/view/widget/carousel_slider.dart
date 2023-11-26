import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../core/helper/responsive.dart';

class ScrollImage extends StatefulWidget {
  const ScrollImage({super.key});

  @override
  State<ScrollImage> createState() => _ScrollImageState();
}

class _ScrollImageState extends State<ScrollImage> {
  final List<String> images = [
    "assets/images/Acct1.png",
    'assets/images/Acct2.png'
  ];
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: CarouselSlider(
        options: CarouselOptions(
          height: SizeConfig.defaultSize! * 17,
          aspectRatio: 0 / 19,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: images.map((String url) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                // decoration: const BoxDecoration(
                //   color: Colors.black,
                // ),
                child: Image.asset(
                  url,
                  fit: BoxFit.cover,
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
