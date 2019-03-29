import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadComponent extends StatefulWidget {
  HeadComponent({Key key, this.data}) : super(key: key);
  final data;
  @override
  _HeadState createState() => new _HeadState();
}

class _HeadState extends State<HeadComponent> {
  int _maxLines = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: ScreenUtil.screenWidth,
            height: ScreenUtil().setWidth(155),
            child: !widget.data.isEmpty
                ? Image.network(
                    widget.data["storeBannerImgs"],
                    fit: BoxFit.fill,
                  )
                : Icon(Icons.equalizer),
          ),
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                  color: Colors.white,
                  width: ScreenUtil.screenWidth,
                  padding: EdgeInsets.only(
                      top: ScreenUtil().setWidth(35),
                      left: ScreenUtil().setWidth(20),
                      right: ScreenUtil().setWidth(20),
                      bottom: ScreenUtil().setWidth(10)),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _maxLines = 50;
                      });
                    },
                    child: Text(
                      widget.data["description"] ?? "",
                      maxLines: _maxLines,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Color.fromRGBO(155, 155, 155, 1)),
                    ),
                  )),
              Positioned(
                  left: ScreenUtil().setWidth(20),
                  top: -ScreenUtil().setWidth(30),
                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(2)),
                    child: !widget.data.isEmpty
                        ? Image.network(
                            widget.data["storelogoImg"],
                            width: ScreenUtil().setWidth(60),
                            height: ScreenUtil().setWidth(60),
                          )
                        : Icon(Icons.equalizer),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
