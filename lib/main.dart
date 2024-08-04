// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:store_app/Pages/cart_page.dart';
import 'package:store_app/Pages/favorite_page.dart';
import 'package:store_app/Pages/home_page.dart';
import 'package:store_app/Pages/product_page.dart';
import 'package:store_app/Pages/profile_page.dart';

void main() {
  runApp(const StoreApp());
}

class StoreApp extends StatefulWidget {
  const StoreApp({super.key});

  @override
  State<StoreApp> createState() => _StoreAppState();
}

class _StoreAppState extends State<StoreApp> {
  int _pageIndex = 0;
// update page index with value of button pressed
  void _bottomNavTapped(int index) {
    setState(() {
      _pageIndex = index;
    });
  }

//list of pages
  final List<Widget> _screens = [
    HomePage(),
    FavoritePage(),
    CartPage(),
    ProfilePage(),
    ProductPage(),
  ];
  final List<Widget> _screensName = [
    Text(''),
    Text('Favorites'),
    Text('Cart'),
    Text('Profile'),
    Text('Product'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: _screens[_pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // current page index to display on buttom nav bar
          currentIndex: _pageIndex,
          //get button page index
          onTap: _bottomNavTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                child: Container(
                  color: Color.fromRGBO(243, 243, 243, 1),
                ),
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('N O T I F I C A T I O N S'),
                contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              ),
              ListTile(
                leading: Icon(Icons.archive),
                title: Text('O R D E R S'),
                contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              ),
              ListTile(
                leading: Icon(Icons.category_rounded),
                title: Text('C A T E G O R Y'),
                contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              ),
              ListTile(
                leading: Icon(Icons.local_offer),
                title: Text('O F F E R S'),
                contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('S E T T I N G S'),
                contentPadding: EdgeInsets.fromLTRB(24, 0, 0, 0),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: _screensName[_pageIndex],
          backgroundColor: Color.fromARGB(255, 243, 243, 243),
          toolbarHeight: 80,
          shadowColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
