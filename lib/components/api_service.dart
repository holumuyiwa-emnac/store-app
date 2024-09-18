import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/product_class.dart';

// Function to fetch product list from API
Future<List<Product>> fetchProducts() async {
  final response =
      await http.get(Uri.parse("https://fakestoreapi.com/products"));

  if (response.statusCode == 200) {
    // Parse JSON response and convert each item to a Product object
    List<dynamic> body = jsonDecode(response.body);
    return body.map((item) => Product.fromJson(item)).toList();
  } else {
    // Handle error in case of a failed API request
    throw Exception("Failed to load Product");
  }
}

// Function to fetch a product detail using product ID
Future<Product> fetchProductDetail(int productId) async {
  final response =
      await http.get(Uri.parse("https://fakestoreapi.com/products/$productId"));

  if (response.statusCode == 200) {
    // Parse the JSON response and convert it to a Product object
    return Product.fromJson(jsonDecode(response.body));
  } else {
    // Handle error in case of a failed API request
    throw Exception("Failed to load product detail");
  }
}
