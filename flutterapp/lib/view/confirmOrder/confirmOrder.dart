import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/confirmOrder/deliveryAddress.dart';
import '../../component/confirmOrder/goodsInfo.dart';

class ConfirmOrderPage extends StatefulWidget {
  @override
  _ConfirmOrderState createState() => new _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrderPage> {
  Map _goods = {
    "name": "祖玛珑苦橙香氛 圣诞限量 100ML Jo Malone Jo Malone London",
    "size": "100ml",
    "number": 2,
    "price": 1250,
  };
  void handle(value) {
    switch (value) {
      case "decrease":
        setState(() {
          if (_goods["number"] <= 1) {
            _goods["number"] = 1;
          } else {
            _goods["number"]--;
          }
        });
        break;
      case "increase":
        setState(() {
          _goods["number"]++;
        });
        break;
      default:
        setState(() {
          if (value == "" || int.parse(value) < 1) {
            _goods["number"] = 1;
          } else {
            _goods["number"] = int.parse(value);
          }
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setWidth(44)),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Image.asset(
                  "images/icon/backBtn_1.png",
                  width: ScreenUtil().setWidth(8),
                  height: ScreenUtil().setHeight(15),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              );
            },
          ),
          title: Text(
            "确认订单",
            style: TextStyle(
                fontSize: ScreenUtil().setWidth(16),
                color: Color.fromRGBO(51, 51, 51, 1)),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: Container(
          height: ScreenUtil().setWidth(44),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text.rich(TextSpan(
                  text: "合计金额：",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
                      color: Color.fromRGBO(155, 155, 155, 1)),
                  children: <TextSpan>[
                    TextSpan(
                        text: "￥${_goods["price"] * _goods["number"]}",
                        style:
                            TextStyle(color: Color.fromRGBO(255, 102, 102, 1)))
                  ])),
              GestureDetector(
                onTap: () {
                  print("提交订单");
                },
                child: Container(
                  width: ScreenUtil().setWidth(113),
                  height: ScreenUtil().setWidth(44),
                  color: Color.fromRGBO(74, 74, 74, 1),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                  child: Text("提交订单",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          new DeliveryAddressComponent(),
          new GoodsInfoComponent(
            data: _goods,
            onChanged: (value) {
              handle(value);
            },
          )
        ],
      ),
    );
  }
}
