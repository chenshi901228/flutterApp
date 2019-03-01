import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/mine/userInfo.dart';
import '../../component/mine/asset.dart';
import '../../component/mine/myOrder.dart';
import '../../component/mine/partner.dart';
import '../../component/mine/dividend.dart';

class MinePage extends StatefulWidget {
  @override
  _MineState createState() => new _MineState();
}

class _MineState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
      children: <Widget>[
        new UserInfoComponent(),
        new AssetComponent(),
        new MyOrderComponent(),
        new PartnerComponent(),
        new DividendComponent()
      ],
    );
  }
}
