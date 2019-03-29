import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/main_bloc.dart';

import './tab_item.dart';

class TabDefaultComponent extends StatefulWidget {
  @override
  _TabDefaultState createState() => new _TabDefaultState();
}

class _TabDefaultState extends State<TabDefaultComponent> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProviderMain.of(context);
    ScreenUtil.instance = ScreenUtil(width: 375, height: 667)..init(context);
    return StreamBuilder(
      stream: bloc.classifystream,
      initialData: bloc.classifyList,
      builder: (context, snapshot) {
        return !snapshot.data.isEmpty
            ? ListView(
                padding: EdgeInsets.all(ScreenUtil().setWidth(7)),
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: ScreenUtil().setWidth(7),
                    children: snapshot.data.map<Widget>((f) {
                      return TabItemComponent(
                        data: f,
                      );
                    }).toList(),
                  ),
                ],
              )
            : Container(
                alignment: Alignment.center,
                child: Text("没有数据！！！"),
              );
      },
    );
  }
}
