import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleTags extends StatefulWidget {
  @override
  _TitleTags createState() => _TitleTags();
}

class _TitleTags extends State<TitleTags> {
  @override
  Widget build(BuildContext context) {
    // 标题栏下的标签
    Container _tag(String title, int index) {
      return Container(
        width: ScreenUtil().setWidth(74),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(255, 153 - index * 10, 37, 1),
                  Color.fromRGBO(255, 153 - index * 10 - 10, 37, 1)
                ])),
        child: Text(
          title,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:
              TextStyle(color: Colors.white, fontSize: ScreenUtil().setSp(12)),
        ),
      );
    }

    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
            Color.fromRGBO(255, 136, 0, 1),
            Color.fromRGBO(255, 89, 0, 1)
          ])),
      child: Row(
        children: <Widget>[
          Text("热搜：",
              style: TextStyle(
                  color: Colors.white, fontSize: ScreenUtil().setSp(12))),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _tag("飞河龟", 1),
                _tag("屈层氏爆卖屈层氏爆卖", 2),
                _tag("短袖T恤", 3),
                _tag("龟灯晒背灯", 4),
              ],
            ),
          )
        ],
      ),
    );
  }
}
