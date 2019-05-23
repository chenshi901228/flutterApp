import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/eventBus.dart';
import 'model/eventBusModel.dart';

import 'component/title_tags.dart';
import 'component/banner.dart';
import 'component/classify.dart';
import 'component/head_line.dart';
import 'component/home_tab_item.dart';
import 'component/home_tab.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.homePageScroll}) : super(key: key);
  final homePageScroll;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  // Tab内容
  final _renderItem = [
    HomeTabItem(),
    Text("data"),
    HomeTabItem(),
    HomeTabItem(),
    HomeTabItem(),
    HomeTabItem(),
    HomeTabItem(),
  ];
  // Tab选项
  final List _list = [
    {'title': '全部', 'des': "猜你喜欢"},
    {'title': '疯狂', 'des': "疯狂抢购"},
    {'title': '直播', 'des': "网红推荐"},
    {'title': '全球', 'des': "进口好货"},
    {'title': '生活', 'des': "享受生活"},
    {'title': '时尚', 'des': "时尚好货"},
    {'title': '母婴', 'des': "母婴大赏"},
  ];
  // 当前页
  int _currentPage = 0;
  // 是否固定appBar
  bool _fixedAppBar = false;
  // PageView控制器
  PageController _pageController = PageController();
  // NestedScrollView列表控制器
  ScrollController _scrollController = ScrollController();

  // NestedScrollView滚动事件
  _onscrollController() {
    var scrollToTabPix =
        (ScreenUtil().setWidth(844) - ScreenUtil().setWidth(36))
            .ceil()
            .toDouble();
    var offset = _scrollController.offset;
    setState(() {
      if (offset >= scrollToTabPix) {
        _fixedAppBar = true;
        widget.homePageScroll(false);
      } else {
        _fixedAppBar = false;
        widget.homePageScroll(true);
      }
    });
  }


// 左右滑动切换
  onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
    // 触发pageView change event
    eventBus.fire(HomePagePageViewChangeEvent(index));
  }

// 点击切换
  _pageChange(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    // 监听homeIcon点击事件
    eventBus.on<HomePageScrollToTopEvent>().listen((e) {
      if (e.top) {
        _scrollController.animateTo(0.0,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      } else {
        var offset = ScreenUtil().setWidth(844) - ScreenUtil().setWidth(36);
        _scrollController.animateTo(offset.ceil().toDouble(),
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      }
    });
    _scrollController.addListener(_onscrollController);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onscrollController);
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(ScreenUtil().setWidth(50)),
        child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                  Color.fromRGBO(255, 144, 0, 1),
                  Color.fromRGBO(255, 80, 0, 1)
                ])),
            child: AppBar(
              backgroundColor: Colors.transparent,
              leading: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'images/sao.png',
                      width: ScreenUtil().setWidth(20),
                      height: ScreenUtil().setWidth(20),
                    ),
                    Text('扫一扫',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(12)))
                  ],
                ),
              ),
              actions: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('images/menu.png',
                          width: ScreenUtil().setWidth(20),
                          height: ScreenUtil().setWidth(20)),
                      Text(
                        "会员码",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(12)),
                      )
                    ],
                  ),
                ),
              ],
              title: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: <Widget>[
                      TextField(
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Colors.grey),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "搜你喜欢的",
                            hintStyle: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                color: Colors.grey),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(34),
                                vertical: ScreenUtil().setWidth(4))),
                      ),
                      Positioned(
                        left: ScreenUtil().setWidth(10),
                        child: Image.asset(
                          'images/serch.png',
                          width: ScreenUtil().setWidth(20),
                          height: ScreenUtil().setWidth(20),
                        ),
                      ),
                      Positioned(
                        right: ScreenUtil().setWidth(10),
                        child: Image.asset(
                          'images/camera.png',
                          width: ScreenUtil().setWidth(20),
                          height: ScreenUtil().setWidth(20),
                        ),
                      )
                    ],
                  )),
              elevation: 0,
              centerTitle: true,
            )),
      ),
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              backgroundColor: Color.fromRGBO(242, 242, 242, 1),
              pinned: true,
              floating: true,
              elevation: 0,
              expandedHeight: ScreenUtil().setWidth(844),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin, //很重要！！！！
                background: Column(
                  children: <Widget>[
                    TitleTags(),
                    HomeBanner(),
                    ClassIfy(),
                    HeadLine(),
                  ],
                ),
              ),
              // Tab选项卡
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(ScreenUtil().setWidth(36)),
                child: Container(
                    width: ScreenUtil.screenWidth,
                    height: ScreenUtil().setWidth(36),
                    color: _fixedAppBar ? Colors.white : Colors.transparent,
                    child: HomeTab(
                      data: _list,
                      currentPage: _currentPage,
                      fixedAppBar: _fixedAppBar,
                      pageChange: (int index) {
                        _pageChange(index);
                      },
                    )),
              ),
            )
          ];
        },
        body: PageView(
          controller: _pageController,
          children: _renderItem,
          onPageChanged: onPageChanged,
          physics: BouncingScrollPhysics(),
        ),
      ),
    );
  }
}
