import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import './obligationItem.dart';

class ObligationComponent extends StatefulWidget {
  @override
  _ObligationState createState() => new _ObligationState();
}

class _ObligationState extends State<ObligationComponent> {
  bool _selectAll = false;
  final List _data = [
    {
      "name": "nars限量高光散粉 珠光腮红 蜜粉 定妆粉修容orgasm",
      "img": "images/goods_img.jpg",
      "number": 2,
      "size": "",
      "price": 150.22,
      "select": false
    },
    {
      "name": "日本进口正品白色恋人饼干 套盒夹心饼干一盒黑白饼干 24枚/盒",
      "img": "images/goods1.jpg",
      "number": 3,
      "size": "1盒",
      "price": 502,
      "select": false
    },
    {
      "name": "祖玛珑苦橙香氛圣诞限量100ML Jo Malone London",
      "img": "images/storeBgm.jpg",
      "number": 1,
      "size": "100ml",
      "price": 2534,
      "select": false
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      bottomNavigationBar: BottomAppBar(
        elevation: 4,
        child: Container(
          height: ScreenUtil().setWidth(46),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectAll = !_selectAll;
                        _data.forEach((item) {
                          item["select"] = _selectAll;
                        });
                      });
                    },
                    child: Image.asset(
                      _selectAll
                          ? "images/icon/isactive.png"
                          : "images/icon/noactive.png",
                      width: ScreenUtil().setWidth(15),
                      height: ScreenUtil().setWidth(15),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Text("全选",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: Color.fromRGBO(155, 155, 155, 1)))
                ],
              ),
              GestureDetector(
                onTap: () {
                  print("付款");
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: ScreenUtil().setWidth(9),
                      horizontal: ScreenUtil().setWidth(18)),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 102, 102, 1),
                    borderRadius:
                        BorderRadius.circular(ScreenUtil().setWidth(18)),
                  ),
                  child: Text("合并付款",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(13),
                          color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _data.length,
        itemBuilder: (context, int index) {
          return ObligationItem(
            data: _data[index],
            onChanged: () {
              setState(() {
                int number = 0;
                _data[index]["select"] = !_data[index]["select"];
                if (!_data[index]["select"]) {
                  _selectAll = false;
                }
                _data.forEach((item) {
                  if (item["select"]) {
                    number++;
                  }
                });
                if (number == _data.length) {
                  _selectAll = true;
                }
              });
            },
          );
        },
      ),
    );
  }
}
