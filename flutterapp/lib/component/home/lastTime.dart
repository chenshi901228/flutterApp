import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LastTimeComponent extends StatefulWidget {
  @override
  _LastTimeState createState() => new _LastTimeState();
}

class _LastTimeState extends State<LastTimeComponent> {
  var timer;
  var lastTimeShow;
  DateTime lastTime = DateTime.parse("2019-03-04 15:00:00");

  void initState() {
    setState(() {
      if (lastTime.isAfter(DateTime.now())) {
        lastTimeShow = lastTime.difference(DateTime.now()).toString().substring(
            0, lastTime.difference(DateTime.now()).toString().indexOf("."));
        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          setState(() {
            lastTimeShow = lastTime
                .difference(DateTime.now())
                .toString()
                .substring(
                    0,
                    lastTime
                        .difference(DateTime.now())
                        .toString()
                        .indexOf("."));
          });
        });
      } else {
        lastTimeShow = "00:00:00";
      }
    });
    super.initState();
  }

  void dispose() {
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: ScreenUtil().setWidth(8), bottom: ScreenUtil().setWidth(5)),
      color: Color.fromRGBO(238, 238, 238, 1),
      // height: ScreenUtil().setWidth(100),
      child: Column(
        children: <Widget>[
          Text(
            "分红倒计时",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: Color.fromRGBO(155, 155, 155, 1)),
          ),
          Text(
            lastTimeShow.toString(),
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
