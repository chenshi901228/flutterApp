import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:percent_indicator/percent_indicator.dart';


class CarePage extends StatefulWidget {
  @override
  _CarePageState createState() => _CarePageState();
}

class _CarePageState extends State<CarePage> {
  double _refProgess = 0.0;

  RefreshController _refreshController;
  _onRefresh() {
    Future.delayed(Duration(milliseconds: 2000), () {
      _refreshController.refreshCompleted();
    });
  }

  _onLoading() {}
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

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(242, 242, 242, 1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SafeArea(
          child: Text("data"),
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: true,
              floating: true,
              elevation: 0,
              expandedHeight: 0,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(ScreenUtil().setWidth(40)),
                child: Container(
                  height: ScreenUtil().setWidth(40),
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(10)),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromRGBO(255, 144, 0, 1),
                    Color.fromRGBO(255, 80, 0, 1)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("data1"),
                      Text("data1"),
                      Text("data1"),
                      Text("data1"),
                      Text("data1"),
                    ],
                  ),
                ),
              ),
            )
          ];
        },
        body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: _onRefresh,
            onLoading: _onLoading,
            onOffsetChange: (c, o) {
              setState(() {
                _refProgess = (o / 80.0).clamp(0.0, 0.8);
              });
            },
            header: ClassicHeader(
              triggerDistance: 50.0,
              height: 46,
              refreshStyle: RefreshStyle.Follow,
              textStyle: TextStyle(color: Colors.pink),
              idleText: "下拉即可刷新...",
              releaseText: "释放即可刷新...",
              refreshingText: "加载中...",
              completeText: "刷新成功...",
              failedText: "刷新失败...",
              spacing: 4.0,
              releaseIcon: CircularPercentIndicator(
                radius: 15.0,
                lineWidth: 1.0,
                percent: _refProgess,
                center: Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                  size: 12,
                ),
                progressColor: Colors.red,
              ),
              refreshingIcon: SizedBox(
                width: 15,
                height: 15,
                child: CircularProgressIndicator(
                  strokeWidth: 1.0,
                ),
              ),
              idleIcon: CircularPercentIndicator(
                radius: 15.0,
                lineWidth: 1.0,
                percent: _refProgess,
                center: Icon(
                  Icons.arrow_downward,
                  color: Colors.red,
                  size: 12,
                ),
                progressColor: Colors.red,
              ),
            ),
            child: ListView(
              padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
              children: <Widget>[
                Container(
                  height: ScreenUtil().setWidth(160),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setWidth(10))),
                  child: Text("data"),
                ),
                Container(
                  height: 600,
                ),
                Text("data"),
              ],
            )),
      ),
    );
  }
}
