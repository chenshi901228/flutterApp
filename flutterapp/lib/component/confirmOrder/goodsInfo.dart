import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoodsInfoComponent extends StatefulWidget {
  GoodsInfoComponent({Key key, this.data, this.onChanged}) : super(key: key);
  final data;
  final onChanged;
  @override
  _GoodsInfoState createState() => new _GoodsInfoState();
}

class _GoodsInfoState extends State<GoodsInfoComponent> {
  @override
  Widget build(BuildContext context) {
    // 购买数量
    Container numberChoose() {
      return Container(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setWidth(12),
            horizontal: ScreenUtil().setWidth(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "购买数量",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  color: Color.fromRGBO(102, 102, 102, 1)),
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    widget.onChanged("decrease");
                  },
                  child: Image.asset(
                    "images/icon/decrease.png",
                    color: widget.data["number"] == 1 ? null : Colors.grey[600],
                    width: ScreenUtil().setWidth(21),
                    height: ScreenUtil().setWidth(21),
                  ),
                ),
                Container(
                  color: Color.fromRGBO(216, 216, 216, 1),
                  width: ScreenUtil().setWidth(34),
                  height: ScreenUtil().setWidth(21),
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(1)),
                  child: TextField(
                    onChanged: (value) {
                      widget.onChanged(value);
                    },
                    cursorWidth: 0,
                    controller: TextEditingController(
                        text: widget.data["number"].toString()),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(13),
                        color: Color.fromRGBO(102, 102, 102, 1)),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.onChanged("increase");
                  },
                  child: Image.asset(
                    "images/icon/increase.png",
                    width: ScreenUtil().setWidth(21),
                    height: ScreenUtil().setWidth(21),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

// 配送方式
    Container deliveryMethod() {
      return Container(
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setWidth(12),
            horizontal: ScreenUtil().setWidth(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "配送方式",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(12),
                  color: Color.fromRGBO(102, 102, 102, 1)),
            ),
            Text(
              "快递 免邮",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(13),
                  color: Color.fromRGBO(153, 153, 153, 1)),
            )
          ],
        ),
      );
    }

// 商品信息
    Container goods() {
      return Container(
        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
        decoration: BoxDecoration(
            color: Color.fromRGBO(250, 250, 250, 1),
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
        child: Row(
          children: <Widget>[
            Image.asset(
              "images/goods1.jpg",
              width: ScreenUtil().setWidth(82),
              height: ScreenUtil().setWidth(82),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(10),
            ),
            Expanded(
                child: Container(
              height: ScreenUtil().setWidth(82),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.data["name"],
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Color.fromRGBO(51, 51, 51, 1)),
                      ),
                      Text(
                        widget.data["size"],
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Color.fromRGBO(153, 153, 153, 1)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "¥${widget.data["price"]}",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(255, 102, 102, 1)),
                      ),
                      Text(
                        "×${widget.data["number"]}",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Color.fromRGBO(153, 153, 153, 1)),
                      )
                    ],
                  )
                ],
              ),
            ))
          ],
        ),
      );
    }

// 小计
    Container total() {
      return Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setWidth(13),
            horizontal: ScreenUtil().setWidth(10)),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
        child: Text.rich(TextSpan(
            text: "共${widget.data["number"]}件商品  ",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(12),
                color: Color.fromRGBO(102, 102, 102, 1)),
            children: <TextSpan>[
              TextSpan(
                  text: "小计：",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
                      color: Color.fromRGBO(153, 153, 153, 1))),
              TextSpan(
                  text: "¥${widget.data["number"] * widget.data["price"]}",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
                      color: Color.fromRGBO(255, 102, 102, 1)))
            ])),
      );
    }

    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[goods(), numberChoose(), deliveryMethod(), total()],
      ),
    );
  }
}
