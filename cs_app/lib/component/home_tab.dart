import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/eventBus.dart';
import '../model/eventBusModel.dart';

class HomeTab extends StatefulWidget {
  HomeTab({
    Key key,
    this.data,
    this.currentPage,
    this.fixedAppBar,
    this.pageChange,
  }) : super(key: key);

  /// tab list
  final List data;

  /// currentPage
  final int currentPage;

  ///tabbar is fixed
  final bool fixedAppBar;

  ///function  pageViewChange
  final pageChange;

  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  ScrollController _scrollController = ScrollController();

  _onscrollController() {
    // print(_scrollController.offset);
  }

  // 滚动位移
  _tabScrollOffset(int currentIndex) {
    var position = _scrollController.position;
    double itemWidth = ScreenUtil().setWidth(70);
    double offset = (itemWidth * (currentIndex + 1) -
            position.viewportDimension / 2.0 -
            itemWidth / 2.0)
        .clamp(position.minScrollExtent, position.maxScrollExtent);
    return offset;
  }

  // 滚动动画
  _tabAnimation(int index) {
    _scrollController.animateTo(_tabScrollOffset(index),
        curve: Curves.ease, duration: Duration(milliseconds: 200));
  }

  // 点击切换
  _tabClick(int index) {
    widget.pageChange(index);
    _tabAnimation(index);
  }

  @override
  void initState() {
    // 监听pageView change event
    eventBus.on<HomePagePageViewChangeEvent>().listen((e) {
      _tabAnimation(e.index);
    });
    _scrollController.addListener(_onscrollController);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onscrollController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _list = widget.data;
    final _currentPage = widget.currentPage;
    final _fixedAppBar = widget.fixedAppBar;
    List<Widget> _tab() {
      List<Widget> list = [];
      final len = _list.length;
      for (var i = 0; i < len; i++) {
        list.add(Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                _tabClick(i);
              },
              child: Container(
                width: ScreenUtil().setWidth(70),
                height: ScreenUtil().setWidth(36),
                padding:
                    EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // 分类标题 and 下划线
                    Stack(
                      overflow:
                          i == _currentPage ? Overflow.visible : Overflow.clip,
                      children: <Widget>[
                        Text(
                          _list[i]['title'],
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: i == _currentPage
                                  ? Color.fromRGBO(255, 30, 0, 1)
                                  : Color.fromRGBO(52, 52, 52, 1)),
                        ),
                        Positioned(
                          bottom: -ScreenUtil().setWidth(7),
                          child: Container(
                            width: ScreenUtil().setWidth(30),
                            height: _fixedAppBar
                                ? ScreenUtil().setWidth(2)
                                : ScreenUtil().setWidth(0),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(255, 30, 0, 1),
                                borderRadius: BorderRadius.circular(
                                    ScreenUtil().setWidth(4))),
                          ),
                        )
                      ],
                    ),
                    // 分类标题下的描述
                    Offstage(
                      offstage: _fixedAppBar,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(4)),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ScreenUtil().setWidth(20)),
                            gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: i == _currentPage
                                    ? [
                                        Color.fromRGBO(255, 76, 3, 1),
                                        Color.fromRGBO(255, 31, 1, 1)
                                      ]
                                    : [
                                        Colors.transparent,
                                        Colors.transparent
                                      ])),
                        child: Text(
                          _list[i]['des'],
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(10),
                              color: i == _currentPage
                                  ? Colors.white
                                  : Color.fromRGBO(170, 170, 170, 1)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              width: ScreenUtil().setWidth(1),
              height: _fixedAppBar
                  ? ScreenUtil().setWidth(14)
                  : ScreenUtil().setWidth(20),
              color: Color.fromRGBO(207, 207, 207, 1),
            )
          ],
        ));
      }
      return list;
    }

    return ListView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      children: _tab(),
    );
  }
}
