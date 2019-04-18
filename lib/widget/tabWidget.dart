import 'package:flutter/material.dart';

class TabbedScaffold extends StatelessWidget {
  TabbedScaffold({this.title, this.tabs, this.actions, this.widgets});

  final String title;
  final List<String> tabs;
  final List<Widget> actions;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: widgets.length,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
          actions: (actions ?? null),
          bottom: new TabBar(
            isScrollable: false,
            tabs: tabs.map((String s) => new Tab(text: s)).toList(),
          ),
        ),
        body: new TabBarView(
          children: widgets.map((Widget widget) {
            return new SafeArea(
              top: false,
              bottom: false,
              child: new Padding(
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
