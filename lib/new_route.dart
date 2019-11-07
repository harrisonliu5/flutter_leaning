import 'package:flutter/material.dart';

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: new _NewRouteContain(),
      ),
    );
  }
}

class _NewRouteContain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image.asset(
          'assets/bd.jpg',
          width: 200,
        ),
        new Builder(builder: (context) {
          Scaffold scaffold = context.ancestorWidgetOfExactType(Scaffold);
          return (scaffold.appBar as AppBar).title;
        }),
        RaisedButton(
          child: Text('跳转'),
          onPressed: () => Navigator.pushNamed(context, 'life_page'),
        )
      ],
    );
  }
}
