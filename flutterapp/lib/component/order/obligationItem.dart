import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ObligationItem extends StatefulWidget {
  ObligationItem({Key key, this.data, this.onChanged}) : super(key: key);
  final data;
  final onChanged;
  @override
  _ObligationItemState createState() => new _ObligationItemState();
}

class _ObligationItemState extends State<ObligationItem> {
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
                GestureDetector(
                  onTap: () {
                    widget.onChanged();
                  },
                  child: Image.asset(
                    _this["select"]
                        ? "images/icon/isactive.png"
                        : "images/icon/noactive.png",
                    width: ScreenUtil().setWidth(15),
                    height: ScreenUtil().setWidth(15),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "等待付款",
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
            GestureDetector(
              onTap: () {
                print("付款");
              },
              child: Container(
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(24),
                    vertical: ScreenUtil().setWidth(2)),
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(11)),
                    border:
                        Border.all(color: Color.fromRGBO(205, 205, 205, 1))),
                child: Text(
                  "付款",
                  style: TextStyle(
                      fontSize: ScreenUtil().setWidth(12),
                      color: Color.fromRGBO(153, 153, 153, 1)),
                ),
              ),
            )
          ],
        ));
  }
}
