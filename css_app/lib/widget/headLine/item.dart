import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadItem extends StatelessWidget {
  HeadItem({Key key, this.data, this.hasRightBorder}) : super(key: key);

  /// data
  final Map data;

  /// set border_right of Widget.
  final hasRightBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              right: BorderSide(
                  width: ScreenUtil().setWidth(hasRightBorder ? 1 : 0),
                  color: Color.fromRGBO(242, 242, 242, 1)),
              top: BorderSide(
                  width: ScreenUtil().setWidth(1),
                  color: Color.fromRGBO(242, 242, 242, 1)))),
      width: ScreenUtil().setWidth(177),
      // height: ScreenUtil().setWidth(150),
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      child: Column(
        children: <Widget>[
          // 标题
          Row(
            children: <Widget>[
              // 标题图片
              Image.asset(
                data['titleImg'],
                width: ScreenUtil().setWidth(14),
                height: ScreenUtil().setWidth(14),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(4),
              ),
              // 标题内容
              Text(
                data['title'],
                style: TextStyle(fontSize: ScreenUtil().setSp(12)),
              )
            ],
          ),
          SizedBox(
            height: ScreenUtil().setWidth(10),
          ),
          Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: ScreenUtil().setWidth(76),
                    child: Text(
                      data['des'],
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Color.fromRGBO(161, 161, 161, 1)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(6)),
                    child: Image.asset(
                      "images/goods_img.jpg",
                      width: ScreenUtil().setWidth(78),
                      height: ScreenUtil().setWidth(76),
                    ),
                  )
                ],
              ),
              Container(
                child: Image.asset(
                  "images/goods1.jpg",
                  width: ScreenUtil().setWidth(78),
                  height: ScreenUtil().setWidth(100),
                  fit: BoxFit.fill,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
