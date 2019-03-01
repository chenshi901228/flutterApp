import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class TabItemComponent extends StatefulWidget {
  TabItemComponent({Key key, this.name}) : super(key: key);
  final name;
  @override
  _TabItemState createState() => new _TabItemState();
}

class _TabItemState extends State<TabItemComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Routes.router.navigateTo(context, "/goodsDetailsPage");
        },
        child: Column(
          children: <Widget>[
            Container(
              width: ScreenUtil().setWidth(177),
              height: ScreenUtil().setWidth(177),
              padding: EdgeInsets.all(ScreenUtil().setWidth(7)),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/imgback.jpg"),
                      fit: BoxFit.fill)),
              child: Image.asset(
                "images/goods1.jpg",
                fit: BoxFit.fill,
              ),
            ),
            Container(
              color: Colors.white,
              width: ScreenUtil().setWidth(177),
              padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setWidth(37),
                    child: Text(widget.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Color.fromRGBO(51, 51, 51, 1))),
                  ),
                  Text(
                    "￥200",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: Color.fromRGBO(255, 102, 102, 1)),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
