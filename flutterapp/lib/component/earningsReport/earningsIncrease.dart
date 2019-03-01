import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './alertModal.dart';

class EarningsIncreaseComponent extends StatefulWidget {
  @override
  _EarningsIncreaseState createState() => new _EarningsIncreaseState();
}

class _EarningsIncreaseState extends State<EarningsIncreaseComponent> {
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
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(14)),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border(
                      right:
                          BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "累计股权收益",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(13),
                            color: Color.fromRGBO(102, 102, 102, 1)),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(2),
                      ),
                      GestureDetector(
                        onTap: () {
                          alertModal("累计股权收益");
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
                    "3682元",
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
                      "累计现金奖励",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(2),
                    ),
                    GestureDetector(
                      onTap: () {
                        alertModal("累计现金奖励");
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
                  "1000元",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(15),
                      color: Color.fromRGBO(102, 102, 102, 1)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
