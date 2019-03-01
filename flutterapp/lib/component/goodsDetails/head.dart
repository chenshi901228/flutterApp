import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "￥2000",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                color: Color.fromRGBO(255, 102, 102, 1)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
                vertical: ScreenUtil().setWidth(8)),
            child: Text(
              "祖玛珑苦橙香氛 圣诞限量 100ML Jo Malone London Jo Malone London",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Color.fromRGBO(51, 51, 51, 1)),
            ),
          )
        ],
      ),
    );
  }
}
