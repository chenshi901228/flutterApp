import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/shoppingCart/item_component.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartState createState() => new _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCartPage> {
  List data = [
    {
      "id": 0,
      "name": "miu miu缪缪粉漾女士新款粉色香水女香氛 女士淡香氛100ml",
      "size": "100ml",
      "price": 2019,
      "imgUrl": "images/goods1.jpg",
      "isSelect": false
    },
    {
      "id": 1,
      "name": "日本进口正品白色恋人饼干套盒夹心饼干 一盒黑白饼干 24枚/盒",
      "size": "100ml",
      "price": 219,
      "imgUrl": "images/goods1.jpg",
      "isSelect": false
    },
    {
      "id": 2,
      "name": "祖玛珑苦橙香氛圣诞限量100ML Jo Malone Jo Malone London",
      "price": 1089,
      "imgUrl": "images/goods1.jpg",
      "isSelect": false
    },
    {
      "id": 3,
      "name": "miu miu缪缪粉漾女士新款粉色香水女香氛 女士淡香氛100ml",
      "size": "100ml",
      "price": 2019,
      "imgUrl": "images/goods1.jpg",
      "isSelect": false
    },
    {
      "id": 4,
      "name": "日本进口正品白色恋人饼干套盒夹心饼干 一盒黑白饼干 24枚/盒",
      "size": "100ml",
      "price": 419.2,
      "imgUrl": "images/goods1.jpg",
      "isSelect": false
    },
    {
      "id": 5,
      "name": "祖玛珑苦橙香氛圣诞限量100ML Jo Malone Jo Malone London",
      "price": 219,
      "imgUrl": "images/goods1.jpg",
      "isSelect": false
    },
  ];
  bool _isSelectAll = false;
  String _headerRightTest = "管理";
  bool _clearOrDelete = true;
  void clearOrDeleteFuc(String text) {
    setState(() {
      if (text == "管理") {
        _headerRightTest = "完成";
        _clearOrDelete = false;
      } else {
        _headerRightTest = "管理";
        _clearOrDelete = true;
      }
    });
  }

  void deletemany() {
    var newList = [];
    data.forEach((item) {
      if (item["isSelect"] == false) {
        newList.add(item);
      }
    });
    setState(() {
      data = newList;
      if (newList.length == 0) {
        _isSelectAll = false;
      }
    });
    Navigator.pop(context);
  }

  void deleteFuc() {
    showDialog<Null>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
            contentPadding: EdgeInsets.all(0),
            content: Container(
              height: ScreenUtil().setWidth(117),
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setWidth(68),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: ScreenUtil().setWidth(1),
                                color: Color.fromRGBO(242, 242, 242, 1)))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          data.length == 0 ? "你还没有选择要删除的宝贝" : "确认删除这些宝贝吗？",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Color.fromRGBO(102, 102, 102, 1)),
                        ),
                        Text(
                          data.length == 0 ? "" : "删除之后不能再找回哦",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              color: Color.fromRGBO(153, 153, 153, 1)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: ScreenUtil().setWidth(48),
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                child: Text(
                                  "取消",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color.fromRGBO(102, 102, 102, 1)),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                        Expanded(
                          child: GestureDetector(
                              onTap: () {
                                data.length == 0
                                    ? Navigator.pop(context)
                                    : deletemany();
                              },
                              child: Container(
                                height: ScreenUtil().setWidth(48),
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                child: Text(
                                  data.length == 0 ? "确认" : "删除",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color.fromRGBO(255, 89, 89, 1)),
                                  textAlign: TextAlign.center,
                                ),
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ));
      },
    );
  }

  selectOneFuc(value) {
    setState(() {
      int number = 0;
      data.forEach((item) {
        if (item["id"] == value) {
          item["isSelect"] = !item["isSelect"];
        }
      });
      data.forEach((item) {
        if (item["isSelect"] == false) {
          _isSelectAll = false;
        } else {
          number++;
          if (number == data.length) {
            _isSelectAll = true;
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    GestureDetector clearBtn() {
      return GestureDetector(
        onTap: () {
          print("结算");
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(26),
              vertical: ScreenUtil().setWidth(6)),
          decoration: BoxDecoration(
              color: Color.fromRGBO(255, 102, 102, 1),
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(18))),
          child: Text("去结算",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(13), color: Colors.white)),
        ),
      );
    }

    GestureDetector deleteBtn() {
      return GestureDetector(
        onTap: () {
          deleteFuc();
        },
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(26),
              vertical: ScreenUtil().setWidth(6)),
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(255, 85, 85, 1)),
              borderRadius: BorderRadius.circular(ScreenUtil().setWidth(16))),
          child: Text("删除",
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(13),
                  color: Color.fromRGBO(255, 85, 85, 1))),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 243, 243, 1),
      appBar: PreferredSize(
        child: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "购物车",
            style: TextStyle(
                fontSize: ScreenUtil().setSp(16),
                color: Color.fromRGBO(51, 51, 51, 1)),
          ),
          actions: <Widget>[
            Container(
              width: ScreenUtil().setWidth(50),
              child: FlatButton(
                onPressed: () {
                  clearOrDeleteFuc(_headerRightTest);
                },
                padding: EdgeInsets.only(right: 0),
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Text(
                  _headerRightTest,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(14),
                      color: Color.fromRGBO(155, 155, 155, 1)),
                ),
              ),
            )
          ],
        ),
        preferredSize: Size.fromHeight(ScreenUtil().setWidth(44)),
      ),
      // 内容区-----------------------------------------------------------------------
      body: ListView(
        padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
        children: data.map((item) {
          return new ItemComponent(
            data: item,
            isSelectAll: _isSelectAll,
            handle: (value) => selectOneFuc(value),
          );
        }).toList(),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        child: Container(
          height: ScreenUtil().setWidth(46),
          padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(10),
              vertical: ScreenUtil().setWidth(8)),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isSelectAll = !_isSelectAll;
                        data.forEach((item) {
                          item["isSelect"] = _isSelectAll;
                        });
                      });
                    },
                    child: Image.asset(
                      _isSelectAll
                          ? "images/icon/isactive.png"
                          : "images/icon/noactive.png",
                      width: ScreenUtil().setWidth(15),
                      height: ScreenUtil().setWidth(15),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Text(
                    "全选",
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(13),
                        color: Color.fromRGBO(155, 155, 155, 1)),
                  )
                ],
              ),
              _clearOrDelete ? clearBtn() : deleteBtn()
            ],
          ),
        ),
      ),
    );
  }
}
