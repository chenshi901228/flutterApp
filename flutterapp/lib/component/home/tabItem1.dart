import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/event_bus.dart';
import '../../type/goTop.dart';

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

class _TabItem1State extends State<TabItem1Component> with AutomaticKeepAliveClientMixin {
  final ScrollController _scrollController = ScrollController();
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > 300) {
        eventBus.fire(GoTop(false));
      } else {
        eventBus.fire(GoTop(true));
      }
    });
    eventBus.on<HandleTop>().listen((e) {
      _scrollController.animateTo(0.0,
          duration: Duration(seconds: 2), curve: Curves.easeInCirc);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return ListView(
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
    );
  }
}
