import 'package:flutter/material.dart';
import 'package:flutter_app/widget/drawerWidget.dart';

class TabbedScaffold extends StatelessWidget {
  TabbedScaffold({this.title, this.tabs, this.actions, this.widgets});

  final String title;
  final List<String> tabs;
  final List<Widget> actions;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widgets.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: (actions ?? null),
          bottom: TabBar(
            isScrollable: false,
            tabs: tabs.map((String s) => Tab(text: s)).toList(),
          ),
        ),
        drawer: DrawerWidget(),
        body: TabBarView(
          children: widgets.map((Widget widget) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
