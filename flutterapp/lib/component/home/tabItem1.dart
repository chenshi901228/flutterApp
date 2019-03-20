import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './swiper.dart';
import './classify.dart';
import './lastTime.dart';
import './goodsItem.dart';
import './mustBuyList.dart';
import './guessYour.dart';

class TabItem1Component extends StatefulWidget {
  TabItem1Component({Key key, this.data}) : super(key: key);
  final data;
  @override
  _TabItem1State createState() => new _TabItem1State();
}

class _TabItem1State extends State<TabItem1Component> {
  final ScrollController _scrollController = ScrollController();
  bool topButton = true;
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 300) {
        setState(() {
          topButton = false;
        });
      } else {
        setState(() {
          topButton = true;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map _this = widget.data;
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      floatingActionButton: Offstage(
          offstage: topButton,
          child: GestureDetector(
            onTap: () {
              _scrollController.animateTo(0.0,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            },
            child: Image.asset(
              "images/icon/TOP.png",
              width: ScreenUtil().setWidth(32),
              height: ScreenUtil().setWidth(32),
            ),
          )),
      body: Container(
        child: ListView(
          controller: _scrollController,
          children: <Widget>[
            new SwiperComponent(
              data: _this["bannerImgsList"],
            ),
            new ClassifyComponent(
              data: _this["classifyList"],
            ),
            new LastTimeComponent(),
            new GoodsItemComponent(
              data: _this["goodsList"].sublist(0, 4),
            ),
            new MustBuyComponent(
              data: _this["goodsList"].sublist(4, 8),
            ),
            new GoodsItemComponent(
              title: "每日必逛",
              data: _this["goodsList"].sublist(8, 12),
            ),
            new GoodsItemComponent(
              title: "潮玩推荐",
              data: _this["goodsList"].sublist(4, 8),
            ),
            new GoodsItemComponent(
              title: "品质生活",
              data: _this["goodsList"].sublist(8, 12),
            ),
            new GuessYourComponent(
              data: _this["goodsList"],
            )
          ],
        ),
      ),
    );
  }
}
