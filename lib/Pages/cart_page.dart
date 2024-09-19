// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../Pages/product_page.dart';
import '../components/cart_card.dart';
import '../components/api_service.dart';
import '../components/product_class.dart';

class CartPage extends StatefulWidget {
  final int userId = 1;

  const CartPage({
    super.key,
  });

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> cartItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadCart();
  }

  // Function to load the user's cart
  Future<void> _loadCart() async {
    try {
      List<dynamic> cart = await fetchCart(widget.userId);
      List<Product> fetchedItems = [];

      for (var cartItem in cart) {
        int productId = cartItem['productId'];
        Product product = await fetchProductDetail(productId);
        product.quantity = cartItem['quantity'];
        fetchedItems.add(product);
      }

      setState(() {
        cartItems = fetchedItems;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching cart: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity; // Total considering quantity
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double cartTotal = calculateTotal();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(
                                  productId: cartItems[index].id,
                                ),
                              ),
                            );
                          },
                          child: CartCard(
                            itemName: cartItems[index].title,
                            itemPrice: cartItems[index].price,
                            itemImage: Image.network(cartItems[index].image),
                            category: cartItems[index].category,
                            quantity: cartItems[index].quantity, // Add quantity
                          ),
                        );
                      },
                    ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '\$$cartTotal',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    'Check Out',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
