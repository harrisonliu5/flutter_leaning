import 'package:flutter/material.dart';

// 导航返回拦截 willPopScope
// 一秒内点击两次返回则返回
class WillPopScopeTestRoute extends StatefulWidget {
  @override
  WillPopScopeState createState() => new WillPopScopeState();
}

class WillPopScopeState extends State<WillPopScopeTestRoute> {
  DateTime _lastPressedAt;

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
          _lastPressedAt = DateTime.now();
          return false;
        }
        return true;
      },
      child: new Scaffold(
        appBar: AppBar(
          title: Text("返回控制"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Text(
            '1s内连续两次返回退出',
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
