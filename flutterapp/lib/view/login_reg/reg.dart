import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/routes.dart';

class RegPage extends StatefulWidget {
  @override
  RegPageState createState() => new RegPageState();
}

class RegPageState extends State<RegPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String phone;
  String verifyCode;
  String passwordFirst;
  String passwordSecond;
  bool ishide = true;
  bool ishide1 = true;
  String _getCodeString = "获取验证码";
  int lastTime = 10;
  var timer;
  getCode() {
    setState(() {
      if (_getCodeString != "获取验证码") {
        return;
      }
      _getCodeString = '${lastTime--}s后重新获取';
      timer = new Timer.periodic(new Duration(seconds: 1), (timer) {
        setState(() {
          if (lastTime > 0) {
            _getCodeString = '${lastTime--}s后重新获取';
          } else {
            _getCodeString = '获取验证码';
            lastTime = 9;
            timer.cancel();
            timer = null;
          }
        });
      });
    });
  }

  regBtn() async {
    final form = _formKey.currentState;
    RegExp mobile =
        new RegExp(r"(13[0-9]|15[0-35-9]|17[0678]|18[0-9]|14[57])[0-9]{8}");
    form.save();
    if (phone.isEmpty) {
      Fluttertoast.showToast(msg: "请输入手机号码");
    } else if (!mobile.hasMatch(phone)) {
      Fluttertoast.showToast(msg: "请输入正确的手机号码");
    } else if (passwordFirst.isEmpty) {
      Fluttertoast.showToast(msg: "请输入密码");
    } else if (passwordSecond.isEmpty) {
      Fluttertoast.showToast(msg: "请确认密码");
    } else if (passwordFirst != passwordSecond) {
      Fluttertoast.showToast(msg: "两次密码不一致，请重新输入");
    } else {
      Map params = {"phone": int.parse(phone), "password": passwordFirst};
      try {
        final data = await http.Client()
            .post("http://192.168.56.1:3000/admin/reg",
                body: json.encode(params))
            .then((res) {
          return json.decode(res.body);
        });
        if (data["code"] == 1) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString("token", data["token"]);
          form.reset();
          Fluttertoast.showToast(msg: "注册成功");
          Routes.router.navigateTo(context, '/login');
        } else {
          Fluttertoast.showToast(msg: data["msg"]);
        }
      } catch (error) {}
    }
  }

  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomPadding: false,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      "https://alipic.lanhuapp.com/bb704d8d79ba49875a74f68b85a6f77d"),
                  fit: BoxFit.fill)),
          padding: EdgeInsets.only(
              top: ScreenUtil().setWidth(113),
              left: ScreenUtil().setWidth(20),
              right: ScreenUtil().setWidth(20)),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(12)),
                            border: InputBorder.none,
                            hintText: "输入手机号",
                            hintStyle: TextStyle(color: Colors.white)),
                        keyboardType: TextInputType.numberWithOptions(),
                        onSaved: (val) {
                          phone = val;
                        },
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setWidth(8),
                      left: ScreenUtil().setWidth(10),
                      child: Image.asset(
                        "images/icon/phone_icon.png",
                        width: ScreenUtil().setWidth(15),
                        height: ScreenUtil().setWidth(28),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(12)),
                            border: InputBorder.none,
                            hintText: "输入验证码",
                            hintStyle: TextStyle(color: Colors.white)),
                        keyboardType: TextInputType.numberWithOptions(),
                        onSaved: (val) {
                          verifyCode = val;
                        },
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setWidth(13),
                      left: ScreenUtil().setWidth(10),
                      child: Image.asset(
                        "images/icon/verificationCode_1.png",
                        width: ScreenUtil().setWidth(16),
                        height: ScreenUtil().setWidth(19),
                      ),
                    ),
                    Positioned(
                      right: ScreenUtil().setWidth(10),
                      top: ScreenUtil().setWidth(10),
                      child: GestureDetector(
                        onTap: () {
                          getCode();
                        },
                        child: Container(
                          // color: Colors.white,
                          padding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setWidth(5),
                              horizontal: ScreenUtil().setWidth(5)),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(155, 155, 155, 1),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(ScreenUtil().setWidth(13)))),
                          child: Text(_getCodeString,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: TextFormField(
                        obscureText: ishide,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(12)),
                            border: InputBorder.none,
                            hintText: "设置新密码",
                            hintStyle: TextStyle(color: Colors.white)),
                        onSaved: (val) {
                          passwordFirst = val;
                        },
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setWidth(13),
                      left: ScreenUtil().setWidth(10),
                      child: Image.asset(
                        "images/icon/pas_icon.png",
                        width: ScreenUtil().setWidth(16),
                        height: ScreenUtil().setWidth(19),
                      ),
                    ),
                    Positioned(
                        width: ScreenUtil().setWidth(40),
                        height: ScreenUtil().setWidth(44),
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              ishide = !ishide;
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              color: Colors.transparent,
                              child: ishide
                                  ? Image.asset(
                                      "images/icon/ishide_2.png",
                                      width: ScreenUtil().setWidth(20),
                                      height: ScreenUtil().setWidth(10),
                                    )
                                  : Image.asset(
                                      "images/icon/isopen_2.png",
                                      width: ScreenUtil().setWidth(20),
                                      height: ScreenUtil().setWidth(13),
                                    )),
                        ))
                  ],
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: TextFormField(
                        obscureText: ishide1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Colors.white),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(12)),
                            border: InputBorder.none,
                            hintText: "确认新密码",
                            hintStyle: TextStyle(color: Colors.white)),
                        onSaved: (val) {
                          passwordSecond = val;
                        },
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setWidth(13),
                      left: ScreenUtil().setWidth(10),
                      child: Image.asset(
                        "images/icon/pas_icon.png",
                        width: ScreenUtil().setWidth(16),
                        height: ScreenUtil().setWidth(19),
                      ),
                    ),
                    Positioned(
                        width: ScreenUtil().setWidth(40),
                        height: ScreenUtil().setWidth(44),
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              ishide1 = !ishide1;
                            });
                          },
                          child: Container(
                              alignment: Alignment.center,
                              color: Colors.transparent,
                              child: ishide1
                                  ? Image.asset(
                                      "images/icon/ishide_2.png",
                                      width: ScreenUtil().setWidth(20),
                                      height: ScreenUtil().setWidth(10),
                                    )
                                  : Image.asset(
                                      "images/icon/isopen_2.png",
                                      width: ScreenUtil().setWidth(20),
                                      height: ScreenUtil().setWidth(13),
                                    )),
                        ))
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    regBtn();
                  },
                  child: Container(
                    height: ScreenUtil().setWidth(44),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(110)),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.white)),
                    child: Text(
                      "注册",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(14)),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
