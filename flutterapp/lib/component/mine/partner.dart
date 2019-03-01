import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class PartnerComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GestureDetector item(String img, String text, String route) {
      return GestureDetector(
          onTap: () {
            Routes.router.navigateTo(context, route);
          },
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                Image.asset(
                  img,
                  width: ScreenUtil().setWidth(22),
                  height: ScreenUtil().setWidth(19),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(5),
                ),
                Text(text,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(13),
                        color: Color.fromRGBO(102, 102, 102, 1)))
              ],
            ),
          ));
    }

    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
            decoration: BoxDecoration(
                border: Border(
                    bottom:
                        BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
            child: Text(
              "合伙人中心",
              style: TextStyle(fontSize: ScreenUtil().setSp(15)),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(14)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                item("images/icon/rule.png", "收益报表", "/earningsReportPage"),
                item("images/icon/fans.png", "我的粉丝", "/myFansPage"),
                item("images/icon/order.png", "粉丝订单",
                    "${Routes.orderPage}?initIndex=0&selfOrFans=fans")
              ],
            ),
          )
        ],
      ),
    );
  }
}
