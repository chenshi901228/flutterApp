import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/routes.dart';

class PersonalDataPage extends StatefulWidget {
  @override
  _PersonalDataState createState() => new _PersonalDataState();
}

class _PersonalDataState extends State<PersonalDataPage> {
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
            "个人资料",
            style: TextStyle(
                fontSize: ScreenUtil().setWidth(16),
                color: Color.fromRGBO(51, 51, 51, 1)),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("选择头像");
            },
            child: Container(
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setWidth(12),
                  bottom: ScreenUtil().setWidth(12)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top:
                          BorderSide(color: Color.fromRGBO(231, 231, 231, 1)))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "头像",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: Color.fromRGBO(51, 51, 51, 1)),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: ScreenUtil().setWidth(50),
                        height: ScreenUtil().setWidth(50),
                        margin:
                            EdgeInsets.only(right: ScreenUtil().setWidth(24)),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(216, 216, 216, 1),
                            borderRadius: BorderRadius.circular(100)),
                        child: Text(
                          "头像",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              color: Color.fromRGBO(102, 102, 102, 1)),
                        ),
                      ),
                      Image.asset(
                        "images/icon/right_icon.png",
                        alignment: Alignment.centerRight,
                        width: ScreenUtil().setWidth(6),
                        height: ScreenUtil().setWidth(11),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top:
                          BorderSide(color: Color.fromRGBO(231, 231, 231, 1)))),
              child: Padding(
                padding: EdgeInsets.only(
                    right: ScreenUtil().setWidth(10),
                    left: ScreenUtil().setWidth(20),
                    top: ScreenUtil().setWidth(12),
                    bottom: ScreenUtil().setWidth(12)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "用户名",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                    Text(
                      "180****7654",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                  ],
                ),
              )),
          GestureDetector(
            onTap: () {
              Routes.router.navigateTo(context, "/modifyNicknamePage");
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        top: BorderSide(
                            color: Color.fromRGBO(231, 231, 231, 1)))),
                child: Padding(
                  padding: EdgeInsets.only(
                      right: ScreenUtil().setWidth(10),
                      left: ScreenUtil().setWidth(20),
                      top: ScreenUtil().setWidth(12),
                      bottom: ScreenUtil().setWidth(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "昵称",
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
        ],
      ),
    );
  }
}
