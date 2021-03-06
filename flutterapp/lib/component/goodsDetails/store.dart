import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class StoreComponent extends StatelessWidget {
  StoreComponent({Key key, this.data}) : super(key: key);
  final data;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: ScreenUtil().setWidth(68),
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(2)),
                  child: Image.network(
                    data["store_logo"] ??
                        'http://flutterapi.chenshiservice.cn/1552615794803-TB2EN44z1uSBuNjSsziXXbq8pXa_!!47839804.jpg',
                    width: ScreenUtil().setWidth(48),
                    height: ScreenUtil().setWidth(48),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(11),
                ),
                Container(
                  width: ScreenUtil().setWidth(220),
                  child: Text(data["store"] ?? "",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: ScreenUtil().setSp(13))),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Routes.router.navigateTo(
                  context, "/storePage?storeId=${data["store_id"]}");
            },
            child: Image.asset(
              "images/icon/goBrand.png",
              width: ScreenUtil().setWidth(66),
              height: ScreenUtil().setWidth(24),
            ),
          )
        ],
      ),
    );
  }
}
