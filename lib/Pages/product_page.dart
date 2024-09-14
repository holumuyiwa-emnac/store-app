// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final Map productDetail = {
    'name': "Nike F.C. Women's Tie-Dye Football Shirt",
    'details':
        "The Nike F.C. Shirt blends 2 summer favourites: festivals and football. Soft, sweat-wicking fabric and a mesh racerback help you stay comfortable on the pitch or in the crowd.",
    'image': 'product.png',
    'price': 55,
    'stock': 10
  };
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
      if (count < productDetail['stock']) {
        ++count;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 243, 243, 243),
        shadowColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Container(
              alignment: AlignmentDirectional.bottomStart,
              padding: EdgeInsets.only(left: 12, bottom: 12),
              height: 420,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      image: AssetImage('assets/${productDetail['image']}'),
                      fit: BoxFit.fitHeight)),
              child: Container(
                padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Text(
                  '${productDetail['stock']} in stock',
                  style: TextStyle(fontSize: 16),
                ),
              )),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${productDetail['price']}',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.red,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      width: 132,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color.fromARGB(255, 243, 243, 243),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //-
                          GestureDetector(
                            onTap: subtract,
                            child: Container(
                              alignment: Alignment.center,
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                '-',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),

                          Text('$count'),
                          GestureDetector(
                            onTap: add,
                            child: Container(
                              alignment: Alignment.center,
                              height: 32,
                              width: 32,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text(
                                '+',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productDetail['name'],
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(productDetail['details']),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //-
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 2)),
                          child: Text(
                            'XS (UK 4-6)',
                            style: TextStyle(fontSize: 18),
                          ),
                        )),
                        SizedBox(
                          width: 4,
                        ),
                        Expanded(
                            child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          height: 52,
                          width: 180,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'Add To Bag',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        )),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
