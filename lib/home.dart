import 'package:flutter/material.dart';
import 'package:flutter_count/base_widget_page.dart';
import 'package:flutter_count/count_page.dart';
import 'package:flutter_count/form_page.dart';
import 'package:flutter_count/functional_widget.dart';
import 'package:flutter_count/life_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  Color _themeColor = Colors.teal;

  void _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }

  dynamic showWidgetByIndex() {
    switch (_selectedIndex) {
      case 0:
        // return new HomeWidgets(_themeColor);
        return new HomeWidgetsPage(_themeColor);
        break;
      case 1:
        return new BaseWidgetPage();
      case 2:
        return new ParentWidget(title: 'Home Page');
    }
  }

  void _changeThemeColor() {
    setState(() {
      _themeColor = _themeColor == Colors.teal ? Colors.blue : Colors.teal;
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
        primarySwatch: _themeColor,
        iconTheme: IconThemeData(color: _themeColor),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text("首页"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {},
            ),
          ],
        ),
        // drawer: new MyDrawer(),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: _themeColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("home"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.layers),
              title: Text("布局"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.code),
              title: Text("例子"),
            )
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
        body: Container(
          child: showWidgetByIndex(),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.palette),
          onPressed: _changeThemeColor,
        ),
      ),
    );
  }
}

class HomeWidgetsPage extends StatefulWidget {
  HomeWidgetsPage(
    this._themeColor,
  );
  final Color _themeColor;

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidgetsPage> {
  void _gotoForm() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return new FormPage();
    }));
  }

  void _gotoFunctionalWidget() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return new WillPopScopeTestRoute();
    }));
  }

  void _gotoLife() {
    Navigator.push(
        context,
        PageRouteBuilder(
            transitionDuration: Duration(milliseconds: 500),
            pageBuilder: (BuildContext context, Animation animation,
                Animation scondaryAnmation) {
              return new FadeTransition(
                opacity: animation,
                child: new LifePage(),
              );
            }));
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: RaisedButton(
            child: Text("表单"),
            color: widget._themeColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            onPressed: _gotoForm,
          ),
        ),
        RaisedButton(
          child: Text("生命周期"),
          color: widget._themeColor,
          textColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          onPressed: _gotoLife,
        ),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: RaisedButton(
            child: Text("功能组件"),
            color: widget._themeColor,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            onPressed: _gotoFunctionalWidget,
          ),
        ),
      ],
    );
  }
}
