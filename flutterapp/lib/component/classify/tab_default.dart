import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './tab_item.dart';

class TabDefaultComponent extends StatefulWidget {
  @override
  _TabDefaultState createState() => new _TabDefaultState();
}

class _TabDefaultState extends State<TabDefaultComponent> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return ListView(
      padding: EdgeInsets.all(ScreenUtil().setWidth(7)),
      children: <Widget>[
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          runSpacing: ScreenUtil().setWidth(7),
          children: <Widget>[
            new TabItemComponent(
              name: "祖玛珑香氛蜡烛",
            ),
            new TabItemComponent(
              name:
                  "祖玛珑乌木与佛手柑香水男士 100ML Jo Malone London祖玛珑乌木与佛手柑香水男士 100ML Jo Malone London  ",
            ),
            new TabItemComponent(
              name: "祖玛珑限量金装英国梨与小苍 兰香水100ML",
            ),
            new TabItemComponent(
              name: "祖玛珑沐浴露250ML系列 蓝 风铃 Jo Malone London ",
            ),
            new TabItemComponent(
              name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
            ),
            new TabItemComponent(
              name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
            ),
            new TabItemComponent(
              name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
            ),
            new TabItemComponent(
              name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
            ),
            new TabItemComponent(
              name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
            ),
            new TabItemComponent(
              name: "祖玛珑香氛蜡烛200g 全系列 蓝风铃 Jo Malone London",
            ),
          ],
        ),
      ],
    );
  }
}
