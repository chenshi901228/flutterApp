import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemComponent extends StatefulWidget {
  ItemComponent({Key key, this.data, this.isSelectAll: false, this.handle})
      : super(key: key);
  final data;
  final isSelectAll;
  final handle;
  @override
  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<ItemComponent> {
  int _number = 1;
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
          Image.asset(
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
                      Text(widget.data["name"],
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              color: Color.fromRGBO(51, 51, 51, 1))),
                      widget.data["size"] != null
                          ? Text("100ml",
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
                            if (_number <= 1) {
                              setState(() {
                                _number = 1;
                              });
                            } else {
                              setState(() {
                                _number--;
                              });
                            }
                          },
                          child: Image.asset(
                            "images/icon/decrease.png",
                            color: _number == 1 ? null : Colors.grey[600],
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
                                setState(() {
                                  _number = 1;
                                });
                              } else {
                                setState(() {
                                  _number = int.parse(value);
                                });
                              }
                            },
                            cursorWidth: 0,
                            controller:
                                TextEditingController(text: _number.toString()),
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
                            setState(() {
                              _number++;
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
