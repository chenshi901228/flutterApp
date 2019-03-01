import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BalanceOfAccountPagePage extends StatefulWidget {
  @override
  BalanceOfAccountPageState createState() => new BalanceOfAccountPageState();
}

class BalanceOfAccountPageState extends State<BalanceOfAccountPagePage> {
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
              "账户余额",
              style: TextStyle(
                  fontSize: ScreenUtil().setWidth(16),
                  color: Color.fromRGBO(51, 51, 51, 1)),
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: ScreenUtil().setWidth(122),
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(30)),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      bottom:
                          BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setWidth(20),
                        bottom: ScreenUtil().setWidth(16)),
                    child: Text("账户余额(元)",
                        style: TextStyle(fontSize: ScreenUtil().setSp(15))),
                  ),
                  Text(
                    "4690",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(24),
                        color: Color.fromRGBO(255, 102, 102, 1)),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: ScreenUtil().setWidth(12)),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: Color.fromRGBO(242, 243, 242, 1)))),
                      child: Column(
                        children: <Widget>[
                          Text(
                            "2690",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                color: Color.fromRGBO(255, 102, 102, 1)),
                          ),
                          Text(
                            "股份收益(元)",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(13),
                                color: Color.fromRGBO(153, 153, 153, 1)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          "1000",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Color.fromRGBO(255, 102, 102, 1)),
                        ),
                        Text(
                          "现金奖励(元)",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(13),
                              color: Color.fromRGBO(153, 153, 153, 1)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print("我要提取BTN");
              },
              child: Container(
                margin: EdgeInsets.only(
                    left: ScreenUtil().setWidth(25),
                    right: ScreenUtil().setWidth(25),
                    top: ScreenUtil().setWidth(10),
                    bottom: ScreenUtil().setWidth(5)),
                alignment: Alignment.center,
                padding:
                    EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
                decoration: BoxDecoration(
                    color: Color.fromRGBO(74, 74, 74, 1),
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(25))),
                child: Text("我要提取",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14), color: Colors.white)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(45)),
              child: Text("注意：最低提取金额为100元。",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: Color.fromRGBO(155, 155, 155, 1))),
            )
          ],
        ));
  }
}
