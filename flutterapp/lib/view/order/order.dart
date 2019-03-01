import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/order/obligationTab.dart';
import '../../component/order/deliveryTab.dart';
import '../../component/order/receivingTab.dart';
import '../../component/order/completeTab.dart';

class OrderPage extends StatefulWidget {
  final int initIndex;
  final String selfOrFans;
  const OrderPage(this.initIndex, this.selfOrFans);
  @override
  _OrderState createState() => new _OrderState();
}

class _OrderState extends State<OrderPage> {
  String _selfOrFans = "self";
  void initState() {
    setState(() {
      _selfOrFans = widget.selfOrFans;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initIndex,
      length: 4,
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setWidth(90)),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
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
            centerTitle: true,
            title: Container(
              width: ScreenUtil().setWidth(176),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selfOrFans = "self";
                      });
                    },
                    child: Image.asset(
                      _selfOrFans == "self"
                          ? "images/icon/self.png"
                          : "images/icon/self_1.png",
                      width: ScreenUtil().setWidth(88),
                      height: ScreenUtil().setWidth(32),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selfOrFans = "fans";
                      });
                    },
                    child: Image.asset(
                      _selfOrFans == "fans"
                          ? "images/icon/fansbtn_1.png"
                          : "images/icon/fansbtn.png",
                      width: ScreenUtil().setWidth(88),
                      height: ScreenUtil().setWidth(32),
                    ),
                  )
                ],
              ),
            ),
            bottom: TabBar(
              indicatorWeight: ScreenUtil().setHeight(2),
              indicatorColor: Color.fromRGBO(255, 102, 102, 1),
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Color.fromRGBO(74, 74, 74, 1),
              labelColor: Color.fromRGBO(74, 74, 74, 1),
              labelStyle: TextStyle(fontSize: ScreenUtil().setSp(14)),
              tabs: <Widget>[
                Tab(
                  text: "待付款",
                ),
                Tab(
                  text: "待发货",
                ),
                Tab(
                  text: "待收货",
                ),
                Tab(
                  text: "已完成",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            new ObligationComponent(),
            new DeliveryComponent(),
            new ReceivingComponent(),
            new CompleteComponent(),
          ],
        ),
      ),
    );
  }
}
