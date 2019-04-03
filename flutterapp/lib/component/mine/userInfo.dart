import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

import '../../blocs/main_bloc.dart';

class BannerDiy extends CustomPainter {
  var _paint = new Paint()
    ..color = Color.fromRGBO(74, 74, 74, 1)
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.fill
    ..strokeWidth = 2.0;

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制代码
    Path path = new Path();
    path.moveTo(0.0, 0.0);
    path.lineTo(ScreenUtil.screenWidth / 2, 0.0);
    path.lineTo(ScreenUtil.screenWidth / 2, ScreenUtil().setWidth(200));
    path.lineTo(0.0, ScreenUtil().setWidth(200));
    path.close();
    canvas.drawPath(path, _paint);
    path.moveTo(0.0, ScreenUtil().setWidth(200));
    path.conicTo(ScreenUtil.screenWidth / 4, ScreenUtil().setWidth(230),
        ScreenUtil.screenWidth / 2, ScreenUtil().setWidth(200), 1.0);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class UserInfoComponent extends StatelessWidget {
  UserInfoComponent({Key key, this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProviderMain.of(context);

    Widget starBuilder(int length) {
      List list = [];
      for (var i = 0; i < length; i++) {
        list.add(
          Image.asset(
            "images/icon/star.png",
            width: ScreenUtil().setWidth(14),
            height: ScreenUtil().setWidth(14),
          ),
        );
      }
      return Wrap(
        spacing: ScreenUtil().setWidth(3),
        children: list.map<Widget>((f) {
          return f;
        }).toList(),
      );
    }

    return Stack(
      children: <Widget>[
        Container(
          height: ScreenUtil().setWidth(216),
          color: Colors.white,
        ),
        CustomPaint(
          painter: BannerDiy(),
        ),
        Container(
            width: ScreenUtil.screenWidth,
            height: ScreenUtil().setWidth(216),
            padding: EdgeInsets.only(top: ScreenUtil().setWidth(41)),
            child: StreamBuilder(
              stream: bloc.userInfostream,
              builder: (context, snaphot) {
                return Column(
                  children: <Widget>[
                    Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        ClipOval(
                            child: data["headImg"] == null
                                ? Container(
                                    width: ScreenUtil().setWidth(60),
                                    height: ScreenUtil().setWidth(60),
                                    color: Color.fromRGBO(216, 216, 216, 1),
                                    child: Center(
                                      child: Text(
                                        "头像",
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(12),
                                            color:
                                                Color.fromRGBO(51, 51, 51, 1)),
                                      ),
                                    ),
                                  )
                                : Image.network(
                                    data["headImg"],
                                    width: ScreenUtil().setWidth(60),
                                    height: ScreenUtil().setWidth(60),
                                  )),
                        Positioned(
                          left: ScreenUtil().setWidth(43),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(245, 166, 35, 1),
                                borderRadius: BorderRadius.circular(
                                    ScreenUtil().setWidth(1))),
                            padding: EdgeInsets.symmetric(
                                vertical: ScreenUtil().setWidth(1),
                                horizontal: ScreenUtil().setWidth(3)),
                            child: Text(data["actor"],
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
                        child: starBuilder(data["level"])),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setWidth(2)),
                      child: Text(
                        data["nick_name"],
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setWidth(2)),
                      child: Text(
                        "推荐人：${data["referrer"]}",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: ScreenUtil().setWidth(2)),
                      child: Text(
                        "邀请码：${data["inviteCode"]}",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: ScreenUtil().setWidth(2)),
                        child: Text(
                          "本月消费：${data["consumptionOfMonth"].runtimeType == int ? data["consumptionOfMonth"].toString() + ".00" : data["consumptionOfMonth"]}",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              color: Colors.white),
                        )),
                  ],
                );
              },
            )),
        Positioned(
          right: ScreenUtil().setWidth(10),
          top: ScreenUtil().setWidth(33),
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
