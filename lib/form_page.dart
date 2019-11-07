import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  @override
  _FormState createState() => new _FormState();
}

class _FormState extends State<FormPage> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  void _handleSubmit(context) {
    // if ((_formKey.currentState as FormState).validate()) {
    //   print(_unameController.text);
    //   print(_pwdController.text);
    // }
    if (Form.of(context).validate()) {
      print("2222");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _unameController,
                decoration: InputDecoration(
                  labelText: "用户名",
                  hintText: "用户名或者邮件",
                  icon: Icon(Icons.person),
                ),
                validator: (v) {
                  return v.trim().length > 0 ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  icon: Icon(Icons.lock),
                ),
                obscureText: true, // 是否隐藏输入的内容
                validator: (v) {
                  return v.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 28.0),
              //   child: Row(
              //     children: <Widget>[
              //       Expanded(
              //         child: RaisedButton(
              //           padding: EdgeInsets.all(15.0),
              //           child: Text('登录'),
              //           color: Theme.of(context).primaryColor,
              //           textColor: Colors.white,
              //           onPressed: _handleSubmit,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              Padding(
                padding: EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(child: Builder(
                      builder: (context) {
                        return RaisedButton(
                          padding: EdgeInsets.all(15.0),
                          child: Text('登录'),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
                          onPressed: () => _handleSubmit(context),
                        );
                      },
                    ))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
