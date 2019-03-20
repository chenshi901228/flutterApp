import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class ClassifyComponent extends StatefulWidget {
  ClassifyComponent({Key key, this.data}) : super(key: key);
  final List data;
  @override
  _ClassifyState createState() => new _ClassifyState();
}

class _ClassifyState extends State<ClassifyComponent> {
  @override
  Widget build(BuildContext context) {
    List _this = widget.data ?? [];
    GestureDetector classifyItem(String title) {
      return GestureDetector(
        onTap: () {
          if (title != "虚位以待") {
            Routes.router.navigateTo(context, "/classIfyPage");
          }
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
            // alignment: WrapAlignment.spaceBetween,
            runSpacing: ScreenUtil().setWidth(10),
            spacing: ScreenUtil().setWidth(21),
            children: _this.map((item) {
              return classifyItem(item["title"]);
            }).toList()));
  }
}
