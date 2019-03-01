import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './diyRadio.dart';

class Modal extends StatefulWidget {
  @override
  _Modal createState() => new _Modal();
}

class _Modal extends State<Modal> {
  String _checkedValue = "100ml";
  int _number = 1;
  @override
  Widget build(BuildContext context) {
    Container sizeCheckItem() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "颜色分类",
              style: TextStyle(
                  fontSize: ScreenUtil().setWidth(13),
                  color: Color.fromRGBO(51, 51, 51, 1)),
            ),
            SizedBox(
              height: ScreenUtil().setWidth(10),
            ),
            Wrap(
              spacing: ScreenUtil().setWidth(10),
              runSpacing: ScreenUtil().setWidth(10),
              children: <Widget>[
                DiyRadioBtn(
                    value: "100ml",
                    groupValue: _checkedValue,
                    onChanged: (value) {
                      setState(() {
                        _checkedValue = value;
                      });
                    }),
                DiyRadioBtn(
                    value: "50ml",
                    groupValue: _checkedValue,
                    onChanged: (value) {
                      setState(() {
                        _checkedValue = value;
                      });
                    }),
                DiyRadioBtn(
                    value: "150ml",
                    groupValue: _checkedValue,
                    onChanged: (value) {
                      setState(() {
                        _checkedValue = value;
                      });
                    }),
                DiyRadioBtn(
                    value: "250ml",
                    groupValue: _checkedValue,
                    onChanged: (value) {
                      setState(() {
                        _checkedValue = value;
                      });
                    }),
                DiyRadioBtn(
                    value: "200ml",
                    groupValue: _checkedValue,
                    onChanged: (value) {
                      setState(() {
                        _checkedValue = value;
                      });
                    }),
                DiyRadioBtn(
                    value: "10ml",
                    groupValue: _checkedValue,
                    onChanged: (value) {
                      setState(() {
                        _checkedValue = value;
                      });
                    }),
              ],
            )
          ],
        ),
      );
    }

    Container numberChoose() {
      return Container(
        margin: EdgeInsets.only(top: ScreenUtil().setWidth(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("购买数量"),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    if (_number <= 1) {
                      setState(() {
                        _number = 1;
                      });
                    } else {
                      setState(() {
                        _number--;
                      });
                    }
                  },
                  child: Image.asset(
                    "images/icon/decrease.png",
                    color: _number == 1 ? null : Colors.grey[600],
                    width: ScreenUtil().setWidth(21),
                    height: ScreenUtil().setWidth(21),
                  ),
                ),
                Container(
                  color: Color.fromRGBO(216, 216, 216, 1),
                  width: ScreenUtil().setWidth(34),
                  height: ScreenUtil().setWidth(21),
                  margin: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(1)),
                  child: TextField(
                    onChanged: (value) {
                      if (value == "" || int.parse(value) < 1) {
                        setState(() {
                          _number = 1;
                        });
                      } else {
                        setState(() {
                          _number = int.parse(value);
                        });
                      }
                    },
                    cursorWidth: 0,
                    controller: TextEditingController(text: _number.toString()),
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(13),
                        color: Color.fromRGBO(102, 102, 102, 1)),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 4),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _number++;
                    });
                  },
                  child: Image.asset(
                    "images/icon/increase.png",
                    width: ScreenUtil().setWidth(21),
                    height: ScreenUtil().setWidth(21),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    return Container(
        // height: ScreenUtil.screenHeight / 2,
        child: Scaffold(
            resizeToAvoidBottomPadding: false,
            bottomNavigationBar: BottomAppBar(
              elevation: 1,
              child: Container(
                  color: Colors.white,
                  padding:
                      EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "images/icon/ensureBtn.png",
                      width: ScreenUtil().setWidth(325),
                      height: ScreenUtil().setWidth(40),
                    ),
                  )),
            ),
            body: Container(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setWidth(20),
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(20)),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Image.asset(
                        "images/goods_img.jpg",
                        width: ScreenUtil().setWidth(90),
                        height: ScreenUtil().setWidth(90),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(6),
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "￥1260.00",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(16),
                                color: Color.fromRGBO(255, 102, 102, 1)),
                          ),
                          SizedBox(
                            height: ScreenUtil().setWidth(6),
                          ),
                          Text(
                            "选择颜色分类",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(12),
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(21),
                  ),
                  Expanded(
                    child: ListView(
                      children: <Widget>[sizeCheckItem(), numberChoose()],
                    ),
                  )
                ],
              ),
            )));
  }
}
