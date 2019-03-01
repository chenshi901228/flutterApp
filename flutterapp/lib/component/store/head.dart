import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadComponent extends StatefulWidget {
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
            child: Image.asset(
              "images/storeBgm.jpg",
              fit: BoxFit.fill,
            ),
          ),
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Container(
                  color: Colors.white,
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
                      "英国知名品牌祖·玛珑JO MALONE LONDON，属于雅诗兰黛 集团属于雅诗兰黛 集团属于雅诗兰黛 集团属于雅诗兰黛 集团属于雅诗兰黛 集团属于雅诗兰黛 集团，其香水以简单而纯粹为诸多明星喜爱。质朴的包装，透 露着浓厚的英伦风情。JO MALONE是一家位于伦敦的…",
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
                    child: Image.asset(
                      "images/storeImg.png",
                      width: ScreenUtil().setWidth(60),
                      height: ScreenUtil().setWidth(60),
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
