import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class DividendComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Routes.router.navigateTo(context, "/dividendCenterPage");
            },
            child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: Color.fromRGBO(242, 243, 242, 1)))),
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "分红中心",
                        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                      ),
                      Image.asset(
                        "images/icon/right_icon.png",
                        width: ScreenUtil().setWidth(6),
                        height: ScreenUtil().setWidth(11),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
