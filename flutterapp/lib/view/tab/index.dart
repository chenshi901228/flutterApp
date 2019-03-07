import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../utils/routes.dart';

import './home.dart';
import './shopping_cart.dart';
import './mine.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexState createState() => new _IndexState();
}

class _IndexState extends State<IndexPage> {
  int _tabIndex = 0;
  List _renderItem = [new HomePage(), new ShoppingCartPage(), new MinePage()];
  _verifyToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String token = preferences.getString("token");
    try {
      final data = await http.Client().post(
          "http://192.168.56.1:3000/init/initHomePage",
          headers: {"Authorization": "Bearer " + token}).then((res) {
        return json.decode(res.body);
      });
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
        print(data);
      }
    } catch (err) {}
  }

  void initState() {
    _verifyToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);

    // 底部导航按钮
    FlatButton bottomButton(String img, String text, int index, Color color) {
      return FlatButton(
        onPressed: () {
          setState(() {
            _tabIndex = index;
          });
        },
        shape: CircleBorder(),
        padding: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              img,
              width: ScreenUtil().setWidth(21),
              height: ScreenUtil().setWidth(21),
            ),
            Text(
              text,
              style: TextStyle(fontSize: ScreenUtil().setSp(12), color: color),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: Color.fromRGBO(241, 241, 241, 1),
        resizeToAvoidBottomPadding: false,
        body: _renderItem[_tabIndex],
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(40)),
            height: ScreenUtil().setWidth(49),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _tabIndex == 0
                    ? bottomButton("images/icon/home.png", "首页", 0,
                        Color.fromRGBO(74, 74, 74, 1))
                    : bottomButton("images/icon/home_1.png", "首页", 0,
                        Color.fromRGBO(155, 155, 155, 1)),
                _tabIndex == 1
                    ? bottomButton("images/icon/shopping.png", "购物车", 1,
                        Color.fromRGBO(74, 74, 74, 1))
                    : bottomButton("images/icon/shopping_1.png", "购物车", 1,
                        Color.fromRGBO(155, 155, 155, 1)),
                _tabIndex == 2
                    ? bottomButton("images/icon/mine.png", "我的", 2,
                        Color.fromRGBO(74, 74, 74, 1))
                    : bottomButton("images/icon/mine_1.png", "我的", 2,
                        Color.fromRGBO(155, 155, 155, 1)),
              ],
            ),
          ),
        ));
  }
}
