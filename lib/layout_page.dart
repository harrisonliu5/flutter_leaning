import 'package:flutter/material.dart';
import 'dart:math' as math;

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

// UnconstrainedBox 用来清除父组件的限制，只不过不影响最终子元素的大小，但是父组件任然占有相应的空间
// 而且不能在不改变父组件代码的情况下彻底去掉 父 ConstrainedBox 的限制。

class Layout_DecorateBox_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      // decoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     colors: [
      //       Colors.red,
      //       Colors.orange[700],
      //     ],
      //   ),
      //   borderRadius: BorderRadius.circular(3.0),
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black54,
      //       offset: Offset(2.0, 2.0),
      //       blurRadius: 4.0,
      //     )
      //   ],
      // ),
      decoration: BoxDecoration(
        gradient: SweepGradient(
          center: FractionalOffset.center,
          startAngle: 0.0,
          endAngle: math.pi * 2,
          colors: const <Color>[
            Color(0xFF4285F4), // blue
            Color(0xFF34A853), // green
            Color(0xFFFBBC05), // yellow
            Color(0xFFEA4335), // red
            Color(
                0xFF4285F4), // blue again to seamlessly transition to the start
          ],
          stops: const <double>[0.0, 0.25, 0.5, 0.75, 1.0],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 18.0),
        child: Text(
          "Login",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

// Transform 是在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。
//RotatedBox 的变化在 layout阶段，会影响组件的位置和大小

class Transform_Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Transform.scale(scale: 1.5, child: Text("Hello world"))),
        Text(
          "你好",
          style: TextStyle(color: Colors.green, fontSize: 18.0),
        )
      ],
    );
  }
}

// Container 是一个多功能的容器包含DecoratedBox、ConstrainedBox、Transform、Padding、Align等
// 宽高以width和height优先
