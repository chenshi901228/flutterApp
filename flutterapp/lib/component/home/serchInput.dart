import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SerchInputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return Container(
        height: ScreenUtil().setHeight(44),
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("成都"),
            Container(
              width: ScreenUtil().setWidth(300),
              child: Material(
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setHeight(15)),
                  color: Color.fromRGBO(155, 155, 155, 0.5),
                  child: Stack(
                    children: <Widget>[
                      TextField(
                          style: TextStyle(
                              color: Color.fromRGBO(155, 155, 155, 1)),
                          decoration: InputDecoration(
                              hintText: "搜你喜欢的",
                              hintStyle: TextStyle(
                                  fontSize: ScreenUtil().setSp(12),
                                  color: Color.fromRGBO(155, 155, 155, 1)),
                              contentPadding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(6),
                                  bottom: ScreenUtil().setHeight(6),
                                  left: ScreenUtil().setHeight(40)),
                              border: InputBorder.none)),
                      Positioned(
                        left: ScreenUtil().setWidth(10),
                        top: ScreenUtil().setHeight(6),
                        child: Image.asset(
                          "images/icon/serch.png",
                          width: ScreenUtil().setWidth(20),
                          height: ScreenUtil().setHeight(20),
                        ),
                      )
                    ],
                  )),
            )
          ],
        ));
  }
}
