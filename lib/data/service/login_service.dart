import 'package:dio/dio.dart';


import '../../core/helper/custom_print.dart';
import '../model/help_model.dart';
import '../model/product_model.dart';

class Service {
  static Dio dio = Dio();
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: "http://magdsoft.ahmedshawky.fun/api/",
        receiveDataWhenStatusError: true));
  }

  // //! GET
  // static Future getService(
  //     {required String path, Map<String, dynamic>? queryParameters}) async {
  //   late Response response;
  //   try {
  //     response = await dio.get(path, queryParameters: queryParameters);
  //     kPrint(response.data, title: response.statusCode.toString());
  //   } on DioException catch (err) {
  //     kPrint("error from dio :$err", title: response.statusCode.toString());
  //   } catch (err) {
  //     kPrint("golobal error:$err");
  //   }
  // }

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
  static Future<List<Help>> getHelp() async {
    try {
      Response response = await dio.get("getHelp");

      List<dynamic> helpJsonList = response.data['help'];

      List<Help> helpModel = [];

      for (var element in helpJsonList) {
        Help help = Help(
            answer: element["answer"],
            id: element["id"],
            question: element["question"]);
        helpModel.add(help);
      }

      // List<Help> helpList =
      //     helpJsonList.map((json) => Help.fromJson(json)).toList();
      kPrint(response.data['help'], title: response.statusCode.toString());
      // return helpList;
      return helpModel;
    } catch (err) {
      throw Exception('Error from getHelp: $err');
    }
  }

//! GET PRODUCT
  static Future<List<Products>> getProduct() async {
    try {
      Response response = await dio.get("getProducts");

      List<dynamic> productJsonList = response.data['products'];

      List<Products> productModel = [];

      for (var element in productJsonList) {
        Products product = Products(
            company: element["Products"],
            description: element["description"],
            image: element["image"],
            price: element["price"],
            type: element["type"],
            name: element["name"],
            id: element["id"]);
        productModel.add(product);
      }

      // List<Help> helpList =
      //     helpJsonList.map((json) => Help.fromJson(json)).toList();
      kPrint(productJsonList, title: response.statusCode.toString());
      // return helpList;
      return productModel;
    } catch (err) {
      throw Exception('Error from getHelp: $err');
    }
  }
}
