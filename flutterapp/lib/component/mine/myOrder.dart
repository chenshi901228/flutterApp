import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class MyOrderComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GestureDetector item(String img, String text, int initIndex) {
      return GestureDetector(
          onTap: () {
            Routes.router.navigateTo(context,
                "${Routes.orderPage}?initIndex=$initIndex&selfOrFans=self");
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
                  height: ScreenUtil().setWidth(7),
                ),
                Text(text,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(13),
                        color: Color.fromRGBO(77, 77, 77, 1)))
              ],
            ),
          ));
    }

    return Container(
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
      color: Colors.white,
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Routes.router.navigateTo(
                  context, "${Routes.orderPage}?initIndex=0&selfOrFans=self");
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
                        "我的订单",
                        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "查看全部",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                color: Color.fromRGBO(153, 153, 153, 1)),
                          ),
                          SizedBox(
                            width: ScreenUtil().setWidth(10),
                          ),
                          Image.asset(
                            "images/icon/right_icon.png",
                            width: ScreenUtil().setWidth(6),
                            height: ScreenUtil().setWidth(11),
                          )
                        ],
                      )
                    ],
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(14)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                item("images/icon/obligation.png", "待付款", 0),
                item("images/icon/delivery.png", "待发货", 1),
                item("images/icon/receiving.png", "待收货", 2),
                item("images/icon/complete.png", "已完成", 3),
              ],
            ),
          )
        ],
      ),
    );
  }
}
