import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPassWordPage extends StatefulWidget {
  @override
  _ForgetPassWordPageState createState() => new _ForgetPassWordPageState();
}

class _ForgetPassWordPageState extends State<ForgetPassWordPage> {
  bool ishide = true;
  bool ishide1 = true;
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
                  height: ScreenUtil().setHeight(15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          elevation: 0, //底部阴影设置
        ),
        preferredSize: Size.fromHeight(ScreenUtil().setHeight(44)),
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(49),
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20)),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(155, 155, 155, 1))),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: Color.fromRGBO(155, 155, 155, 1)),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(12)),
                        border: InputBorder.none,
                        hintText: "输入手机号",
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(155, 155, 155, 1))),
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(8),
                  left: ScreenUtil().setWidth(10),
                  child: Image.asset(
                    "images/icon/phone_icon_1.png",
                    width: ScreenUtil().setWidth(15),
                    height: ScreenUtil().setHeight(28),
                  ),
                )
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(155, 155, 155, 1))),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: Color.fromRGBO(155, 155, 155, 1)),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(12)),
                        border: InputBorder.none,
                        hintText: "输入验证码",
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(155, 155, 155, 1))),
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(13),
                  left: ScreenUtil().setWidth(10),
                  child: Image.asset(
                    "images/icon/verificationCode.png",
                    width: ScreenUtil().setWidth(16),
                    height: ScreenUtil().setHeight(19),
                  ),
                ),
                Positioned(
                  right: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setHeight(10),
                  child: GestureDetector(
                    onTap: () {
                      print("获取验证码");
                    },
                    child: Container(
                      // color: Color.fromRGBO(155, 155, 155, 1),
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setHeight(5),
                          horizontal: ScreenUtil().setWidth(5)),
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(155, 155, 155, 1),
                          borderRadius: BorderRadius.all(
                              Radius.circular(ScreenUtil().setWidth(13)))),
                      child: Text("获取验证码",
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
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(155, 155, 155, 1))),
                  child: TextField(
                    obscureText: ishide,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: Color.fromRGBO(155, 155, 155, 1)),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(12)),
                        border: InputBorder.none,
                        hintText: "设置新密码",
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(155, 155, 155, 1))),
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(13),
                  left: ScreenUtil().setWidth(10),
                  child: Image.asset(
                    "images/icon/pas_icon_1.png",
                    width: ScreenUtil().setWidth(16),
                    height: ScreenUtil().setHeight(19),
                  ),
                ),
                Positioned(
                    width: ScreenUtil().setWidth(40),
                    height: ScreenUtil().setHeight(44),
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
                                  height: ScreenUtil().setHeight(10),
                                )
                              : Image.asset(
                                  "images/icon/isopen_1.png",
                                  width: ScreenUtil().setWidth(20),
                                  height: ScreenUtil().setHeight(13),
                                )),
                    ))
              ],
            ),
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromRGBO(155, 155, 155, 1))),
                  child: TextField(
                    obscureText: ishide1,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: Color.fromRGBO(155, 155, 155, 1)),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(12)),
                        border: InputBorder.none,
                        hintText: "确认新密码",
                        hintStyle:
                            TextStyle(color: Color.fromRGBO(155, 155, 155, 1))),
                  ),
                ),
                Positioned(
                  top: ScreenUtil().setHeight(13),
                  left: ScreenUtil().setWidth(10),
                  child: Image.asset(
                    "images/icon/pas_icon_1.png",
                    width: ScreenUtil().setWidth(16),
                    height: ScreenUtil().setHeight(19),
                  ),
                ),
                Positioned(
                    width: ScreenUtil().setWidth(40),
                    height: ScreenUtil().setHeight(44),
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
                                  height: ScreenUtil().setHeight(10),
                                )
                              : Image.asset(
                                  "images/icon/isopen_1.png",
                                  width: ScreenUtil().setWidth(20),
                                  height: ScreenUtil().setHeight(13),
                                )),
                    ))
              ],
            ),
            GestureDetector(
              onTap: () {
                print("修改密码成功");
              },
              child: Container(
                height: ScreenUtil().setHeight(44),
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(40)),
                decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromRGBO(155, 155, 155, 1))),
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
      ),
    );
  }
}
