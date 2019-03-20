import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../component/home/tabItem1.dart';

import '../../utils/routes.dart';
import '../../utils/httpRequest.dart';

class HomePage extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  Map initData = {};
  _getToken() async {
    try {
      final data = await HttpUtil().post("/init/initHomePage");
      if (data["code"] == 0) {
        showDialog<Null>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("登录失效，请重新登录"),
              );
            }).then((val) {
          Routes.router.navigateTo(context, "/login");
        });
      } else {
        setState(() {
          initData = data;
        });
      }
    } catch (err) {
      print(err);
    }
  }

  void initState() {
    _getToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(92),
            child: SafeArea(
              top: true,
              child: AppBar(
                backgroundColor: Colors.white,
                leading: Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setWidth(12),
                        bottom: ScreenUtil().setWidth(12),
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
                          BorderRadius.circular(ScreenUtil().setWidth(15)),
                      color: Color.fromRGBO(242, 242, 242, 1),
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
                                      top: ScreenUtil().setWidth(6),
                                      bottom: ScreenUtil().setWidth(6),
                                      left: ScreenUtil().setWidth(40)),
                                  border: InputBorder.none)),
                          Positioned(
                            left: ScreenUtil().setWidth(10),
                            top: ScreenUtil().setWidth(6),
                            child: Image.asset(
                              "images/icon/serch.png",
                              width: ScreenUtil().setWidth(20),
                              height: ScreenUtil().setWidth(20),
                            ),
                          )
                        ],
                      )),
                ),
                elevation: 1,
                bottom: TabBar(
                  indicatorWeight: ScreenUtil().setWidth(2),
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
            TabItem1Component(
              data: initData,
            ),
            Text("data"),
            Text("data"),
          ],
        ),
      ),
    );
  }
}
