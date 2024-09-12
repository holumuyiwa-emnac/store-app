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
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.only(right: 16, bottom: 16),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/image.png')),
                    borderRadius: BorderRadius.circular(200),
                    color: Colors.white),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child:
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit))),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  leading: Icon(Icons.person),
                  title: Text('Modify Information'),
                  subtitle: Text(
                    'Update your name, email, and contact details.',
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: Icon(Icons.chevron_right),
                  tileColor: Colors.white,
                ),
                SizedBox(
                  height: 12,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  leading: Icon(Icons.add_box),
                  title: Text('Order History'),
                  subtitle: Text(
                    'Relive your shopping journey, one order at a time.',
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: Icon(Icons.chevron_right),
                  tileColor: Colors.white,
                ),
                SizedBox(
                  height: 12,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  leading: Icon(Icons.security),
                  title: Text('Security'),
                  subtitle: Text(
                    'Manage your password, enable two-factor authentication, and set up security questions.',
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: Icon(Icons.chevron_right),
                  tileColor: Colors.white,
                ),
                SizedBox(
                  height: 12,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  leading: Icon(Icons.notifications),
                  title: Text('Notifications'),
                  subtitle: Text(
                    'Manage your password, enable two-factor authentication, and set up security questions.',
                    style: TextStyle(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  trailing: Icon(Icons.chevron_right),
                  tileColor: Colors.white,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
