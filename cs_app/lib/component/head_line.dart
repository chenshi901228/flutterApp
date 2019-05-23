import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widget/headLine/title.dart';
import '../widget/headLine/item.dart';

class HeadLine extends StatelessWidget {
  final List _list = [
    {'titleImg': 'images/tqg.png', 'title': '淘抢购', 'des': '限时限量抢半价'},
    {'titleImg': 'images/jhs.png', 'title': '聚划算', 'des': '抢第二件1元'},
    {'titleImg': 'images/play.png', 'title': '淘宝直播', 'des': '越买越开心'},
    {'titleImg': 'images/tqg.png', 'title': '有好货', 'des': '只给挑剔的你'},
    {'titleImg': 'images/jhs.png', 'title': '哇哦视频', 'des': '亲测什么好买'},
    {'titleImg': 'images/play.png', 'title': '每日好店', 'des': '神店挖掘机'},
  ];

  List<Widget> _renderItem() {
    List<Widget> list = [];
    for (var i = 0; i < _list.length; i++) {
      list.add(HeadItem(
        data: _list[i],
        hasRightBorder: i % 2 == 0 ? true : false,
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil.screenWidth,
      margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))),
      child: Column(
        children: <Widget>[
          HeadLineTitle(),
          Wrap(alignment: WrapAlignment.spaceBetween, children: _renderItem())
        ],
      ),
    );
  }
}
