import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderClearPage extends StatefulWidget {
  @override
  _OrderClearState createState() => new _OrderClearState();
}

class _OrderClearState extends State<OrderClearPage> {
  final List _list = [
    {"title": "直属粉丝邀请订单", "name": "800股", "date": "2018-11-25", "money": 240},
    {
      "title": "直属粉丝订单奖励",
      "name": "1000元现金奖励",
      "date": "2018-11-22",
      "money": 1000
    },
    {"title": "直属粉丝订单", "name": "1500股", "date": "2018-11-22", "money": 450},
    {"title": "自购订单", "name": "10000股", "date": "2018-10-28", "money": 3000}
  ];
  @override
  Widget build(BuildContext context) {
    Container item(Map data) {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(10),
            vertical: ScreenUtil().setWidth(7)),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data["title"],
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Color.fromRGBO(74, 74, 74, 1)),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(3),
                ),
                Text(
                  data["name"],
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: Color.fromRGBO(153, 153, 153, 1)),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  data["date"],
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: Color.fromRGBO(153, 153, 153, 1)),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(3),
                ),
                Text(
                  "+${data["money"]}元",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Color.fromRGBO(74, 74, 74, 1)),
                )
              ],
            )
          ],
        ),
      );
    }

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
              "订单结算明细",
              style: TextStyle(
                  fontSize: ScreenUtil().setWidth(16),
                  color: Color.fromRGBO(51, 51, 51, 1)),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (context, int index) {
            if (index == 0) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setWidth(58),
                    padding: EdgeInsets.symmetric(
                        horizontal: ScreenUtil().setWidth(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("本月：",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(13),
                                color: Color.fromRGBO(102, 102, 102, 1))),
                        Text("累计收益：¥4690.00",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                color: Color.fromRGBO(153, 153, 153, 1)))
                      ],
                    ),
                  ),
                  item(_list[index])
                ],
              );
            }
            return item(_list[index]);
          },
        ));
  }
}
