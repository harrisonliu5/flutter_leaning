import 'package:flutter/material.dart';
import 'package:flutter_count/home.dart';
import 'package:flutter_count/layout_page.dart';
import 'package:flutter_count/life_page.dart';
import 'count_page.dart';
import 'new_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      routes: {
        'new_route': (BuildContext context) => NewRoute(),
        // '/': (BuildContext context) => ParentWidget(title: 'Home Page'),
        'life_page': (BuildContext context) => LifePage(),
        "layout_Row_page": (BuildContext context) => Layout_Row_Page(),
        "layout_Stack_page": (BuildContext context) => Layout_Stack_Page(),
      },
      home: new HomePage(),
    );
  }
}

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  //共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    //在此简单返回true，则每次更新都会调用依赖其的子孙节点的`didChangeDependencies`。
    return true;
  }
}
