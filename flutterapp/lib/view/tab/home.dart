import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/event_bus.dart';
import '../../type/goTop.dart';

import '../../component/home/tabItem1.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomePage> {
  void initState() {
    eventBus.on<GoTop>().listen((e) {
      setState(() {
        topButton = e.goTop;
      });
    });
    super.initState();
  }

  bool topButton = true;
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: Offstage(
            offstage: topButton,
            child: GestureDetector(
              onTap: () {
                eventBus.fire(HandleTop());
              },
              child: Image.asset(
                "images/icon/TOP.png",
                width: ScreenUtil().setWidth(32),
                height: ScreenUtil().setWidth(32),
              ),
            )),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(92),
            child: SafeArea(
              top: true,
              child: AppBar(
                backgroundColor: Colors.white,
                leading: Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(12),
                        bottom: ScreenUtil().setHeight(12),
                        left: ScreenUtil().setWidth(10)),
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "成都",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(15),
                            color: Color.fromRGBO(155, 155, 155, 1)),
                      ),
                    )),
                title: Container(
                  width: ScreenUtil().setWidth(300),
                  child: Material(
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setHeight(15)),
                      color: Color.fromRGBO(155, 155, 155, 0.5),
                      child: Stack(
                        children: <Widget>[
                          TextField(
                              style: TextStyle(
                                  color: Color.fromRGBO(155, 155, 155, 1)),
                              decoration: InputDecoration(
                                  hintText: "搜你喜欢的",
                                  hintStyle: TextStyle(
                                      fontSize: ScreenUtil().setSp(12),
                                      color: Color.fromRGBO(155, 155, 155, 1)),
                                  contentPadding: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(6),
                                      bottom: ScreenUtil().setHeight(6),
                                      left: ScreenUtil().setHeight(40)),
                                  border: InputBorder.none)),
                          Positioned(
                            left: ScreenUtil().setWidth(10),
                            top: ScreenUtil().setHeight(6),
                            child: Image.asset(
                              "images/icon/serch.png",
                              width: ScreenUtil().setWidth(20),
                              height: ScreenUtil().setHeight(20),
                            ),
                          )
                        ],
                      )),
                ),
                elevation: 1,
                bottom: TabBar(
                  indicatorWeight: ScreenUtil().setHeight(2),
                  indicatorColor: Color.fromRGBO(255, 77, 0, 1),
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.black,
                  labelColor: Color.fromRGBO(255, 77, 0, 1),
                  labelStyle: TextStyle(fontSize: ScreenUtil().setSp(14)),
                  tabs: <Widget>[
                    Tab(
                      text: "20%分红",
                    ),
                    Tab(
                      text: "30%分红",
                    ),
                    Tab(
                      text: "40%分红",
                    )
                  ],
                ),
              ),
            )),
        body: TabBarView(
          children: <Widget>[
            new TabItem1Component(),
            Text("选项卡2"),
            Text("选项卡3"),
          ],
        ),
      ),
    );
  }
}
