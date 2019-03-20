import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/httpRequest.dart';
import '../../utils/routes.dart';
import '../../component/shoppingCart/item_component.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartState createState() => new _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCartPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  List data = [];
  bool _isSelectAll = false;
  String _headerRightTest = "管理";
  bool _clearOrDelete = true;
  int newCount = 0;

  getList() async {
    try {
      final res =
          await HttpUtil().post("/shoppingCart/list", params: {"adminId": 1});
      if (res["code"] == 1) {
        final list = res["list"].map((f) {
          f["isSelect"] = false;
          return f;
        }).toList();
        setState(() {
          data = list;
        });
      } else {
        showDialog<Null>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("登录失效，请重新登录"),
              );
            }).then((val) {
          Routes.router.navigateTo(context, "/login");
        });
      }
    } catch (error) {
      print(error);
    }
  }

  editOne(int id, int count) async {
    final res = await HttpUtil()
        .post("/shoppingCart/edit", params: {"id": id, "count": count});
    print(res);
  }

  void initState() {
    getList();
    super.initState();
  }

  clearOrDeleteFuc(String text) {
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

  deletemany() async {
    List willDeleteList = data.map((f) {
      if (f["isSelect"]) {
        return f["shoppingCartId"];
      }
    }).toList()
      ..retainWhere((test) => test.runtimeType == int);
    final res = await HttpUtil()
        .post("/shoppingCart/deleteOne", params: {"listId": willDeleteList});
    if (res["code"] == 1) {
      setState(() {
        data.retainWhere((f) => f["isSelect"] == false);
      });
    }
    Navigator.pop(context);
  }

  deleteFuc() {
    final t = data.any((f) {
      if (f["isSelect"]) {
        return true;
      } else {
        return false;
      }
    });
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
                          data.length == 0
                              ? "你的购物车为空"
                              : !t ? "还没有选中任何宝贝" : "确认删除选中的宝贝吗？",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Color.fromRGBO(102, 102, 102, 1)),
                        ),
                        Text(
                          data.length == 0 || !t ? "" : "删除之后不能再找回哦",
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
                                data.length == 0 || !t
                                    ? Navigator.pop(context)
                                    : deletemany();
                              },
                              child: Container(
                                height: ScreenUtil().setWidth(48),
                                alignment: Alignment.center,
                                color: Colors.transparent,
                                child: Text(
                                  data.length == 0 || !t ? "确认" : "删除",
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

  countChange(value) {
    switch (value["type"]) {
      case "decrease":
        setState(() {
          data.forEach((f) {
            if (f["shoppingCartId"] == value["shoppingCartId"] &&
                f["count"] > 1) {
              f["count"]--;
              newCount = f["count"];
            }
          });
        });
        break;
      case "increase":
        setState(() {
          data.forEach((f) {
            if (f["shoppingCartId"] == value["shoppingCartId"]) {
              f["count"]++;
              newCount = f["count"];
            }
          });
        });
        break;
      default:
        setState(() {
          data.forEach((f) {
            if (f["shoppingCartId"] == value["shoppingCartId"]) {
              f["count"] = value["newCount"];
              newCount = f["count"];
            }
          });
        });
    }
    editOne(value["shoppingCartId"], newCount);
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
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        child: AppBar(
          elevation: 1,
          backgroundColor: Colors.white,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "购物车(${data.length})",
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
            countChange: (value) => countChange(value),
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
