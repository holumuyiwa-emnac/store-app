import 'package:flutter/material.dart';
import '../components/api_service.dart';
import '../components/product_class.dart';

class ProductPage extends StatefulWidget {
  final int productId;

  const ProductPage({super.key, required this.productId});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  Product? product; // To hold the product details
  bool isLoading = true; // To track loading state

  @override
  void initState() {
    super.initState();
    _loadProductDetails();
  }

  Future<void> _loadProductDetails() async {
    try {
      Product fetchedProduct = await fetchProductDetail(widget.productId);
      setState(() {
        product = fetchedProduct;
        isLoading = false; // Set loading to false when data is fetched
      });
    } catch (e) {
      // Handle error if API request fails
      print('Error fetching product details: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  int count = 0;

  void subtract() {
    setState(() {
      if (count > 0) {
        --count;
      }
    });
  }

  void add() {
    setState(() {
      if (product != null && count < 10) {
        ++count;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 243, 243, 243),
        shadowColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator()) // Show loading indicator
          : ListView(
              children: [
                Container(
                  alignment: AlignmentDirectional.bottomStart,
                  padding: const EdgeInsets.only(left: 12, bottom: 12),
                  height: 420,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image:
                          NetworkImage(product!.image), // Display product image
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      product!.category,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product!.price}', // Display product price
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.red,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: 132,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color.fromARGB(255, 243, 243, 243),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: subtract,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      '-',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Text('$count'), // Display current count
                                GestureDetector(
                                  onTap: add,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 32,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Text(
                                      '+',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product!.title, // Display product title
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 12),
                          Text(product!
                              .description), // Display product description
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(width: 2),
                                  ),
                                  child: const Text(
                                    'XS (UK 4-6)',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.center,
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                  height: 52,
                                  width: 180,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'Add To Bag',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
