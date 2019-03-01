import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class ItemComponent extends StatefulWidget {
  ItemComponent({Key key, this.title, this.route}) : super(key: key);
  final title;
  final route;
  @override
  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<ItemComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.router.navigateTo(context, widget.route);
      },
      child: Container(
        height: ScreenUtil().setWidth(40),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(widget.title,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: Color.fromRGBO(102, 102, 102, 1))),
            Image.asset(
              "images/icon/right_icon.png",
              width: ScreenUtil().setWidth(6),
              height: ScreenUtil().setWidth(11),
            )
          ],
        ),
      ),
    );
  }
}
