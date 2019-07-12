import 'package:flutter/material.dart';

//class Layouts extends StatefulWidget {
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<Layouts> {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: Center(
//        child: Text('测试'),
//      )
//    );
//  }
//}
class StateFullWidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      child: new FavoriteWidget(),
    );

    return MaterialApp(
      title: 'Flutter Layout Demo',
      home: Scaffold(
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
        body: Center(
          child: titleSection,
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget {
  @override
  _FavoriteWidgetState createState() {
    return _FavoriteWidgetState();
  }
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 55;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
        // Otherwise, favorite it.
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
              icon: (_isFavorited
                  ? new Icon(Icons.star)
                  : new Icon(Icons.star_border)),
              onPressed: _toggleFavorite),
        ),
        new SizedBox(
          width: 18.0,
          child: new Container(child: new Text('$_favoriteCount')),
        ),
      ],
    );
  }
}
