// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FavoriteCard extends StatelessWidget {
  final String itemName;
  final int itemPrice;
  final Image itemImage;
  final String category;

  const FavoriteCard(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.itemImage,
      required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        contentPadding: EdgeInsets.fromLTRB(8, 2, 8, 2),
        tileColor: Colors.white,
        leading: itemImage,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              itemName,
              style: TextStyle(fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              category,
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
        subtitle: Text('\$${itemPrice.toString()}',
            style: TextStyle(fontSize: 16, color: Colors.red)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.delete,
              color: Colors.red,
              size: 24,
            ),
            Icon(
              Icons.shopping_bag,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
