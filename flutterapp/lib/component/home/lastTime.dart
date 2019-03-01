import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastTimeComponent extends StatefulWidget {
  @override
  _LastTimeState createState() => new _LastTimeState();
}

class _LastTimeState extends State<LastTimeComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(8), bottom: ScreenUtil().setHeight(5)),
      color: Color.fromRGBO(238, 238, 238, 1),
      // height: ScreenUtil().setHeight(100),
      child: Column(
        children: <Widget>[
          Text(
            "分红倒计时",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: Color.fromRGBO(155, 155, 155, 1)),
          ),
          Text(
            "02:58",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(36),
                color: Color.fromRGBO(255, 77, 0, 1)),
          ),
          Text(
            "今日交易：10000.00元",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Color.fromRGBO(255, 100, 0, 1)),
          )
        ],
      ),
    );
  }
}
