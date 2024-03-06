import 'package:flutter/material.dart';
import 'package:flutter_walpaper/constants/color.dart';
import 'package:flutter_walpaper/pages/category.dart';
import 'package:flutter_walpaper/pages/home.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ConstColor.appWhite,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: ConstColor.appWhite,
            ),
            child: Text(
              'Flutter Wallpaper',
              style: TextStyle(
                color: ConstColor.appBlack,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.category),
            title: Text('Category'),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => CategoryPage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.rate_review),
            title: Text('Rate Us'),
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Share this app'),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About Us'),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Positioned(
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Text('Developed by Kinglimited'),
            ),
          )
        ],
      ),
    );
  }
}
