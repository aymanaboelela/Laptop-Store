import 'package:dio/dio.dart';

import '../../core/helper/custom_print.dart';
import '../model/help_model.dart';
import '../model/product_model.dart';

class Service {
  static Dio dio = Dio();
  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://magdsoft.ahmedshawky.fun/api/",
        receiveDataWhenStatusError: true,
      ),
    );
  }

  //! POST
  static Future<void> postData(
      {required Map<String, dynamic> data, required String path}) async {
    try {
      final response = await dio.post(path, data: data);
      if (response.statusCode == 200) {
        kPrint('Data posted successfully');
      } else {
        kPrint('Failed to post data. Error: ${response.statusCode}');
      }
    } catch (error) {
      kPrint('An error occurred: $error');
    }
  }

//! GET HELP
  static Future<List<HelpModels>> getHelp() async {
    try {
      Response response = await dio.get("getHelp");

      List<dynamic> helpJsonList = response.data['help'];

      List<HelpModels> helpModel = [];

      for (var element in helpJsonList) {
        HelpModels help = HelpModels.fromJson(element);
        helpModel.add(help);
      }
      kPrint(response.data['help'], title: response.statusCode.toString());
      return helpModel;
    } catch (err) {
      throw Exception('Error from getHelp: $err');
    }
  }

//! GET PRODUCT
  static Future<List<ProductsModels>> getProduct() async {
    try {
      Response response = await dio.get("getProducts");

      List<dynamic> productJsonList = response.data['products'];

      List<ProductsModels> productModel = [];

      for (var element in productJsonList) {
        ProductsModels product = ProductsModels.fromJson(element);
        productModel.add(product);
      }
      kPrint(productJsonList, title: response.statusCode.toString());
      return productModel;
    } catch (err) {
      throw Exception('Error from getHelp: $err');
    }
  }
}
