import 'dart:async';

import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QRCodeScanDemo extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<QRCodeScanDemo> {
  String barcode = "";

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Layout Demo',
      home: new Scaffold(
        appBar: AppBar(
          title: Text('扫一扫'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            tooltip: '返回上一页',
            onPressed: () => {
              // 关闭当前页面，并且返回上一页
              Navigator.pop(context)
            },
          ),
        ),
        body: new Scaffold(
            body: new Center(
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new MaterialButton(
                        onPressed: scan, child: new Text("点击启动相机")),
                    padding: const EdgeInsets.all(8.0),
                  ),
                  new Text(barcode == "" ? barcode : '识别内容：$barcode'),
                ],
              ),
            )
        )
      ),
    );
  }

  Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = '用户未授予相机权限！';
        });
      } else {
        setState(() => this.barcode = '未知错误： $e');
      }
    } on FormatException{
      setState(() => this.barcode = '获取失败：在未识别二维码之前退出！');
    } catch (e) {
      setState(() => this.barcode = '未知错误: $e');
    }
  }
}
