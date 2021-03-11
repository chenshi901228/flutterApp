import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClassTitle extends StatelessWidget {
  final List _list = [
    'images/storeImg.png',
    'images/storeImg.png',
    'images/storeImg.png',
    'images/storeImg.png'
  ];

  List<Widget> _listItem() {
    List<Widget> list = [];
    final len = _list.length;
    for (var i = len - 1; i >= 0; i--) {
      list.add(
        Positioned(
          right: i == 0 ? null : ScreenUtil().setWidth(15) * i,
          child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(242, 242, 242, 1)),
                  borderRadius: BorderRadius.circular(100)),
              child: ClipOval(
                child: Image.asset(
                  _list[i],
                  width: ScreenUtil().setWidth(16),
                  height: ScreenUtil().setWidth(16),
                ),
              )),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Container _cirlImg() {
      return Container(
        width: ScreenUtil().setWidth(100),
        child: Stack(alignment: Alignment.centerRight, children: _listItem()),
      );
    }

    return GestureDetector(
      onTap: () {
        print("频道");
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setWidth(8),
            horizontal: ScreenUtil().setWidth(10)),
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("我的频道", style: TextStyle(fontSize: ScreenUtil().setSp(14))),
            Row(
              children: <Widget>[
                _cirlImg(),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(6)),
                  margin: EdgeInsets.only(left: ScreenUtil().setWidth(4)),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "全部频道",
                        style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                      ),
                      Image.asset(
                        "images/right_icon.png",
                        width: ScreenUtil().setWidth(10),
                        height: ScreenUtil().setWidth(12),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
