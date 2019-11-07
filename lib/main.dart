import 'package:flutter/material.dart';
import 'package:flutter_count/layout_page.dart';
import 'package:flutter_count/life_page.dart';
import 'count_page.dart';
import 'new_route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Count Demo',
      theme: new ThemeData(
        primaryColor: Colors.blue,
      ),
      routes: {
        'new_route': (BuildContext context) => NewRoute(),
        '/': (BuildContext context) => ParentWidget(title: 'Home Page'),
        'life_page': (BuildContext context) => LifePage(),
        "layout_Row_page": (BuildContext context) => Layout_Row_Page(),
        "layout_Stack_page": (BuildContext context) => Layout_Stack_Page(),
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _count = 0;

//   void _incrementCounter() {
//     setState(() {
//       _count++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(
//         title: new Text(widget.title),
//       ),
//       body: new Center(
//         child: new Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new Text('按下按钮增加数字'),
//             new Text(
//               '$_count',
//               style: Theme.of(context).textTheme.display1,
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: '增加',
//         child: new Icon(Icons.add),
//       ),
//     );
//   }
// }
