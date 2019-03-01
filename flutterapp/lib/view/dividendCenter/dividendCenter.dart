import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/dividendCenter/userInfo.dart';
import '../../component/dividendCenter/item.dart';

class DividendCenterPage extends StatefulWidget {
  @override
  _DividendCenterState createState() => new _DividendCenterState();
}

class _DividendCenterState extends State<DividendCenterPage> {
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
            "分红中心",
            style: TextStyle(
                fontSize: ScreenUtil().setWidth(16),
                color: Color.fromRGBO(51, 51, 51, 1)),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          new UserInfoComponent(),
          new ItemComponent(
            isTitle: true,
            data: {"name": "我的股权", "number": 12454},
          ),
          new ItemComponent(
            isTitle: false,
            data: {"name": "自有股(达到2倍出局，自动清盘)", "number": 10000},
          ),
          new ItemComponent(
            isTitle: false,
            data: {"name": "直属粉丝股", "number": 1500},
          ),
          new ItemComponent(
            isTitle: false,
            data: {"name": "直属粉丝邀请股", "number": 500},
          ),
          SizedBox(
            height: ScreenUtil().setWidth(10),
          ),
          new ItemComponent(
            isTitle: true,
            data: {"name": "未到账股权", "number": 0},
          ),
          new ItemComponent(
            isTitle: false,
            data: {"name": "直属粉丝邀请股", "number": 0},
          ),
        ],
      ),
    );
  }
}
