import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class ReceivingItem extends StatefulWidget {
  ReceivingItem({Key key, this.data}) : super(key: key);
  final data;
  @override
  _ReceivingItemState createState() => new _ReceivingItemState();
}

class _ReceivingItemState extends State<ReceivingItem> {
  void confirmGet() {
    showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.all(0),
              content: Container(
                height: ScreenUtil().setWidth(117),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: ScreenUtil().setWidth(68),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: ScreenUtil().setWidth(1),
                                  color: Color.fromRGBO(242, 242, 242, 1)))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "确认收货吗？",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          ),
                          Text(
                            "确认之后才能结算股权及分红哦",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                color: Color.fromRGBO(153, 153, 153, 1)),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: ScreenUtil().setWidth(48),
                                  alignment: Alignment.center,
                                  color: Colors.transparent,
                                  child: Text(
                                    "取消",
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                        color:
                                            Color.fromRGBO(102, 102, 102, 1)),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                          Expanded(
                            child: GestureDetector(
                                onTap: () {
                                  // deletemany();
                                },
                                child: Container(
                                  height: ScreenUtil().setWidth(48),
                                  alignment: Alignment.center,
                                  color: Colors.transparent,
                                  child: Text(
                                    "确认",
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(14),
                                        color: Color.fromRGBO(255, 89, 89, 1)),
                                    textAlign: TextAlign.center,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    final _this = widget.data;
    return Container(
        color: Colors.white,
        margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  _this["img"],
                  width: ScreenUtil().setWidth(90),
                  height: ScreenUtil().setWidth(90),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Expanded(
                    child: Container(
                  height: ScreenUtil().setWidth(90),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _this["name"],
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setWidth(12),
                                    color: Color.fromRGBO(51, 51, 51, 1)),
                              ),
                              Text(
                                _this["size"],
                                style: TextStyle(
                                    fontSize: ScreenUtil().setWidth(12),
                                    color: Color.fromRGBO(155, 155, 155, 1)),
                              )
                            ],
                          )),
                          SizedBox(
                            width: ScreenUtil().setWidth(20),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "卖家已发货",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setWidth(12),
                                    color: Color.fromRGBO(255, 85, 85, 1)),
                              ),
                              SizedBox(
                                height: ScreenUtil().setWidth(2),
                              ),
                              Text(
                                "¥${_this["price"].runtimeType == int ? _this["price"].toString() + '.00' : _this["price"]} x${_this["number"]}",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setWidth(11),
                                    color: Color.fromRGBO(153, 153, 153, 1)),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text.rich(TextSpan(
                          text: "共计${_this["number"]}件商品   ",
                          style: TextStyle(
                              fontSize: ScreenUtil().setWidth(12),
                              color: Color.fromRGBO(153, 153, 153, 1)),
                          children: <TextSpan>[
                            TextSpan(
                              text:
                                  "合计：¥${(_this["price"] * _this["number"]).runtimeType == int ? (_this["price"] * _this["number"]).toString() + '.00' : (_this["price"] * _this["number"])}",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setWidth(12),
                                  color: Color.fromRGBO(102, 102, 102, 1)),
                            )
                          ]))
                    ],
                  ),
                ))
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Routes.router.navigateTo(context, "/checkLogisticsPage");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(12),
                        vertical: ScreenUtil().setWidth(2)),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(11)),
                        border: Border.all(
                            color: Color.fromRGBO(205, 205, 205, 1))),
                    child: Text(
                      "查看物流",
                      style: TextStyle(
                          fontSize: ScreenUtil().setWidth(12),
                          color: Color.fromRGBO(153, 153, 153, 1)),
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                GestureDetector(
                  onTap: () {
                    confirmGet();
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(12),
                        vertical: ScreenUtil().setWidth(2)),
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(11)),
                        border:
                            Border.all(color: Color.fromRGBO(255, 85, 85, 1))),
                    child: Text(
                      "确认收货",
                      style: TextStyle(
                          fontSize: ScreenUtil().setWidth(12),
                          color: Color.fromRGBO(255, 85, 85, 1)),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
