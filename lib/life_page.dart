import 'package:flutter/material.dart';
import 'package:flutter_count/base_widget_page.dart';
import 'package:flutter_count/form_page.dart';

class LifePage extends StatefulWidget {
  const LifePage({Key key, this.initValue: 0});
  final int initValue;

  @override
  _LifePageState createState() => new _LifePageState();
}

class _LifePageState extends State<LifePage> {
  int _counter;

  @override
  void initState() {
    super.initState();
    // 初始化状态
    _counter = widget.initValue;
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Life Page'),
        backgroundColor: themeData.primaryColor,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('$_counter'),
              onPressed: () => setState(() => ++_counter),
            ),
            TextPage(),
            TextSpanPage(),
            DefaultTextStylePage(),
            CustomButton(),
            ImageNetworkPage(),
            ImagePage(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Text(
          '跳转到表单',
        ),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return FormPage();
          }));
        },
      ),
    );
  }

  @override
  void didUpdateWidget(LifePage oldWidget) {
    // 在widget重新构建时 热更新时
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget');
  }

  @override
  void reassemble() {
    // ：此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
    super.reassemble();
    print("reassemble");
  }

  @override
  void deactivate() {
    // 当State对象从树中被移除时
    super.deactivate();
    print('deactivate');
  }

  @override
  void dispose() {
    // 当State对象从树中被永久移除时调用；
    super.dispose();
    print('dispose');
  }

  @override
  void didChangeDependencies() {
    // 当State对象的依赖发生变化时会被调用
    // 典型的场景是当系统语言Locale或应用主题改变时，Flutter framework会通知widget调用此回调
    super.didChangeDependencies();
    print('didChangeDependencies');
  }
}
