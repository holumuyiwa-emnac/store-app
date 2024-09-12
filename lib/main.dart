// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import '../Pages/cart_page.dart';
import '../Pages/favorite_page.dart';
import '../Pages/home_page.dart';
import '../Pages/product_page.dart';
import '../Pages/profile_page.dart';

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
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
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
          backgroundColor: Colors.white,
          child: Column(
            children: [
              DrawerHeader(
                margin: EdgeInsets.only(bottom: 32),
                child: Icon(
                  Icons.shopping_cart,
                  size: 140,
                  color: Colors.black,
                ),
              ),
              ListTile(
                leading: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black,
                    ),
                    child: Icon(Icons.notifications, color: Colors.white)),
                title: Text('NOTIFICATIONS'),
                contentPadding: EdgeInsets.only(left: 24),
              ),
              ListTile(
                leading: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black,
                    ),
                    child: Icon(Icons.archive, color: Colors.white)),
                title: Text('ORDERS'),
                contentPadding: EdgeInsets.only(left: 24),
              ),
              ListTile(
                leading: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black,
                    ),
                    child: Icon(Icons.category_rounded, color: Colors.white)),
                title: Text('CATEGORIES'),
                contentPadding: EdgeInsets.only(left: 24),
              ),
              ListTile(
                leading: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.black,
                    ),
                    child: Icon(
                      Icons.local_offer,
                      color: Colors.white,
                    )),
                title: Text('OFFERS'),
                contentPadding: EdgeInsets.only(left: 24),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: _screensName[_pageIndex],
          centerTitle: true,
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
            SizedBox(
              width: 4,
            )
          ],
        ),
      ),
    );
  }
}
