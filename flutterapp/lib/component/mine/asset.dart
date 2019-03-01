import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Column item(String name) {
      return Column(
        children: <Widget>[
          Text("0.00",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Color.fromRGBO(255, 102, 102, 1))),
          Text(name,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(13),
                  color: Color.fromRGBO(102, 102, 102, 1)))
        ],
      );
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(17)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          item("累计收益(元)"),
          item("即将到账(元)"),
          item("账户余额(元)"),
        ],
      ),
    );
  }
}
