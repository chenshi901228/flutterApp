import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class DeliveryAddressComponent extends StatefulWidget {
  @override
  _DeliveryAddressState createState() => new _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddressComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              print("定位");
            },
            child: Image.asset(
              "images/icon/position.png",
              width: ScreenUtil().setWidth(12),
              height: ScreenUtil().setWidth(18),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(300),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "收货人：某某某",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    ),
                    Text(
                      "13730602376",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Color.fromRGBO(51, 51, 51, 1)),
                    )
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(6),
                ),
                Text(
                  "收货地址：四川省成都市锦江区某某街道具体地址多少号 几单元几栋几楼",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: Color.fromRGBO(51, 51, 51, 1)),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Routes.router.navigateTo(context, "/myAddressPage");
            },
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(10),
                  top: ScreenUtil().setWidth(20),
                  bottom: ScreenUtil().setWidth(20)),
              child: Image.asset(
                "images/icon/right_icon.png",
                width: ScreenUtil().setWidth(6),
                height: ScreenUtil().setWidth(11),
              ),
            ),
          )
        ],
      ),
    );
  }
}
