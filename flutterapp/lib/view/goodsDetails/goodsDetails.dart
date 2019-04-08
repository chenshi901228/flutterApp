import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

import '../../component/goodsDetails/swiper.dart';
import '../../component/goodsDetails/head.dart';
import '../../component/goodsDetails/sale.dart';
import '../../component/goodsDetails/store.dart';

import '../../blocs/main_bloc.dart';

bool isGoodDetailsInit = true;

class GoodsDetailsPage extends StatefulWidget {
  final int goodsId;
  const GoodsDetailsPage(this.goodsId);
  @override
  _GoodsDetailsState createState() => new _GoodsDetailsState();
}

class _GoodsDetailsState extends State<GoodsDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isHideBanner = false;

  _onscrollController() {
    if (_scrollController.position.pixels > 270.0) {
      setState(() {
        _isHideBanner = true;
      });
    } else {
      setState(() {
        _isHideBanner = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onscrollController);
  }

  @override
  void dispose() {
    super.dispose();
    isGoodDetailsInit = true;
    _scrollController.removeListener(_onscrollController);
  }

  Widget build(BuildContext context) {
    final blocMain = BlocProviderMain.of(context);
    if (isGoodDetailsInit) {
      isGoodDetailsInit = false;
      blocMain.goodsDetailsInit(context, widget.goodsId);
    }
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
                  blocMain.addToShoppingCart();
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
            brightness: Brightness.light,
            elevation: 1,
            title: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _isHideBanner ? 1 : 0,
              child: Padding(
                padding: EdgeInsets.all(ScreenUtil().setWidth(6)),
                child: StreamBuilder(
                    stream: blocMain.goodsstream,
                    initialData: blocMain.goodsDetails,
                    builder: (context, snapshot) {
                      return snapshot.data["goodsimgs"] != null
                          ? Image.network(snapshot.data["goodsimgs"][0])
                          : Center(
                              child: Icon(Icons.equalizer),
                            );
                    }),
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
              child: StreamBuilder(
                stream: blocMain.goodsstream,
                initialData: blocMain.goodsDetails,
                builder: (context, snapshot) {
                  return SwiperComponent(data: snapshot.data["goodsimgs"]);
                },
              ),
            ),
          ),
          StreamBuilder(
            stream: blocMain.goodsstream,
            initialData: blocMain.goodsDetails,
            builder: (context, snapshot) {
              final _this = snapshot.data;
              return SliverList(
                delegate: SliverChildListDelegate([
                  StreamBuilder(
                    stream: blocMain.goodsSizestream,
                    initialData: blocMain.goodsSizeChoice,
                    builder: (context, snapshot) {
                      return new HeadComponent(
                        data: {
                          "price": snapshot.data["price"] != null
                              ? snapshot.data["price"]
                              : _this["price"],
                          "goodsName": _this["goodsName"]
                        },
                      );
                    },
                  ),
                  SaleComponent(
                    data: _this,
                  ),
                  StoreComponent(
                    data: _this,
                  ),
                  _this["goodsimgs"] != null
                      ? Column(
                          children: _this["goodsimgs"].map<Widget>((f) {
                            return Image.network(f);
                          }).toList(),
                        )
                      : SizedBox(),
                ]),
              );
            },
          )
        ],
      ),
    );
  }
}
