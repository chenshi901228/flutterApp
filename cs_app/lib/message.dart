import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  RefreshController _refreshController;
  _onRefresh() {}
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: SafeArea(
          child: Text(""),
        ),
      ),
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: ClassicHeader(
            refreshStyle: RefreshStyle.Follow,
          ),
          controller: _refreshController,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          isNestWrapped: true,
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                elevation: 0,
                expandedHeight: ScreenUtil().setWidth(150),
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    child: Text("微淘1111"),
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(ScreenUtil().setWidth(40)),
                  child: Container(
                    height: ScreenUtil().setWidth(40),
                    color: Colors.pink,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  
                ]),
              )
            ],
          )),
    );
  }
}
