
import 'package:flutter/material.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/image.dart';
import '../../../../core/constant/route.dart';
import '../../../../core/helper/responsive.dart';
import '../../../../data/service/login_service.dart';
import '../product_view.dart';

class LaptopItem extends StatefulWidget {
  const LaptopItem({
    super.key,
    required this.image,
    required this.productName,
    required this.subTitle,
    required this.price,
  });
  final String? image;
  final String? productName;
  final String? subTitle;
  final String? price;
  @override
  State<LaptopItem> createState() => _LaptopItemState();
}

class _LaptopItemState extends State<LaptopItem> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      child: InkWell(
        onTap: () {
          //  Navigator.pushNamed(context, kProduct);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProdectPage(
                    description: widget.subTitle!,
                    name: widget.productName!,
                    price: widget.price!),
              ));
        },
        child: Container(
          decoration: ShapeDecoration(
            color: kWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            shadows: const [
              BoxShadow(
                color: Color.fromARGB(25, 47, 46, 46),
                blurRadius: 7,
                offset: Offset(2, 2),
                spreadRadius: 5,
              ),
            ],
          ),
          child: Column(children: [
            Stack(
              children: [
                Container(
                  decoration: ShapeDecoration(
                    color: kWhite,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    shadows: const [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(1, 1),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Image.network(
                    height: SizeConfig.defaultSize! * 11.5,
                    width: SizeConfig.defaultSize! * 11.5,
                    widget.image ??
                        "https://cdn.thewirecutter.com/wp-content/media/2023/06/bestlaptops-2048px-9765.jpg",
                    scale: 1,
                  ),
                ),
                Positioned(
                  left: SizeConfig.defaultSize! * 11,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite ? Colors.red : Colors.white,
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 8,
                          offset: Offset(0, 6),
                          spreadRadius: 30,
                        ),
                      ],
                      size: 35,
                    ),
                  ),
                )
              ],
            ),
            //!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.productName ?? "No Title",
                      style: const TextStyle(
                        color: Color(0xFF0062BD),
                        fontSize: 18,
                        fontFamily: 'Inter',
                        height: 0,
                      ),
                    ),
                    const SizeVertical(value: 0.8),
                    Text(
                      widget.subTitle ?? "No Title",
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                      style: const TextStyle(
                        color: Color(0xFF464646),
                        fontSize: 12,
                        fontFamily: 'Inter',
                        height: 0,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Price: ${widget.price}" ?? "No Title",
                          style: const TextStyle(
                            color: Color(0xFF464646),
                            fontSize: 12,
                            fontFamily: 'Inter',
                            height: 0,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const ShapeDecoration(
                            gradient: LinearGradient(
                              end: Alignment(0.80, 0.99),
                              begin: Alignment(-0.77, 0.40),
                              colors: [Color(0xFF0062BD), Color(0x000062BD)],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              ),
                            ),
                          ),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
