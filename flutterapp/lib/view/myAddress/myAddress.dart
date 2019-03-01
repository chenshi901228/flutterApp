import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

import '../../component/myAddress/addressItem.dart';

class MyAddressPage extends StatefulWidget {
  @override
  _MyAddressState createState() => new _MyAddressState();
}

class _MyAddressState extends State<MyAddressPage> {
  final List _address = [
    {
      "name": "某某某",
      "phone": "13730602376",
      "address": "四川省成都市锦江区具体街道门牌号几栋几单元",
      "isdefault": true
    },
    {
      "name": "谁谁谁",
      "phone": "15346546544",
      "address": "四川省成都市锦江区具体街道门牌号几栋几单元",
      "isdefault": false
    },
    {
      "name": "他他他",
      "phone": "12345678911",
      "address": "四川省成都市锦江区具体街道门牌号几栋几单元",
      "isdefault": false
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color.fromRGBO(244, 244, 244, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setWidth(44)),
          child: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Image.asset(
                    "images/icon/backBtn_1.png",
                    width: ScreenUtil().setWidth(8),
                    height: ScreenUtil().setHeight(15),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                );
              },
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Routes.router.navigateTo(context, "/addAddressPage");
                  },
                  child: Text(
                    "添加新地址",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(12),
                        color: Color.fromRGBO(102, 102, 102, 1)),
                  ),
                ),
              )
            ],
            title: Text(
              "我的收获地址",
              style: TextStyle(
                  fontSize: ScreenUtil().setWidth(16),
                  color: Color.fromRGBO(51, 51, 51, 1)),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: _address.length,
          itemBuilder: (context, int index) {
            return new AddressItemComponent(data: _address[index]);
          },
        ));
  }
}
