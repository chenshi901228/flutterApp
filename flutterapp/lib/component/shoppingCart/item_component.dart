import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemComponent extends StatefulWidget {
  ItemComponent(
      {Key key,
      this.data,
      this.isSelectAll: false,
      this.handle,
      this.countChange})
      : super(key: key);
  final data;
  final isSelectAll;
  final handle;
  final countChange;
  @override
  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<ItemComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      height: ScreenUtil().setWidth(110),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              widget.handle(widget.data["id"]);
            },
            child: Image.asset(
              widget.data["isSelect"]
                  ? "images/icon/isactive.png"
                  : "images/icon/noactive.png",
              width: ScreenUtil().setWidth(15),
              height: ScreenUtil().setWidth(15),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Image.network(
            widget.data["imgUrl"],
            width: ScreenUtil().setWidth(90),
            height: ScreenUtil().setWidth(90),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                  width: ScreenUtil().setWidth(230),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.data["goodsName"],
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              color: Color.fromRGBO(51, 51, 51, 1))),
                      widget.data["size"] != null
                          ? Text(widget.data["size"],
                              softWrap: true,
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Color.fromRGBO(155, 155, 155, 1)))
                          : SizedBox(),
                    ],
                  )),
              Container(
                width: ScreenUtil().setWidth(230),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "￥${widget.data["price"]}",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Color.fromRGBO(255, 85, 85, 1)),
                    ),
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            widget.countChange({
                              "type": "decrease",
                              "shoppingCartId": widget.data["shoppingCartId"]
                            });
                          },
                          child: Image.asset(
                            "images/icon/decrease.png",
                            color: widget.data["count"] == 1
                                ? null
                                : Colors.grey[600],
                            width: ScreenUtil().setWidth(17),
                            height: ScreenUtil().setWidth(17),
                          ),
                        ),
                        Container(
                          color: Color.fromRGBO(216, 216, 216, 1),
                          width: ScreenUtil().setWidth(28),
                          height: ScreenUtil().setWidth(17),
                          margin: EdgeInsets.symmetric(
                              horizontal: ScreenUtil().setWidth(1)),
                          child: TextField(
                            onChanged: (value) {
                              if (value == "" || int.parse(value) < 1) {
                                widget.countChange({
                                  "type": "textChange",
                                  "shoppingCartId":
                                      widget.data["shoppingCartId"],
                                  "newCount": 1
                                });
                              } else {
                                widget.countChange({
                                  "type": "textChange",
                                  "shoppingCartId":
                                      widget.data["shoppingCartId"],
                                  "newCount": int.parse(value)
                                });
                              }
                            },
                            cursorWidth: 0,
                            controller: TextEditingController(
                                text: widget.data["count"].toString()),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(13),
                                color: Color.fromRGBO(102, 102, 102, 1)),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 2),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // setState(() {
                            //   _number++;
                            // });
                            widget.countChange({
                              "type": "increase",
                              "shoppingCartId": widget.data["shoppingCartId"]
                            });
                          },
                          child: Image.asset(
                            "images/icon/increase.png",
                            width: ScreenUtil().setWidth(17),
                            height: ScreenUtil().setWidth(17),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
