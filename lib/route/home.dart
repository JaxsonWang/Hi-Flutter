import 'package:flutter/material.dart';
import 'package:flutter_app/route/home/cards.dart';
import 'package:flutter_app/route/home/dialogs.dart';
import 'package:flutter_app/route/home/widgets.dart';

import 'package:flutter_app/widget/tabWidget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['风格', '弹窗', '布局'];

    final List<Widget> widget = <Widget>[
      new Cards(),
      new Dialogs(),
      new Widgets(),
    ];

    return TabbedScaffold(
      title: '功能展示',
      tabs: tabs,
      widgets: widget,
    );
  }
}
