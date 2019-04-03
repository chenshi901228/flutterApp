import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/mine/userInfo.dart';
import '../../component/mine/asset.dart';
import '../../component/mine/myOrder.dart';
import '../../component/mine/partner.dart';
import '../../component/mine/dividend.dart';

import '../../blocs/main_bloc.dart';

bool initMine = true;

class MinePage extends StatefulWidget {
  @override
  _MineState createState() => new _MineState();
}

class _MineState extends State<MinePage> {
  void dispose() {
    super.dispose();
    initMine = true;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProviderMain.of(context);
    if (initMine) {
      initMine = false;
      bloc.getUserInfo();
    }
    return Scaffold(
        body: StreamBuilder(
      stream: bloc.userInfostream,
      builder: (context, snaphot) {
        return snaphot.data != null
            ? ListView(
                padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(20)),
                children: <Widget>[
                  new UserInfoComponent(
                    data: snaphot.data,
                  ),
                  new AssetComponent(
                    data: snaphot.data,
                  ),
                  new MyOrderComponent(),
                  new PartnerComponent(),
                  new DividendComponent()
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text("正在努力刷新数据！！！")
                  ],
                ),
              );
      },
    ));
  }
}
