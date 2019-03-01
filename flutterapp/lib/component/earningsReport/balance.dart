import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/routes.dart';

class BalanceComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  fontSize: ScreenUtil().setSp(30), color: Colors.white)),
          GestureDetector(
            onTap: () {
              Routes.router.navigateTo(context, "/balanceOfAccountPage");
            },
            child: Container(
              margin: EdgeInsets.only(top: ScreenUtil().setWidth(12)),
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(17),
                  vertical: ScreenUtil().setWidth(3)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(12))),
              child: Text("立即提现",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: Color.fromRGBO(255, 102, 102, 1))),
            ),
          )
        ],
      ),
    );
  }
}
