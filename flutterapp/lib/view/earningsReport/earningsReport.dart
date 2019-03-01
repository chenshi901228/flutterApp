import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/earningsReport/balance.dart';
import '../../component/earningsReport/earningsIncrease.dart';
import '../../component/earningsReport/earningsToday.dart';
import '../../component/earningsReport/item.dart';

class EarningsReportPage extends StatefulWidget {
  @override
  _EarningsReportState createState() => new _EarningsReportState();
}

class _EarningsReportState extends State<EarningsReportPage> {
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
            "收益报表",
            style: TextStyle(
                fontSize: ScreenUtil().setWidth(16),
                color: Color.fromRGBO(51, 51, 51, 1)),
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          new BalanceComponent(),
          new EarningsIncreaseComponent(),
          new EarningsTodayComponent(),
          new ItemComponent(
            title: "订单结算明细",
            route: "/orderClearPage",
          ),
          new ItemComponent(
            title: "提现记录",
            route: "/withdrawalRecordPage",
          ),
        ],
      ),
    );
  }
}
