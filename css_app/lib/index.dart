import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'model/eventBus.dart';
import 'model/eventBusModel.dart';

import './home.1.dart';
import 'care.dart';
import 'shopping.dart';
import 'mine.dart';
import 'message.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> with SingleTickerProviderStateMixin {
  final List _bottomData = [
    {'imgUrl': 'images/home.png', 'actived': 'images/home.png', 'text': '首页'},
    {'imgUrl': 'images/care.png', 'actived': 'images/care_1.png', 'text': '微淘'},
    {'imgUrl': 'images/msg.png', 'actived': 'images/msg_1.png', 'text': '消息'},
    {
      'imgUrl': 'images/shopping.png',
      'actived': 'images/shopping_1.png',
      'text': '购物车'
    },
    {
      'imgUrl': 'images/mine.png',
      'actived': 'images/mine_1.png',
      'text': '我的淘宝'
    },
  ];
  int _currentPage = 0; //bottomBar 当前页
  int _homeClickTotal = 1; //对连续点击home计数 _homeClickTotal>=1表示点击了home 多次
  bool _scrollTop = true; //homePage是否滚到顶部
  AnimationController homePageIconController;
  Animation scaleAnimation; //bottomBar点击的放大动画效果

  // 底部导航PageView控制器
  PageController _pageController = PageController();
  // homeIcon上下滑动控制器
  ScrollController _scrollController = ScrollController();

  // PageView切换
  onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  // homeIcon上下滑动
  _homeIconScroll(bool type) {
    if (type) {
      _scrollController.animateTo(0.0,
          curve: Curves.ease, duration: Duration(milliseconds: 200));
    } else {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          curve: Curves.ease, duration: Duration(milliseconds: 200));
    }
  }

  // homePage滚动
  _homePageScroll(bool type) {
    _homeIconScroll(type);
    _scrollTop = type;
  }

  @override
  void initState() {
    homePageIconController =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
    scaleAnimation = Tween(begin: 0.7, end: 1.0).animate(homePageIconController)
      ..addListener(() {
        setState(() {});
      });
    homePageIconController.forward();

    _scrollController.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    homePageIconController.dispose();
    _scrollController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> _tabItem() {
      List<Widget> list = [];
      final len = _bottomData.length;
      for (var i = 0; i < len; i++) {
        list.add(GestureDetector(
          onTap: () {
            setState(() {
              if (i == 0 && _homeClickTotal >= 1) {
                _homeIconScroll(_scrollTop);
                eventBus.fire(HomePageScrollToTopEvent(!_scrollTop));
                _scrollTop = !_scrollTop;
              } else {
                homePageIconController.forward(from: 0.0);
              }
              if (i == 0) {
                _homeClickTotal++;
              } else {
                _homeClickTotal = 0;
              }
            });
            _pageController.jumpToPage(i);
          },
          child: ScaleTransition(
            scale: i == _currentPage
                ? scaleAnimation
                : Tween(begin: 1.0, end: 1.0).animate(homePageIconController),
            child: Container(
              width: ScreenUtil().setWidth(62),
              height: ScreenUtil().setWidth(50),
              decoration: BoxDecoration(
                  color: i == _currentPage && _homeClickTotal < 1
                      ? Color.fromRGBO(209, 228, 248, 1)
                      : null,
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(2))),
              child: Center(
                child: i == 0
                    ? Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Opacity(
                            opacity: _homeClickTotal >= 1 ? 1.0 : 0.0,
                            child: Container(
                                width: ScreenUtil().setWidth(34),
                                height: ScreenUtil().setWidth(34),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromRGBO(255, 138, 0, 1),
                                          Color.fromRGBO(255, 88, 0, 1)
                                        ])),
                                child: ListView(
                                  physics: NeverScrollableScrollPhysics(),
                                  controller: _scrollController,
                                  padding: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setWidth(6)),
                                  children: <Widget>[
                                    ClipOval(
                                      child: Image.asset("images/tb.png",
                                          width: ScreenUtil().setWidth(24),
                                          height: ScreenUtil().setWidth(24)),
                                    ),
                                    SizedBox(
                                      height: ScreenUtil().setWidth(6),
                                    ),
                                    ClipOval(
                                      child: Image.asset("images/rocket.png",
                                          width: ScreenUtil().setWidth(24),
                                          height: ScreenUtil().setWidth(24)),
                                    ),
                                  ],
                                )),
                          ),
                          Opacity(
                            opacity: _homeClickTotal < 1 ? 1.0 : 0.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  i == _currentPage
                                      ? _bottomData[i]['actived']
                                      : _bottomData[i]['imgUrl'],
                                  width: ScreenUtil().setWidth(20),
                                  height: ScreenUtil().setWidth(20),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setWidth(2),
                                ),
                                Text(
                                  _bottomData[i]['text'],
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(10),
                                      color: i == _currentPage
                                          ? Color.fromRGBO(255, 80, 0, 1)
                                          : Color.fromRGBO(68, 68, 68, 1)),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            i == _currentPage
                                ? _bottomData[i]['actived']
                                : _bottomData[i]['imgUrl'],
                            width: ScreenUtil().setWidth(20),
                            height: ScreenUtil().setWidth(20),
                          ),
                          SizedBox(
                            height: ScreenUtil().setWidth(2),
                          ),
                          Text(
                            _bottomData[i]['text'],
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(10),
                                color: i == _currentPage
                                    ? Color.fromRGBO(255, 80, 0, 1)
                                    : Color.fromRGBO(68, 68, 68, 1)),
                          )
                        ],
                      ),
              ),
            ),
          ),
        ));
      }
      return list;
    }

    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          new HomePage(
            homePageScroll: _homePageScroll,
          ),
          new CarePage(),
          new MessagePage(),
          new ShoppingPage(),
          new MinePage()
        ],
        onPageChanged: onPageChanged,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: ScreenUtil().screenWidth,
          padding: EdgeInsets.all(ScreenUtil().setWidth(4)),
          color: Color.fromRGBO(246, 247, 247, 1),
          height: ScreenUtil().setWidth(50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _tabItem(),
          ),
        ),
      ),
    );
  }
}
