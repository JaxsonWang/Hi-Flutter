import 'package:flutter/material.dart';
import 'package:flutter_app/route/home/layouts/StateFullWidgetDemo.dart';
import 'package:flutter_app/route/home/layouts/StateFulltDemo.dart';
import 'package:flutter_app/route/home/layouts/QRCodeScanDemo.dart';

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
            title: Text('StateFullWidget 状态切换实例展示'),
            onTap: () {
//            print('执行点击事件！');
//              // Find the Scaffold in the Widget tree and use it to show a SnackBar!
//              Scaffold.of(context).showSnackBar(SnackBar(
//                content: Text('你点击了它！'),
//              ));
              // 路由跳转
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new StateFullWidgetDemo()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.aspect_ratio),
            title: Text('StatefulWidget 状态管理实例展示'),
            onTap: () {
              // 路由跳转
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new StateFulltDemo()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.aspect_ratio),
            title: Text('扫一扫'),
            onTap: () {
              // 路由跳转
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => new QRCodeScanDemo()),
              );
            },
          ),
        ],
      ),
    );
  }
}
