import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyFansPage extends StatefulWidget {
  @override
  _MyFansState createState() => new _MyFansState();
}

class _MyFansState extends State<MyFansPage> {
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
            "我的粉丝",
            style: TextStyle(
                fontSize: ScreenUtil().setWidth(16),
                color: Color.fromRGBO(51, 51, 51, 1)),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: ScreenUtil().setWidth(150),
            color: Color.fromRGBO(155, 155, 155, 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("总人数(人)",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14), color: Colors.white)),
                SizedBox(
                  height: ScreenUtil().setWidth(14),
                ),
                Text("0",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(30), color: Colors.white))
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(14)),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            right: BorderSide(
                                color: Color.fromRGBO(242, 243, 242, 1)))),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "直属粉丝",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(13),
                              color: Color.fromRGBO(102, 102, 102, 1)),
                        ),
                        SizedBox(
                          height: ScreenUtil().setWidth(5),
                        ),
                        Text(
                          "0人",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: Color.fromRGBO(102, 102, 102, 1)),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "直属粉丝邀请",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Color.fromRGBO(102, 102, 102, 1)),
                      ),
                      SizedBox(
                        height: ScreenUtil().setWidth(5),
                      ),
                      Text(
                        "0人",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: Color.fromRGBO(102, 102, 102, 1)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
