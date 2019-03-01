import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressState createState() => new _AddAddressState();
}

class _AddAddressState extends State<AddAddressPage> {
  bool _value = true;
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
            "添加收货地址",
            style: TextStyle(
                fontSize: ScreenUtil().setWidth(16),
                color: Color.fromRGBO(51, 51, 51, 1)),
          ),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  print("保存");
                },
                child: Text(
                  "保存",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: Color.fromRGBO(255, 102, 102, 1)),
                ),
              ),
            )
          ],
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
                vertical: ScreenUtil().setWidth(12)),
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom:
                        BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
            child: Text(
              "收货人",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Color.fromRGBO(51, 51, 51, 1)),
            ),
          ),
          GestureDetector(
              onTap: () {
                Routes.router.navigateTo(context, "/myAddressPage");
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setWidth(12)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(242, 243, 242, 1)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "手机号码",
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
          GestureDetector(
              onTap: () {
                Routes.router.navigateTo(context, "/myAddressPage");
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(10),
                    vertical: ScreenUtil().setWidth(12)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(242, 243, 242, 1)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "所在地区",
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
          Container(
            color: Colors.white,
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setWidth(19),
                      horizontal: ScreenUtil().setWidth(10)),
                  border: InputBorder.none,
                  hintText: "填写详细地址：如道路、门牌号、小区、楼栋号、单元室等",
                  hintStyle: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: Color.fromRGBO(153, 153, 153, 1))),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "设为默认地址",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Color.fromRGBO(51, 51, 51, 1)),
                ),
                Switch(
                  value: _value,
                  inactiveTrackColor: Color.fromRGBO(201, 201, 201, 1),
                  activeColor: Colors.white,
                  activeTrackColor: Color.fromRGBO(77, 191, 52, 1),
                  onChanged: (newValue) {
                    setState(() {
                      _value = newValue;
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
