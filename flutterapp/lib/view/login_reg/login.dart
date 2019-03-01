import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/routes.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomPadding: false, //防止输入框获取焦点顶掉内容
      body: Container(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(143),
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20)),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://alipic.lanhuapp.com/bb704d8d79ba49875a74f68b85a6f77d"),
                fit: BoxFit.fill)),
        child: Column(
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Color.fromRGBO(255, 255, 255, 1)),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(12)),
                          border: InputBorder.none,
                          hintText: "输入账号",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1))),
                    ),
                    Positioned(
                      left: ScreenUtil().setWidth(10),
                      top: ScreenUtil().setHeight(8),
                      child: Image.asset(
                        'images/icon/phone_icon.png',
                        width: ScreenUtil().setWidth(15),
                        height: ScreenUtil().setHeight(28),
                      ),
                    )
                  ],
                )),
            Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(255, 255, 255, 1)),
                ),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Color.fromRGBO(255, 255, 255, 1)),
                      textAlign: TextAlign.center,
                      obscureText: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: ScreenUtil().setHeight(12)),
                          border: InputBorder.none,
                          hintText: "输入密码",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(255, 255, 255, 1))),
                    ),
                    Positioned(
                      left: ScreenUtil().setWidth(10),
                      top: ScreenUtil().setHeight(8),
                      child: Image.asset(
                        'images/icon/pas_icon.png',
                        width: ScreenUtil().setWidth(15),
                        height: ScreenUtil().setHeight(28),
                      ),
                    )
                  ],
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Routes.router.navigateTo(context, '/forgetPassWordPage');
                  },
                  child: Text(
                    "忘记密码",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(12), color: Colors.white),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Routes.router.navigateTo(context, '/regPage');
                  },
                  child: Text(
                    "快速注册",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(12), color: Colors.white),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Routes.router.navigateTo(context, '/indexPage');
              },
              child: Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(104)),
                height: ScreenUtil().setHeight(44),
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.white)),
                child: Text("立即登录",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14), color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
