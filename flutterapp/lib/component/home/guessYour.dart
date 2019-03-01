import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class GuessYourComponent extends StatefulWidget {
  @override
  _GuessYourState createState() => new _GuessYourState();
}

class _GuessYourState extends State<GuessYourComponent> {
  @override
  Widget build(BuildContext context) {
    GestureDetector item(String title) {
      return GestureDetector(
        onTap: () {
          Routes.router.navigateTo(context, "/goodsDetailsPage");
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(3))),
          child: Column(
            children: <Widget>[
              Image.asset(
                "images/cs.jpg",
                width: ScreenUtil().setWidth(177),
                height: ScreenUtil().setWidth(177),
                fit: BoxFit.fill,
              ),
              Container(
                width: ScreenUtil().setWidth(177),
                padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: ScreenUtil().setWidth(34),
                      child: Text(
                        title,
                        softWrap: true,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(12),
                            color: Color.fromRGBO(51, 51, 51, 1)),
                      ),
                    ),
                    SizedBox(
                      height: ScreenUtil().setWidth(5),
                    ),
                    Text(
                      "￥390.00",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Color.fromRGBO(255, 85, 85, 1)),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    return Container(
      color: Color.fromRGBO(243, 243, 243, 1),
      padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
            child: Text(
              "猜你喜欢",
              style: TextStyle(fontSize: ScreenUtil().setSp(14)),
            ),
          ),
          Wrap(
            spacing: ScreenUtil().setWidth(5),
            runSpacing: ScreenUtil().setWidth(5),
            children: <Widget>[
              item("雅诗兰黛 dw 持妆轻透粉底液 油皮亲妈轻透全新版雅诗兰黛 dw 持妆轻透粉底液 油皮亲妈轻透全新版"),
              item("雅诗兰黛"),
              item("Fresh 馥蕾诗红茶 紧致 修护 面膜"),
              item("ZARA 正品保证 色块拼接运动 卫衣"),
              item("阿迪达斯adidas 三叶草男女经 典款运动鞋拼色"),
              item("阿迪达斯adidas 三叶草男女经 典款运动鞋拼色"),
            ],
          )
        ],
      ),
    );
  }
}
