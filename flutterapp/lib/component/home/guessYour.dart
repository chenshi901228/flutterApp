import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class GuessYourComponent extends StatefulWidget {
  GuessYourComponent({Key key, this.data}) : super(key: key);
  final data;
  @override
  _GuessYourState createState() => new _GuessYourState();
}

class _GuessYourState extends State<GuessYourComponent> {
  @override
  Widget build(BuildContext context) {
    List _this = widget.data != null ? widget.data : [];
    GestureDetector item(Map goods) {
      return GestureDetector(
        onTap: () {
          Routes.router.navigateTo(
              context, "${Routes.goodsDetailsPage}?goodsId=${goods["id"]}");
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(3))),
          child: Column(
            children: <Widget>[
              FadeInImage(
                image: NetworkImage(goods["goodsImg"]),
                placeholder: AssetImage("images/imgback.jpg"),
                width: ScreenUtil().setWidth(177),
                height: ScreenUtil().setWidth(177),
                fit: BoxFit.fill,
                fadeInDuration: Duration(milliseconds: 100),
                fadeOutDuration: Duration(milliseconds: 100),
              ),
              Container(
                width: ScreenUtil().setWidth(177),
                padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: ScreenUtil().setWidth(34),
                      child: Text(
                        goods["goodsName"],
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Color.fromRGBO(51, 51, 51, 1)),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setWidth(5),
                    ),
                    Text(
                      "￥${goods["price"]}",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Color.fromRGBO(255, 85, 85, 1)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    return Container(
      color: Color.fromRGBO(243, 243, 243, 1),
      padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
            child: Text(
              "猜你喜欢",
              style: TextStyle(fontSize: ScreenUtil().setSp(14)),
            ),
          ),
          Wrap(
              spacing: ScreenUtil().setWidth(5),
              runSpacing: ScreenUtil().setWidth(5),
              children: _this.map((f) {
                return item(f);
              }).toList())
        ],
      ),
    );
  }
}
