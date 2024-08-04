// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int count = 0;

  void subtract() {
    setState(() {
      --count;
    });
  }

  void add() {
    setState(() {
      ++count;
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
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            color: Colors.white,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '#55.25',
                      style: TextStyle(
                        fontSize: 20,
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
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Text('-'),
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
                  children: [
                    Text(
                      "Nike F.C. Women's Tie-Dye Football Shirt",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                        "The Nike F.C. Shirt blends 2 summer favourites: festivals and football. Soft, sweat-wicking fabric and a mesh racerback help you stay comfortable on the pitch or in the crowd."),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //-
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                          height: 52,
                          width: 160,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 2)),
                          child: Text(
                            'XS (UK 4-6)',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        //+
                        Container(
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
                        ),
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
