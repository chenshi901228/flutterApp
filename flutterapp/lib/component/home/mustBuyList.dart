import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';
import '../../model/loading.dart';

class MustBuyComponent extends StatefulWidget {
  MustBuyComponent({Key key, this.data}) : super(key: key);
  final data;
  @override
  _MustBuyState createState() => new _MustBuyState();
}

class _MustBuyState extends State<MustBuyComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final List goodsList = [];
  @override
  Widget build(BuildContext context) {
    List _this = widget.data ?? [];
    GestureDetector item(Map goods) {
      return GestureDetector(
        onTap: () {
          Routes.router.navigateTo(
              context, "${Routes.goodsDetailsPage}?goodsId=${goods["id"]}");
        },
        child: Container(
          width: ScreenUtil().setWidth(245),
          // height: ScreenUtil().setWidth(103),
          margin: EdgeInsets.only(right: ScreenUtil().setWidth(8)),
          padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(2))),
          child: Row(
            children: <Widget>[
              FadeInImage(
                  image: NetworkImage(goods["goodsImg"]),
                  placeholder: AssetImage(Common.loadImg),
                  width: ScreenUtil().setWidth(65),
                  height: ScreenUtil().setWidth(83),
                  fadeInDuration: Duration(milliseconds: 100),
                  fadeOutDuration: Duration(milliseconds: 100)),
              Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                  child: Container(
                      width: ScreenUtil().setWidth(150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            goods["goodsName"],
                            softWrap: true,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                color: Color.fromRGBO(51, 51, 51, 1)),
                          ),
                          Container(
                            width: ScreenUtil().setWidth(53),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color.fromRGBO(255, 85, 85, 1)),
                                borderRadius: BorderRadius.circular(
                                    ScreenUtil().setWidth(2))),
                            child: Text(
                              "今日特价",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Color.fromRGBO(255, 85, 85, 1)),
                            ),
                          ),
                          Text(
                            "￥${goods["price"]}",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                color: Color.fromRGBO(255, 102, 102, 1)),
                          )
                        ],
                      )))
            ],
          ),
        ),
      );
    }

    return Container(
      color: Color.fromRGBO(209, 209, 209, 1),
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      height: ScreenUtil().setWidth(158),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
            child: Text("必买好货",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14), color: Colors.black)),
          ),
          Expanded(
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: _this.map((f) {
                  return item(f);
                }).toList()),
          )
        ],
      ),
    );
  }
}
