import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0.0),
        children: <Widget>[
          MyDrawerHeader(),
        ],
      ),
    );
  }
}

class MyDrawerHeader extends StatefulWidget {
  const MyDrawerHeader({Key key}) : super(key: key);

  @override
  _MyDrawerHeaderState createState() => _MyDrawerHeaderState();
}

class _MyDrawerHeaderState extends State<MyDrawerHeader> {
  @override
  Widget build(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: Text('淮城一只猫'),
      accountEmail: Text('i@iiong.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
      ),
    );
  }
}
