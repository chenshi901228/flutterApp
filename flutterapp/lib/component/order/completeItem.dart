import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompleteItem extends StatefulWidget {
  CompleteItem({Key key, this.data}) : super(key: key);
  final data;
  @override
  _CompleteItemState createState() => new _CompleteItemState();
}

class _CompleteItemState extends State<CompleteItem> {
  @override
  Widget build(BuildContext context) {
    final _this = widget.data;
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      child: Row(
        children: <Widget>[
          Image.asset(
            _this["img"],
            width: ScreenUtil().setWidth(90),
            height: ScreenUtil().setWidth(90),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Expanded(
              child: Container(
            height: ScreenUtil().setWidth(90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _this["name"],
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: ScreenUtil().setWidth(12),
                              color: Color.fromRGBO(51, 51, 51, 1)),
                        ),
                        Text(
                          _this["size"],
                          style: TextStyle(
                              fontSize: ScreenUtil().setWidth(12),
                              color: Color.fromRGBO(155, 155, 155, 1)),
                        )
                      ],
                    )),
                    SizedBox(
                      width: ScreenUtil().setWidth(20),
                    ),
                    Text(
                      "交易成功",
                      style: TextStyle(
                          fontSize: ScreenUtil().setWidth(12),
                          color: Color.fromRGBO(255, 85, 85, 1)),
                    ),
                  ],
                ),
                Text.rich(TextSpan(
                    text: "共计${_this["number"]}件商品   ",
                    style: TextStyle(
                        fontSize: ScreenUtil().setWidth(12),
                        color: Color.fromRGBO(153, 153, 153, 1)),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "合计：¥${(_this["price"] * _this["number"]).runtimeType == int ? (_this["price"] * _this["number"]).toString() + '.00' : (_this["price"] * _this["number"])}",
                        style: TextStyle(
                            fontSize: ScreenUtil().setWidth(12),
                            color: Color.fromRGBO(102, 102, 102, 1)),
                      )
                    ]))
              ],
            ),
          ))
        ],
      ),
    );
  }
}
