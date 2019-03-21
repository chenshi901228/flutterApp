import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class GoodsItemComponent extends StatefulWidget {
  GoodsItemComponent({Key key, this.title = "", this.data}) : super(key: key);
  final String title;
  final data;
  @override
  _GoodsItemState createState() => new _GoodsItemState();
}

class _GoodsItemState extends State<GoodsItemComponent> {
  @override
  Widget build(BuildContext context) {
    List _this = widget.data != null ? widget.data : [];
    GestureDetector good(Map goods) {
      return GestureDetector(
        onTap: () {
          Routes.router.navigateTo(
              context, "${Routes.goodsDetailsPage}?goodsId=${goods["id"]}");
        },
        child: Container(
          width: ScreenUtil().setWidth(178),
          height: ScreenUtil().setWidth(120),
          child: Image.network(
            goods["goodsImg"],
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    return Column(
      children: <Widget>[
        widget.title != ""
            ? Container(
                width: ScreenUtil.screenWidth,
                alignment: Alignment.center,
                color: Color.fromRGBO(243, 243, 243, 1),
                padding: EdgeInsets.only(
                    top: ScreenUtil().setWidth(10),
                    bottom: ScreenUtil().setWidth(2)),
                child: Text(
                  widget.title,
                  style: TextStyle(fontSize: ScreenUtil().setSp(14)),
                ),
              )
            : SizedBox(),
        Container(
            color: Color.fromRGBO(243, 243, 243, 1),
            width: ScreenUtil.screenWidth,
            padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
            child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                runSpacing: ScreenUtil().setWidth(3),
                children: _this.map((f) {
                  return good(f);
                }).toList()))
      ],
    );
  }
}
