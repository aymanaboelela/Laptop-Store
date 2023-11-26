import 'package:flutter/material.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/image.dart';
import '../../../core/helper/responsive.dart';
import '../../../data/model/product_model.dart';
import '../../../data/service/service.dart';
import '../../widget/carousel_slider.dart';
import '../../widget/product_custom_widget/product_card.dart';
import '../../widget/product_custom_widget/category_list_view_2.dart';
import '../../widget/product_custom_widget/custom_all_product.dart';
import '../../widget/product_custom_widget/search_bar.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  List<ProductsModels> ListData = [];
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    List<ProductsModels> data = await Service.getProduct();
    setState(() {
      ListData = data;
    });
  }

  List catogryProdact = const [
    CustemAllprodects(image: kAll, text: 'All'),
    CustemAllprodects(image: kAerLogo, text: 'Acer'),
    CustemAllprodects(image: kRazerLogo, text: 'Razer'),
    CustemAllprodects(image: kAppleLogo, text: 'Appl'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(gradient: kBackgroundScreen),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(
              child: SizeVertical(value: 5),
            ),
            const SliverToBoxAdapter(
              child: TextItemListview(),
            ),
            const SliverToBoxAdapter(
              child: SizeVertical(value: 1),
            ),
            const SliverToBoxAdapter(
              child: ScrollImage(),
            ),
            const SliverToBoxAdapter(
              child: SizeVertical(value: 1),
            ),
            SliverToBoxAdapter(
              child: CotogeryListViwe2(catogryProdact: catogryProdact),
            ),
            const SliverToBoxAdapter(
              child: SizeVertical(value: 2),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 0, // Horizontal spacing between items
                mainAxisSpacing: 20, // Vertical spacing between items
                childAspectRatio: 0.85,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: FutureBuilder(
                      future: Service.getProduct(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          ListData = snapshot.data!;
                          return LaptopItem(data: ListData[index]);
                        } else if (snapshot.hasError) {
                          return const Center(
                              child: Text("opps the error try again.."));
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ); // Replace with your item widget
                },
                childCount: ListData.length,
                // Replace with the number of items you have
              ),
            ),
            const SliverToBoxAdapter(
              child: SizeVertical(value: 5),
            ),
          ],
        ),
      ),
    );
  }
}
