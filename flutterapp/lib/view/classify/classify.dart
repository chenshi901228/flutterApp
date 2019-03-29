import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:convert';
import '../../blocs/main_bloc.dart';

import '../../component/classify/tab_default.dart';

bool initClassify = true;

class ClassIfyPage extends StatefulWidget {
  final String title;
  const ClassIfyPage(this.title);
  @override
  _ClassIfyState createState() => new _ClassIfyState();
}

class _ClassIfyState extends State<ClassIfyPage> {
  void dispose() {
    super.dispose();
    initClassify = true;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProviderMain.of(context);

    ///字符串解码
    var list = List<int>();
    jsonDecode(widget.title).forEach(list.add);
    final String classify = Utf8Decoder().convert(list);
    if (initClassify) {
      initClassify = false;
      bloc.initClassify(classify);
    }
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(241, 241, 241, 1),
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(92),
            child: SafeArea(
              top: true,
              child: AppBar(
                backgroundColor: Colors.white,
                automaticallyImplyLeading: false,
                // leading: Builder(
                //   builder: (BuildContext context) {
                //     return IconButton(
                //       icon: Image.asset(
                //         "images/icon/backBtn_1.png",
                //         width: ScreenUtil().setWidth(8),
                //         height: ScreenUtil().setHeight(15),
                //       ),
                //       onPressed: () {
                //         Navigator.pop(context);
                //       },
                //     );
                //   },
                // ),

                // centerTitle: true,
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
                              EdgeInsets.only(right: ScreenUtil().setWidth(15)),
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
                bottom: TabBar(
                  indicatorWeight: ScreenUtil().setHeight(2),
                  indicatorColor: Color.fromRGBO(255, 102, 102, 1),
                  indicatorSize: TabBarIndicatorSize.label,
                  unselectedLabelColor: Colors.black,
                  labelColor: Color.fromRGBO(51, 51, 51, 1),
                  labelStyle: TextStyle(fontSize: ScreenUtil().setSp(14)),
                  tabs: <Widget>[
                    Tab(
                      text: "默认",
                    ),
                    Tab(
                      text: "销量",
                    ),
                    Tab(
                      text: "价格",
                    )
                  ],
                ),
              ),
            )),
        body: TabBarView(
          children: <Widget>[
            new TabDefaultComponent(),
            Text("选项卡2"),
            Text("选项卡3"),
          ],
        ),
      ),
    );
  }
}
