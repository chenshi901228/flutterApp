import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/home_tab_item/goods_item.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeTabItem extends StatefulWidget {
  HomeTabItem({Key key, this.data}) : super(key: key);
  final List data;
  @override
  _HomeTabItemState createState() => _HomeTabItemState();
}

class _HomeTabItemState extends State<HomeTabItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  RefreshController _refreshController;

  _onLoading() {
    Future.delayed(Duration(milliseconds: 2000), () {
      _refreshController.loadComplete();
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshController = RefreshController();
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _this = widget.data;

    return SmartRefresher(
      controller: _refreshController,
      onLoading: _onLoading,
      enablePullDown: false,
      enablePullUp: false,
      footer: ClassicFooter(
        // hideWhenNotFull: false,
      ),
      // isNestWrapped: true,
      child: GridView.count(
        primary: true,
        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
        crossAxisCount: 2,
        crossAxisSpacing: ScreenUtil().setWidth(10),
        mainAxisSpacing: ScreenUtil().setWidth(10),
        childAspectRatio: 17 / 24,
        children: <Widget>[
          GoodsItem(
            data: "最近研究多平台开发，其中不可避免的就是ios和安卓开发。换一句话，如果需要一个程序媛员的时候为什么还需要2个",
          ),
          GoodsItem(
            data: "最近研究多平台开发",
          ),
          GoodsItem(
            data: "最近研究多平台开发，其中不可避免的就是ios和安卓开发。换一句话，如果需要一个程序媛员的时候为什么还需要2个",
          ),
          GoodsItem(
            data: "最近研究多平台开发，其中不可避免的就是ios和安卓开发。换一句话，如果需要一个程序媛员的时候为什么还需要2个",
          ),
          GoodsItem(
            data: "最近研究多平台开发，其中不可避免的就是ios和安卓开发。换一句话，如果需要一个程序媛员的时候为什么还需要2个",
          ),
          GoodsItem(
            data: "最近研究多平台开发，其中不可避免的就是ios和安卓开发。换一句话，如果需要一个程序媛员的时候为什么还需要2个",
          ),
        ],
      ),
    );
  }
}
