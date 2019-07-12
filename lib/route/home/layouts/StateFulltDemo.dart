import 'package:flutter/material.dart';

class StateFulltDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Layout Demo',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('StateFullWidget Demo'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: '返回上一页',
            onPressed: () => {
              // 关闭当前页面，并且返回上一页
              Navigator.pop(context)
            },
          ),
        ),
        body: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new switchBoxFul(),
            new switchBoxLess(),
          ],
        ),
      ),
    );
  }
}

/*
  switchBoxFul 是自身widget管理自己状态
 */
class switchBoxFul extends StatefulWidget {
  @override
  _SwitchBoxState createState() {
    return new _SwitchBoxState();
  }
}

class _SwitchBoxState extends State<switchBoxFul> {
  bool _switchActive = false; // 按钮显示`关闭`这个状态

  void _switchActiveChanged() {
    setState(() {
      _switchActive = !(_switchActive);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _switchActiveChanged,
      child: new Center(
        child: new Container(
          alignment: Alignment.center,
          width: 200.0,
          height: 200.0,
          child: new Text(
            _switchActive ? '开' : '关',
            style: new TextStyle(fontSize: 50.0, color: Colors.white),
          ),
          decoration: new BoxDecoration(
              color: _switchActive ? Colors.green[400] : Colors.grey),
        ),
      ),
    );
  }
}

/*
  SwitchBoxLess 是父widget管理子widget状态;
  SwitchBoxLess 继承自无状态控件，不管理任何状态
 */
class SwitchBoxLessWidget extends StatelessWidget {
  SwitchBoxLessWidget({Key key, this.switchActive: false, this.onChanged}) : super(key: key);
  final switchActive;
  final ValueChanged<bool> onChanged;

  void _switchActiveChanged() {
    onChanged(!switchActive);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _switchActiveChanged,
      child: new Center(
        child: new Container(
          alignment: Alignment.center,
          width: 200.0,
          height: 200.0,
          child: new Text(
            switchActive ? '开启' : '关闭',
            style: new TextStyle(fontSize: 50.0, color: Colors.white),
          ),
          decoration: new BoxDecoration(
              color: switchActive ? Colors.blue : Colors.red),
        ),
      ),
    );
  }
}

/*
ParentWidget类是SwitchBoxLess的父类
他会得知盒子是否被点击从而管理盒子的状态，通过setState更新展示内容
 */
class switchBoxLess extends StatefulWidget {
  @override
  _SwitchBoxLessState createState() {
    return new _SwitchBoxLessState();
  }
}

class _SwitchBoxLessState extends State<switchBoxLess> {
  bool _switchActive = false;

  void _handleSwitchBoxLessChanged(bool value) {
    setState(() {
      _switchActive = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new SwitchBoxLessWidget(
      switchActive: _switchActive,
      onChanged: _handleSwitchBoxLessChanged,
    );
  }
}