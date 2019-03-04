import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './swiper.dart';
import './classify.dart';
import './lastTime.dart';
import './goodsItem.dart';
import './mustBuyList.dart';
import './guessYour.dart';

class TabItem1Component extends StatefulWidget {
  @override
  _TabItem1State createState() => new _TabItem1State();
}

class _TabItem1State extends State<TabItem1Component>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final ScrollController _scrollController = ScrollController();
  bool topButton = true;
  @override
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

  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Scaffold(
      floatingActionButton: Offstage(
          offstage: topButton,
          child: GestureDetector(
            onTap: () {
              _scrollController.animateTo(0,
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
            new SwiperComponent(),
            new ClassifyComponent(),
            new LastTimeComponent(),
            new GoodsItemComponent(),
            new MustBuyComponent(),
            new GoodsItemComponent(
              title: "每日必逛",
            ),
            new GoodsItemComponent(
              title: "潮玩推荐",
            ),
            new GoodsItemComponent(
              title: "品质生活",
            ),
            new GuessYourComponent()
          ],
        ),
      ),
    );
  }
}
