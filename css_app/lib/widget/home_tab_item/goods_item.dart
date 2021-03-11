import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsItem extends StatefulWidget {
  GoodsItem({Key key, this.data}) : super(key: key);
  final String data;
  @override
  _GoodsItemState createState() => _GoodsItemState();
}

class _GoodsItemState extends State<GoodsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(170),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ScreenUtil().setWidth(6)),
                topRight: Radius.circular(ScreenUtil().setWidth(6))),
            child: Image.asset(
              "images/goods_img.jpg",
              width: ScreenUtil().setWidth(170),
              height: ScreenUtil().setWidth(150),
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            height: ScreenUtil().setWidth(90),
            padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(ScreenUtil().setWidth(6)),
                    bottomRight: Radius.circular(ScreenUtil().setWidth(6)))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  child: Text(
                    widget.data,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    RichText(
                        text: TextSpan(
                            text: "￥",
                            style: TextStyle(
                                color: Color.fromRGBO(255, 80, 0, 1),
                                fontSize: ScreenUtil().setSp(10)),
                            children: <TextSpan>[
                          TextSpan(
                              text: "32 ",
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 80, 0, 1),
                                  fontSize: ScreenUtil().setSp(14))),
                          TextSpan(
                              text: "2774人付款",
                              style: TextStyle(
                                  color: Color.fromRGBO(154, 154, 154, 1),
                                  fontSize: ScreenUtil().setSp(10)))
                        ])),
                    GestureDetector(
                      onTap: () {
                        print("more");
                      },
                      child: Image.asset(
                        "images/more.png",
                        width: ScreenUtil().setWidth(20),
                        height: ScreenUtil().setWidth(10),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
