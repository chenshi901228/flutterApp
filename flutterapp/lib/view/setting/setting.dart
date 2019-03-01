import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingState createState() => new _SettingState();
}

class _SettingState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setWidth(44)),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
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
          title: Text(
            "设置",
            style: TextStyle(
                fontSize: ScreenUtil().setWidth(16),
                color: Color.fromRGBO(51, 51, 51, 1)),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: GestureDetector(
          onTap: () {
            print("退出当前账户");
          },
          child: Container(
            alignment: Alignment.center,
            height: ScreenUtil().setWidth(44),
            color: Color.fromRGBO(74, 74, 74, 1),
            child: Text("退出当前账户",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14), color: Colors.white)),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Routes.router.navigateTo(context, "/personalDataPage");
            },
            child: Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setWidth(14),
                  bottom: ScreenUtil().setWidth(12)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top:
                          BorderSide(color: Color.fromRGBO(231, 231, 231, 1)))),
              child: Row(
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50),
                    margin: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(216, 216, 216, 1),
                        borderRadius: BorderRadius.circular(100)),
                    child: Text(
                      "头像",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "用户昵称",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Color.fromRGBO(51, 51, 51, 1)),
                      ),
                      Text(
                        "180****7654",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Color.fromRGBO(153, 153, 153, 1)),
                      )
                    ],
                  ),
                  Expanded(
                    child: Image.asset(
                      "images/icon/right_icon.png",
                      alignment: Alignment.centerRight,
                      width: ScreenUtil().setWidth(6),
                      height: ScreenUtil().setWidth(11),
                    ),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Routes.router.navigateTo(context, "/myAddressPage");
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(
                            color: Color.fromRGBO(231, 231, 231, 1)))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10),
                      vertical: ScreenUtil().setWidth(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "我的收货地址",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(51, 51, 51, 1)),
                      ),
                      Image.asset(
                        "images/icon/right_icon.png",
                        width: ScreenUtil().setWidth(6),
                        height: ScreenUtil().setWidth(11),
                      )
                    ],
                  ),
                )),
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
                vertical: ScreenUtil().setWidth(12)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "等级",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Color.fromRGBO(51, 51, 51, 1)),
                ),
                Row(
                  children: <Widget>[
                    Image.asset(
                      "images/icon/star.png",
                      width: ScreenUtil().setWidth(15),
                      height: ScreenUtil().setWidth(14),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(3),
                    ),
                    Image.asset(
                      "images/icon/star.png",
                      width: ScreenUtil().setWidth(15),
                      height: ScreenUtil().setWidth(14),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(3),
                    ),
                    Image.asset(
                      "images/icon/star.png",
                      width: ScreenUtil().setWidth(15),
                      height: ScreenUtil().setWidth(14),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
