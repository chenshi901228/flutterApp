import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/store/head.dart';
import '../../component/classify/tab_item.dart';

class StorePage extends StatefulWidget {
  @override
  _ClassIfyState createState() => new _ClassIfyState();
}

class _ClassIfyState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Scaffold(
        backgroundColor: Color.fromRGBO(241, 241, 241, 1),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(44),
            child: SafeArea(
              top: true,
              child: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                title: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          color: Colors.transparent,
                          height: ScreenUtil().setWidth(28),
                          padding:
                              EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                          child: Image.asset(
                            "images/icon/backBtn_1.png",
                            width: ScreenUtil().setWidth(8),
                            height: ScreenUtil().setHeight(15),
                          ),
                        )),
                    Container(
                      width: ScreenUtil().setWidth(295),
                      child: Material(
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().setWidth(15)),
                          color: Color.fromRGBO(220, 220, 220, 1),
                          child: Stack(
                            children: <Widget>[
                              TextField(
                                  style: TextStyle(
                                      color: Color.fromRGBO(155, 155, 155, 1)),
                                  decoration: InputDecoration(
                                      hintText: "搜你喜欢的",
                                      hintStyle: TextStyle(
                                          fontSize: ScreenUtil().setSp(12),
                                          color:
                                              Color.fromRGBO(155, 155, 155, 1)),
                                      contentPadding: EdgeInsets.only(
                                          top: ScreenUtil().setHeight(4),
                                          bottom: ScreenUtil().setHeight(4),
                                          left: ScreenUtil().setHeight(40)),
                                      border: InputBorder.none)),
                              Positioned(
                                left: ScreenUtil().setWidth(10),
                                top: ScreenUtil().setHeight(6),
                                child: Image.asset(
                                  "images/icon/serch.png",
                                  width: ScreenUtil().setWidth(18),
                                  height: ScreenUtil().setHeight(18),
                                ),
                              )
                            ],
                          )),
                    )
                  ],
                ),
                elevation: 1,
              ),
            )),
        body: ListView(
          children: <Widget>[
            new HeadComponent(),
            Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(7)),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: ScreenUtil().setWidth(7),
                children: <Widget>[
                  new TabItemComponent(
                    name: "祖玛珑香氛蜡烛",
                  ),
                  new TabItemComponent(
                    name:
                        "祖玛珑乌木与佛手柑香水男士 100ML Jo Malone London祖玛珑乌木与佛手柑香水男士 100ML Jo Malone London  ",
                  ),
                  new TabItemComponent(
                    name: "祖玛珑限量金装英国梨与小苍 兰香水100ML",
                  ),
                  new TabItemComponent(
                    name: "祖玛珑沐浴露250ML系列 蓝 风铃 Jo Malone London ",
                  ),
                  new TabItemComponent(
                    name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
                  ),
                  new TabItemComponent(
                    name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
                  ),
                  new TabItemComponent(
                    name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
                  ),
                  new TabItemComponent(
                    name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
                  ),
                  new TabItemComponent(
                    name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
                  ),
                  new TabItemComponent(
                    name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
