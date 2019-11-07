import 'package:flutter/material.dart';

class Layout_Row_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("线性布局Row,Column"),
      ),
      body: new Container(
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("helo world"),
                Text("I am Jack"),
              ],
            ),
            new Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("helo world"),
                Text("I am Jack"),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.end,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text(" hello world "),
                Text(" I am Jack "),
              ],
            ),
            new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(
                  " hello world ",
                  style: TextStyle(fontSize: 30.0),
                ),
                Text(" I am Jack "),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 绝对定位 配合 Stack 和 Positioned
// Stack 为父级元素
// 可以指定一个或者多个子元素相对于父级各个边的精准偏移，并且可以重叠。
class Layout_Stack_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("层叠布局Stack,Positioned"),
      ),
      body: new ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Positioned(
              child: Text("I am Jack"),
              left: 18.0,
            ),
            Container(
              child: Text("Hello World", style: TextStyle(color: Colors.red)),
            ),
            Positioned(
              child: Text("you friend"),
              top: 18.0,
            )
          ],
        ),
      ),
    );
  }
}

// 相对定位
// Align 会先通过 alignment 参数来确定坐标原点
// Alignment Widget会以矩形的中心点作为坐标原点，
// FractionalOffset 以左顶点为坐标原点；
// widthFactor 和 heightFactor 为 null 时 组件的宽高会占用尽可能多的空间
class Layout_Align_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120.0,
      // width: 120.0,
      color: Colors.blue[50],
      child: Align(
        widthFactor: 2,
        heightFactor: 2,
        alignment: Alignment.topRight,
        child: FlutterLogo(
          size: 60,
        ),
      ),
      // child: Align(
      //   alignment: Alignment.topRight,
      //   child: FlutterLogo(
      //     size: 60,
      //   ),
      // ),
    );
  }
}

class Layout_Padding_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // 四周
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Padding(
            // 仅一个方向
            padding: EdgeInsets.only(left: 8.0),
            child: Text("Hello world"),
          ),
          Padding(
            // 对称方向 左右 和 上下
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Laaaaa"),
          ),
          Padding(
            // 可设置四周 方向 左，上，右， 下
            padding: EdgeInsets.fromLTRB(20.0, 0, 0, 20),
            child: Text("cxzcxzczx"),
          ),
        ],
      ),
    );
  }
}

// ConstrainedBox 用于对子组件添加额外的约束
// BoxConstraints 用于设置限制条件
// SizeBox 和 BoxConstraints.tightFor 是等价的
// BoxConstraints.tightFor(width:80.0,height:80,0) = BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0)
// 对于 minWidth 和 minHeight 来说，是取父子中相应数值较大的
class Layout_ConstrainedBox_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: double.infinity, //宽度尽可能的大
        minHeight: 50.0,
        // maxHeight: ,
        // maxWidth: ,
      ),
      child: Container(
        height: 5.0,
        color: Colors.red,
      ),
    );
  }
}
