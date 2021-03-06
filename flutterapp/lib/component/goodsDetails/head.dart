import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadComponent extends StatelessWidget {
  HeadComponent({Key key, this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            "￥${data["price"] ?? 0.00}",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                color: Color.fromRGBO(255, 102, 102, 1)),
          ),
          Container(
            height: ScreenUtil().setWidth(40),
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
            child: Text(
              data["goodsName"] ?? "",
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
