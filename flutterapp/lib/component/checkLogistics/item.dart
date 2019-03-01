import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(3))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
                vertical: ScreenUtil().setWidth(12)),
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
            child: Row(
              children: <Widget>[
                Container(
                  width: ScreenUtil().setWidth(40),
                  height: ScreenUtil().setWidth(40),
                  margin: EdgeInsets.only(right: ScreenUtil().setWidth(14)),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(74, 74, 74, 1),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    "申通",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(12), color: Colors.white),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("申通快递",
                          style: TextStyle(
                              fontSize: ScreenUtil().setWidth(13),
                              color: Color.fromRGBO(51, 51, 51, 1))),
                      Text(
                        "官方电话：95543",
                        style: TextStyle(
                            fontSize: ScreenUtil().setWidth(12),
                            color: Color.fromRGBO(163, 163, 163, 1)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
                vertical: ScreenUtil().setWidth(8)),
            child: Text(
              "申通快递：807363552908",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(13),
                  color: Color.fromRGBO(51, 51, 51, 1)),
            ),
          )
        ],
      ),
    );
  }
}
