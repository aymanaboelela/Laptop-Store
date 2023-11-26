import 'package:flutter/material.dart';
import '../../core/constant/image.dart';
import '../../core/helper/responsive.dart';
import '../widget/custom_button.dart';
import '../widget/custom_container_view.dart';
import '../widget/custom_icon_back.dart';
import '../widget/over_view_text_info.dart';

class ProdectPage extends StatefulWidget {
  const ProdectPage({
    super.key,
    required this.name,
    required this.price,
    required this.description,
  });

  final String name;
  final String price;
  final String description;

  @override
  State<ProdectPage> createState() => _ProdectPageState();
}

class _ProdectPageState extends State<ProdectPage> {
  String image = '';
  List<String> changeImage = [
    kAerP3,
    kAcerLaptop,
    kAerp4,
    kAerP3,
  ];
  @override
  void initState() {
    image = changeImage[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Color(0xD80062BD), Color(0x000062BD)],
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizeVertical(value: 6),
                        const BackIcon(),
                        const SizeVertical(value: 1.5),
                        Text(
                          widget.name,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                          ),
                        ),
                        const SizeVertical(value: 1),
                        const Text(
                          "Type: Gaming Laptop",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontFamily: 'Inter',
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizeVertical(value: 2),
                  CustomContainer(changeImage: image),
                  const SizeVertical(value: 2),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                  height: SizeConfig.defaultSize! * 10,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: changeImage.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              image = changeImage[index];
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              width: SizeConfig.defaultSize! * 10,
                              height: SizeConfig.defaultSize! * 10,
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
                                    spreadRadius: 2,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(changeImage[index]),
                              ),
                            ),
                          ));
                    },
                  )),
            ),
            const SliverToBoxAdapter(child: SizeVertical(value: 3)),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Price',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                            fontFamily: 'Inter',
                            height: 0,
                          ),
                        ),
                        const SizeVertical(value: 1),
                        Text(
                          widget.price,
                          style: const TextStyle(
                            color: Color(0xFF464646),
                            fontSize: 18,
                            fontFamily: 'Inter',
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizeHorizontal(value: 2.5),
                  SizedBox(
                    width: SizeConfig.defaultSize! * 25,
                    child: CustomButton(
                      onTap: () {},
                      title: "Add To Cart",
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Divider(
                color: Colors.grey,
                height: SizeConfig.defaultSize! * 8,
                thickness: 1.2,
                endIndent: 50,
                indent: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    width: SizeConfig.defaultSize! * 8.5,
                    child: const Text(
                      'Overview',
                      style: TextStyle(
                        color: Color(0xFF464646),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        height: 0,
                      ),
                    ),
                  ),
                  const SizeVertical(value: 0.5),
                  Container(
                    width: SizeConfig.defaultSize! * 0.8,
                    height: SizeConfig.defaultSize! * 0.8,
                    decoration: const ShapeDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.77, -0.64),
                        end: Alignment(-0.77, 0.64),
                        colors: [Color(0xFF0062BD), Color(0x000062BD)],
                      ),
                      shape: OvalBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: SizeVertical(value: 2),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: OverViewText(overViewText: widget.description),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
