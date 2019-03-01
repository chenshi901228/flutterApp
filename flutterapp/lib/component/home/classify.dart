import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class ClassifyComponent extends StatefulWidget {
  @override
  _ClassifyState createState() => new _ClassifyState();
}

class _ClassifyState extends State<ClassifyComponent> {
  final List _classifys = [
    "白金尊享",
    "焕颜洗护",
    "全球味道",
    "妈咪宝贝",
    "轻奢生活",
    "精致厨房",
    "精品惠选",
    "口袋记忆"
  ];
  @override
  Widget build(BuildContext context) {
    GestureDetector classifyItem(String title) {
      return GestureDetector(
        onTap: () {
          Routes.router.navigateTo(context, "/classIfyPage");
        },
        child: Container(
            width: ScreenUtil().setWidth(68),
            height: ScreenUtil().setWidth(68),
            alignment: Alignment.center,
            padding:
                EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(18)),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(2)),
                border: Border.all(color: Color.fromRGBO(155, 155, 155, 1))),
            child: Text(
              title,
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Color.fromRGBO(155, 155, 155, 1)),
            )),
      );
    }

    return Container(
        color: Colors.white,
        // height: ScreenUtil().setHeight(186),
        padding: EdgeInsets.symmetric(
            vertical: ScreenUtil().setWidth(20),
            horizontal: ScreenUtil().setWidth(20)),
        child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: ScreenUtil().setWidth(10),
            spacing: ScreenUtil().setWidth(21),
            children: _classifys.map((item) {
              return classifyItem(item);
            }).toList()));
  }
}
