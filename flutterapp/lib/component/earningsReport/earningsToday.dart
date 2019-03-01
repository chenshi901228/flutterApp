import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './alertModal.dart';

class EarningsTodayComponent extends StatefulWidget {
  @override
  _EarningsTodayState createState() => new _EarningsTodayState();
}

class _EarningsTodayState extends State<EarningsTodayComponent> {
  void alertModal(type) {
    showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return new AlertModalComponent(
            type: type,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(10),
                  vertical: ScreenUtil().setWidth(12)),
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                          BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
              child: Text("今日收益",
                  style: TextStyle(fontSize: ScreenUtil().setSp(14))),
            ),
            Container(
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(14)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Color.fromRGBO(242, 243, 242, 1)))),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "股权收益(元)",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(13),
                                    color: Color.fromRGBO(102, 102, 102, 1)),
                              ),
                              SizedBox(
                                width: ScreenUtil().setWidth(2),
                              ),
                              GestureDetector(
                                onTap: () {
                                  alertModal("股权收益");
                                },
                                child: Image.asset(
                                  "images/icon/questions.png",
                                  width: ScreenUtil().setWidth(12),
                                  height: ScreenUtil().setWidth(13),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: ScreenUtil().setWidth(5),
                          ),
                          Text(
                            "0.00",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(15),
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "现金奖励(元)",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(13),
                                  color: Color.fromRGBO(102, 102, 102, 1)),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(2),
                            ),
                            GestureDetector(
                              onTap: () {
                                alertModal("现金奖励");
                              },
                              child: Image.asset(
                                "images/icon/questions.png",
                                width: ScreenUtil().setWidth(12),
                                height: ScreenUtil().setWidth(13),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: ScreenUtil().setWidth(5),
                        ),
                        Text(
                          "0.00",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: Color.fromRGBO(102, 102, 102, 1)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
