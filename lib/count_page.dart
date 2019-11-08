import 'package:flutter/material.dart';
// import 'new_route.dart';

class ParentWidget extends StatefulWidget {
  ParentWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  num _count = 0;
  void _handleTapboxChanged(num newValue) {
    setState(() {
      _count = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new MyHomePage(
          count: _count, onChanged: _handleTapboxChanged, title: widget.title),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.count: 0,
    this.title,
    @required this.onChanged,
  }) : super(key: key);

  final int count;
  final String title;
  final ValueChanged<num> onChanged;

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  int _minCounter = 0;

  void _handleMinCounter() {
    setState(() {
      _minCounter--;
    });
  }

  void _handleIncreaseNum() {
    int counter = widget.count;
    counter++;
    setState(() {
      _minCounter = counter;
    });
    widget.onChanged(counter);
  }

  void _handleRoute() {
    Navigator.pushNamed(context, "new_route");
    // Navigator.push(context, MaterialPageRoute(builder: (context) {
    //   return NewRoute();
    // }));
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.count;
    return new Container(
      alignment: Alignment.center,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text('按下按钮加一'),
          new Text(
            '$count',
            style: Theme.of(context).textTheme.display1,
          ),
          new Text('按下按钮减一'),
          new Text(
            '$_minCounter',
            style: Theme.of(context).textTheme.display1,
          ),
          new FloatingActionButton(
            heroTag: 'btn1',
            onPressed: _handleMinCounter,
            child: Icon(Icons.remove),
          ),
          new FloatingActionButton(
            heroTag: 'btn3',
            onPressed: _handleIncreaseNum,
            child: new Icon(Icons.add),
          ),
          new FloatingActionButton(
            heroTag: 'btn2',
            onPressed: _handleRoute,
            child: Icon(Icons.add_circle),
          ),
        ],
      ),
    );
  }
}
