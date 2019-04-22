import 'package:flutter/material.dart';
import 'package:flutter_app/route/home/layouts/layouts.dart';

class Widgets extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Widgets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.aspect_ratio),
            title: Text('布局1'),
            onTap: () {
//            print('执行点击事件！');
//              // Find the Scaffold in the Widget tree and use it to show a SnackBar!
//              Scaffold.of(context).showSnackBar(SnackBar(
//                content: Text('你点击了它！'),
//              ));
              // 路由跳转
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new Layouts()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.aspect_ratio),
            title: Text('布局2'),
          ),
          ListTile(
            leading: Icon(Icons.aspect_ratio),
            title: Text('布局3'),
          ),
        ],
      ),
    );
  }
}
