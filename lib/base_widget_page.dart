import 'package:flutter/material.dart';

class BaseWidgetPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          TextPage(),
          TextSpanPage(),
          DefaultTextStylePage(),
          CustomButton(),
          ImageNetworkPage(),
          ImagePage(),
        ],
      ),
    );
  }
}

class TextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Text(
      "Hello world I'm Jack",
      style: TextStyle(
          color: Colors.blue,
          fontSize: 18.0,
          height: 1.5,
          background: new Paint()..color = Colors.yellow,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.dashed),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 1.5,
      textAlign: TextAlign.left,
    );
  }
}

class TextSpanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.grey,
        ),
        children: [
          TextSpan(text: "Home: "),
          TextSpan(
            text: "https://baidu.com",
            style: TextStyle(
              color: Colors.blue,
            ),
            recognizer: null,
          ),
          TextSpan(text: " go"),
        ],
      ),
    );
  }
}

class DefaultTextStylePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: Colors.red,
        fontSize: 20.0,
      ),
      textAlign: TextAlign.start,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("22222"),
          Text("444444"),
          Text(
            "555555",
            style: TextStyle(
              inherit: false,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: Colors.blue, //按钮背景颜色
      highlightColor: Colors.blue[700], //按钮按下时的背景颜色
      colorBrightness: Brightness.dark, //按钮主题，默认是浅色主题
      splashColor: Colors.grey, //点击时，水波动画中水波的颜色
      child: Text('Submit'),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)), //外形
      onPressed: () => {print('22222')},
    );
  }
}

class ImageNetworkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
      width: 100.0,
      color: Colors.blue,
      colorBlendMode: BlendMode.difference,
    );
    ;
  }
}

class ImagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/bd.jpg",
      width: 300.0,
      // color: Colors.grey,
      // colorBlendMode: BlendMode.difference,
    );
  }
}
