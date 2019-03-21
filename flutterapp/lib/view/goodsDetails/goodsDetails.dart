import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../utils/routes.dart';
import '../../utils/httpRequest.dart';

import '../../component/goodsDetails/swiper.dart';
import '../../component/goodsDetails/head.dart';
import '../../component/goodsDetails/sale.dart';
import '../../component/goodsDetails/store.dart';

class GoodsDetailsPage extends StatefulWidget {
  final int goodsId;
  const GoodsDetailsPage(this.goodsId);
  @override
  _GoodsDetailsState createState() => new _GoodsDetailsState();
}

class _GoodsDetailsState extends State<GoodsDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isHideBanner = false;
  Map data = {};

  getGoodsDetails() async {
    final goodsId = widget.goodsId;
    try {
      final res =
          await HttpUtil().post("/goods/getOne", params: {"id": goodsId});
      if (res["code"] == 1) {
        setState(() {
          data = res["goodsDetails"];
        });
      } else {
        showDialog<Null>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("登录失效，请重新登录"),
              );
            }).then((val) {
          Routes.router.navigateTo(context, "/login");
        });
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    super.initState();
    getGoodsDetails();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 270.0) {
        setState(() {
          _isHideBanner = true;
        });
      } else {
        setState(() {
          _isHideBanner = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
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
                  Fluttertoast.showToast(
                      msg: "添加成功，在购物车等您~",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIos: 1,
                      backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
                      textColor: Colors.white,
                      fontSize: ScreenUtil().setSp(12));
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
                child: Image.network(data["goodsimgs"] != null
                    ? data["goodsimgs"][0]
                    : 'http://192.168.56.1:3001/1552615794803-TB2EN44z1uSBuNjSsziXXbq8pXa_!!47839804.jpg'),
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
              child: SwiperComponent(
                data: data["goodsimgs"],
                swiperLength: data["goodsimgs"]?.length,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              new HeadComponent(
                data: {"price": data["price"], "goodsName": data["goodsName"]},
              ),
              new SaleComponent(),
              new StoreComponent(
                data: data,
              ),
              data["goodsimgs"] != null
                  ? Column(
                      children: data["goodsimgs"].map<Widget>((f) {
                        return Image.network(f);
                      }).toList(),
                    )
                  : SizedBox()
            ]),
          ),
        ],
      ),
    );
  }
}
