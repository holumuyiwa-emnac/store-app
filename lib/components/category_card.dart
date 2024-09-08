import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtile;

  const CategoryCard(
      {super.key,
      required this.image,
      required this.title,
      required this.subtile});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Container(
        padding: const EdgeInsets.only(left: 100, top: 140, bottom: 40),
        width: 260,
        height: 246,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/$image')),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(4)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 20),
              ),
              Text(subtile)
            ],
          ),
        ),
      ),
    );
  }
}
