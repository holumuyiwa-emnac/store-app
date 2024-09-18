import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Pages/home_page.dart';

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
    throw Exception("Failed to load products");
  }
}
