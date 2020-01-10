import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_rightclick_law_native/outstanding.dart';

import 'dashboard.dart';

class MyNavigation extends StatefulWidget {
  @override
  _MyNavigationState createState() => _MyNavigationState();
}

class _MyNavigationState extends State<MyNavigation> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'RightClick Law Menu',
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            title: Text(
              'Dashboard',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, Dashboard.tag);
            },
          ),
          ListTile(
            title: Text(
              'Outstanding',
              textAlign: TextAlign.center,
            ),
            onTap: () {
              Navigator.popAndPushNamed(context, Outstanding.tag);
            },
          ),
          ListTile(
            title: Text(
              'Calendar',
              textAlign: TextAlign.center,
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
