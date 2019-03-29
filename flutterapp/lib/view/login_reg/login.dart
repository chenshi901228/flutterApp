import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/routes.dart';

import '../../blocs/main_bloc.dart';

bool isLogin = true;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String phone;
  String password;
  void loginBtn(bloc) async {
    final form = _formKey.currentState;
    form.save();
    RegExp mobile =
        new RegExp(r"(13[0-9]|15[0-35-9]|17[0678]|18[0-9]|14[57])[0-9]{8}");
    if (phone.isEmpty) {
      Fluttertoast.showToast(msg: "请输入手机号码");
    } else if (!mobile.hasMatch(phone)) {
      Fluttertoast.showToast(msg: "请输入正确的手机号码");
    } else if (password.isEmpty) {
      Fluttertoast.showToast(msg: "请输入密码");
    } else {
      Map params = {"phone": int.parse(phone), "password": password};
      bloc.login(params, form, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    final blocLogin = BlocProviderMain.of(context);
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomPadding: false, //防止输入框获取焦点顶掉内容
      body: Container(
          padding: EdgeInsets.only(
              top: ScreenUtil().setWidth(143),
              left: ScreenUtil().setWidth(20),
              right: ScreenUtil().setWidth(20)),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://alipic.lanhuapp.com/bb704d8d79ba49875a74f68b85a6f77d"),
                  fit: BoxFit.fill)),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.numberWithOptions(),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setWidth(12)),
                              border: InputBorder.none,
                              hintText: "输入账号",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1))),
                          onSaved: (value) {
                            phone = value;
                          },
                        ),
                        Positioned(
                          left: ScreenUtil().setWidth(10),
                          top: ScreenUtil().setWidth(8),
                          child: Image.asset(
                            'images/icon/phone_icon.png',
                            width: ScreenUtil().setWidth(15),
                            height: ScreenUtil().setWidth(28),
                          ),
                        )
                      ],
                    )),
                Container(
                    margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
                    decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        TextFormField(
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Color.fromRGBO(255, 255, 255, 1)),
                          textAlign: TextAlign.center,
                          obscureText: true,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: ScreenUtil().setWidth(12)),
                              border: InputBorder.none,
                              hintText: "输入密码",
                              hintStyle: TextStyle(
                                  color: Color.fromRGBO(255, 255, 255, 1))),
                          onSaved: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                        ),
                        Positioned(
                          left: ScreenUtil().setWidth(10),
                          top: ScreenUtil().setWidth(8),
                          child: Image.asset(
                            'images/icon/pas_icon.png',
                            width: ScreenUtil().setWidth(15),
                            height: ScreenUtil().setWidth(28),
                          ),
                        )
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Routes.router
                            .navigateTo(context, '/forgetPassWordPage');
                      },
                      child: Text(
                        "忘记密码",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.white),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Routes.router.navigateTo(context, '/regPage');
                      },
                      child: Text(
                        "快速注册",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    loginBtn(blocLogin);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(104)),
                    height: ScreenUtil().setWidth(44),
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Text("立即登录",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Colors.white)),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
