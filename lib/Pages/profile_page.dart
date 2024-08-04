// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: [
            Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.white),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Container(
                  height: 60,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 60,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 60,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 60,
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
