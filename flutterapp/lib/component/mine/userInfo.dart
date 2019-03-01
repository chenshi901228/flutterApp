import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class UserInfoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: ScreenUtil.screenWidth,
          height: ScreenUtil().setWidth(200),
          color: Color.fromRGBO(74, 74, 74, 1),
          padding: EdgeInsets.only(top: ScreenUtil().setWidth(24)),
          child: Column(
            children: <Widget>[
              Stack(
                overflow: Overflow.visible,
                children: <Widget>[
                  ClipOval(
                    child: Image.asset(
                      "images/header_img.jpg",
                      width: ScreenUtil().setWidth(60),
                      height: ScreenUtil().setWidth(60),
                    ),
                  ),
                  Positioned(
                    left: ScreenUtil().setWidth(43),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(245, 166, 35, 1),
                          borderRadius:
                              BorderRadius.circular(ScreenUtil().setWidth(1))),
                      padding: EdgeInsets.symmetric(
                          horizontal: ScreenUtil().setWidth(3)),
                      child: Text("领导人",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(10),
                              color: Colors.white)),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setWidth(6),
                    bottom: ScreenUtil().setWidth(2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "images/icon/star.png",
                      width: ScreenUtil().setWidth(14),
                      height: ScreenUtil().setWidth(14),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(3),
                    ),
                    Image.asset(
                      "images/icon/star.png",
                      width: ScreenUtil().setWidth(14),
                      height: ScreenUtil().setWidth(14),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(3),
                    ),
                    Image.asset(
                      "images/icon/star.png",
                      width: ScreenUtil().setWidth(14),
                      height: ScreenUtil().setWidth(14),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setWidth(2)),
                child: Text(
                  "这里是用户的昵称",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12), color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setWidth(2)),
                child: Text(
                  "推荐人：某某某",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12), color: Colors.white),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setWidth(2)),
                child: Text(
                  "邀请码：24541",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12), color: Colors.white),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: ScreenUtil().setWidth(2)),
                  child: Text(
                    "本月消费：100000.00",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(12), color: Colors.white),
                  )),
            ],
          ),
        ),
        Positioned(
          right: ScreenUtil().setWidth(10),
          top: ScreenUtil().setWidth(15),
          child: GestureDetector(
            onTap: () {
              Routes.router.navigateTo(context, "/settingPage");
            },
            child: Image.asset(
              "images/icon/setting.png",
              width: ScreenUtil().setWidth(16),
              height: ScreenUtil().setWidth(16),
            ),
          ),
        )
      ],
    );
  }
}
