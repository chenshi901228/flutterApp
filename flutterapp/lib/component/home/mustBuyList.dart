import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class MustBuyComponent extends StatefulWidget {
  @override
  _MustBuyState createState() => new _MustBuyState();
}

class _MustBuyState extends State<MustBuyComponent> {
  final List goodsList = [];
  @override
  Widget build(BuildContext context) {
    GestureDetector item() {
      return GestureDetector(
        onTap: () {
          Routes.router.navigateTo(context, "/goodsDetailsPage");
        },
        child: Container(
          width: ScreenUtil().setWidth(245),
          // height: ScreenUtil().setWidth(103),
          margin: EdgeInsets.only(right: ScreenUtil().setWidth(8)),
          padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(2))),
          child: Row(
            children: <Widget>[
              Image.asset(
                "images/goodsDetails.jpg",
                width: ScreenUtil().setWidth(65),
                height: ScreenUtil().setWidth(83),
                // fit: BoxFit.fill,
              ),
              Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                  child: Container(
                      width: ScreenUtil().setWidth(150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "韩国进口蒂佳婷面膜水动力Dr.Jart+ 5片/盒（默认）韩国进口蒂佳婷面膜水动力Dr.Jart+ 5片/盒（默认）",
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                color: Color.fromRGBO(51, 51, 51, 1)),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(53),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(255, 85, 85, 1)),
                                borderRadius: BorderRadius.circular(
                                    ScreenUtil().setWidth(2))),
                            child: Text(
                              "今日特价",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Color.fromRGBO(255, 85, 85, 1)),
                            ),
                          ),
                          Text(
                            "￥119.00",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                color: Color.fromRGBO(255, 102, 102, 1)),
                          )
                        ],
                      )))
            ],
          ),
        ),
      );
    }

    return Container(
      color: Color.fromRGBO(209, 209, 209, 1),
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      height: ScreenUtil().setWidth(158),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
            child: Text("必买好货",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14), color: Colors.black)),
          ),
          Expanded(
              child: Container(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                item(),
                item(),
                item(),
                item(),
                item(),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
