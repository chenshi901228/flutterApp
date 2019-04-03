import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AssetComponent extends StatelessWidget {
  AssetComponent({Key key, this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    Column item(String name, text) {
      return Column(
        children: <Widget>[
          Text("${text.runtimeType == int ? text.toString() + ".00" : text}",
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
          item("累计收益(元)", data["accumulatedEarnings"]),
          item("即将到账(元)", data["willget"]),
          item("账户余额(元)", data["balanceAccount"]),
        ],
      ),
    );
  }
}
