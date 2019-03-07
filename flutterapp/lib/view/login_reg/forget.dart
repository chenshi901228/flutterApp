import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class ForgetPassWordPage extends StatefulWidget {
  @override
  _ForgetPassWordPageState createState() => new _ForgetPassWordPageState();
}

class _ForgetPassWordPageState extends State<ForgetPassWordPage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  int phone;
  int verifyCode;
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

  editBtn() {
    Fluttertoast.showToast(msg: "修改密码成功");
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
      appBar: PreferredSize(
        child: AppBar(
          title: Text(
            "设置密码",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                color: Color.fromRGBO(51, 51, 51, 1)),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset(
                  "images/icon/backBtn_1.png",
                  width: ScreenUtil().setWidth(8),
                  height: ScreenUtil().setWidth(15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          elevation: 0, //底部阴影设置
        ),
        preferredSize: Size.fromHeight(ScreenUtil().setWidth(44)),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(
              top: ScreenUtil().setWidth(49),
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
                          border: Border.all(
                              color: Color.fromRGBO(155, 155, 155, 1))),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(155, 155, 155, 1)),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(12)),
                            border: InputBorder.none,
                            hintText: "输入手机号",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(155, 155, 155, 1))),
                        onSaved: (val) {
                          phone = int.parse(val);
                        },
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setWidth(8),
                      left: ScreenUtil().setWidth(10),
                      child: Image.asset(
                        "images/icon/phone_icon_1.png",
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
                          border: Border.all(
                              color: Color.fromRGBO(155, 155, 155, 1))),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(155, 155, 155, 1)),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(12)),
                            border: InputBorder.none,
                            hintText: "输入验证码",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(155, 155, 155, 1))),
                        onSaved: (val) {
                          verifyCode = int.parse(val);
                        },
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setWidth(13),
                      left: ScreenUtil().setWidth(10),
                      child: Image.asset(
                        "images/icon/verificationCode.png",
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
                          // color: Color.fromRGBO(155, 155, 155, 1),
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
                                  color: Color.fromRGBO(74, 74, 74, 1))),
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
                          border: Border.all(
                              color: Color.fromRGBO(155, 155, 155, 1))),
                      child: TextFormField(
                        obscureText: ishide,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(155, 155, 155, 1)),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(12)),
                            border: InputBorder.none,
                            hintText: "设置新密码",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(155, 155, 155, 1))),
                        onSaved: (val) {
                          passwordFirst = val;
                        },
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setWidth(13),
                      left: ScreenUtil().setWidth(10),
                      child: Image.asset(
                        "images/icon/pas_icon_1.png",
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
                                      "images/icon/ishide_1.png",
                                      width: ScreenUtil().setWidth(20),
                                      height: ScreenUtil().setWidth(10),
                                    )
                                  : Image.asset(
                                      "images/icon/isopen_1.png",
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
                          border: Border.all(
                              color: Color.fromRGBO(155, 155, 155, 1))),
                      child: TextFormField(
                        obscureText: ishide1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(155, 155, 155, 1)),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(12)),
                            border: InputBorder.none,
                            hintText: "确认新密码",
                            hintStyle: TextStyle(
                                color: Color.fromRGBO(155, 155, 155, 1))),
                        onSaved: (val) {
                          passwordSecond = val;
                        },
                      ),
                    ),
                    Positioned(
                      top: ScreenUtil().setWidth(13),
                      left: ScreenUtil().setWidth(10),
                      child: Image.asset(
                        "images/icon/pas_icon_1.png",
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
                                      "images/icon/ishide_1.png",
                                      width: ScreenUtil().setWidth(20),
                                      height: ScreenUtil().setWidth(10),
                                    )
                                  : Image.asset(
                                      "images/icon/isopen_1.png",
                                      width: ScreenUtil().setWidth(20),
                                      height: ScreenUtil().setWidth(13),
                                    )),
                        ))
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    editBtn();
                  },
                  child: Container(
                    height: ScreenUtil().setWidth(44),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(40)),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromRGBO(155, 155, 155, 1))),
                    child: Text(
                      "完成",
                      style: TextStyle(
                          color: Color.fromRGBO(155, 155, 155, 1),
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
