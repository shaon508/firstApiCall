import 'dart:convert';
import 'package:get/get.dart';
import 'models/model.dart';
import 'package:http/http.dart' as http;
//
// State controller using GetX
//
class BodyController extends GetxController {
  //
  //list to hold product details and boolean for control loading state
  //
    var productList = <ProductDetails>[].obs;
    var isLoading = true.obs;

    @override
    void onInit() {
      fetchProduct();
      super.onInit();
    }
    //
    //Fetching the data from the API("https://fakestoreapi.com/products")
    //
    Future<void> fetchProduct() async {
      //
      //Get request to API , Decode the response and
      // iterate over each item in the data and add it to the productList
      // and also check exception
      //
      try {
        isLoading(true);
        final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
        if (response.statusCode == 200) {
          var data = jsonDecode(response.body.toString());
          for (Map<String, dynamic> item in data) {
            productList.add(ProductDetails.fromJson(item));
          }
        } else {
          throw Exception('Failed to load posts');
        }
      } finally {
        isLoading(false);
      }
    }
}