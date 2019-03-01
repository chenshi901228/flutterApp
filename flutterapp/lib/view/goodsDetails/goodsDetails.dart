import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/routes.dart';

import '../../component/goodsDetails/swiper.dart';
import '../../component/goodsDetails/head.dart';
import '../../component/goodsDetails/sale.dart';
import '../../component/goodsDetails/store.dart';

class GoodsDetailsPage extends StatefulWidget {
  @override
  _GoodsDetailsState createState() => new _GoodsDetailsState();
}

class _GoodsDetailsState extends State<GoodsDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isHideBanner = false;
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 270) {
        setState(() {
          _isHideBanner = true;
        });
      } else {
        setState(() {
          _isHideBanner = false;
        });
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: ScreenUtil().setWidth(48),
          padding: EdgeInsets.only(right: ScreenUtil().setWidth(4)),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Routes.router.navigateTo(context, "/confirmOrderPage");
                },
                child: Image.asset(
                  "images/icon/addShopping.png",
                  width: ScreenUtil().setWidth(104),
                  height: ScreenUtil().setWidth(38),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Routes.router.navigateTo(context, "/confirmOrderPage");
                },
                child: Image.asset(
                  "images/icon/nowBuy.png",
                  width: ScreenUtil().setWidth(104),
                  height: ScreenUtil().setWidth(38),
                ),
              )
            ],
          ),
        ),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            elevation: 1,
            title: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _isHideBanner ? 1 : 0,
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(6)),
                child: Image.asset("images/banner.jpg"),
              ),
            ),
            centerTitle: true,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Image.asset(
                    "images/icon/back.png",
                    width: ScreenUtil().setWidth(30),
                    height: ScreenUtil().setWidth(30),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Image.asset(
                  "images/icon/share.png",
                  width: ScreenUtil().setWidth(30),
                  height: ScreenUtil().setWidth(30),
                ),
                onPressed: () {
                  print("分享");
                },
              )
            ],
            backgroundColor: Colors.white,
            expandedHeight: ScreenUtil().setHeight(360),
            flexibleSpace: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _isHideBanner ? 0 : 1,
              child: SwiperComponent(),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              new HeadComponent(),
              new SaleComponent(),
              new StoreComponent(),
              Image.asset("images/goodsDetails.jpg"),
              Image.asset("images/goodsDetails1.jpg"),
            ]),
          ),
        ],
      ),
    );
  }
}
