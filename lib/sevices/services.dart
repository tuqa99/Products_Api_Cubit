import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:api_products/products_model/products_model.dart';

class ApiService {
  Future<List<Products>> getDataproducts() async {
    List<Products> userData = [];

    try {
      var request =
          http.Request('GET', Uri.parse('https://fakestoreapi.com/products'));
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var rawData = await response.stream.bytesToString();
        List<dynamic> data = jsonDecode(rawData);
        for (var element in data) {
          Products user = Products.fromJson(element);
          userData.add(user);
        }
        return userData;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}
