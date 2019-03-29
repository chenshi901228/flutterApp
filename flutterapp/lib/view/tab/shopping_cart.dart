import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../component/shoppingCart/item_component.dart';

import '../../blocs/main_bloc.dart';

bool shoppingCartInit = true;

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartState createState() => new _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCartPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  String _headerRightTest = "管理";
  bool _clearOrDelete = true;

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

  deleteFuc(List data, bloc) {
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
                                    : bloc.deleteSome(context);
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

  void dispose() {
    super.dispose();
    shoppingCartInit = true;
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProviderMain.of(context);
    if (shoppingCartInit) {
      shoppingCartInit = false;
      bloc.initShoppingCart(context);
    }
    // 结算
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

    // 删除
    StreamBuilder deleteBtn() {
      return StreamBuilder(
        stream: bloc.shoppingCartstream,
        initialData: bloc.shoppingCartList,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              deleteFuc(snapshot.data, bloc);
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(26),
                  vertical: ScreenUtil().setWidth(6)),
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(255, 85, 85, 1)),
                  borderRadius:
                      BorderRadius.circular(ScreenUtil().setWidth(16))),
              child: Text("删除",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(13),
                      color: Color.fromRGBO(255, 85, 85, 1))),
            ),
          );
        },
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
      body: StreamBuilder(
        stream: bloc.shoppingCartstream,
        initialData: bloc.shoppingCartList,
        builder: (context, snapshot) {
          return snapshot.data != null
              ? ListView(
                  padding: EdgeInsets.only(bottom: ScreenUtil().setWidth(10)),
                  children: snapshot.data.map<Widget>((item) {
                    return new ItemComponent(
                      data: item,
                    );
                  }).toList(),
                )
              : SizedBox();
        },
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
                        bloc.selectAll();
                      },
                      child: StreamBuilder(
                        stream: bloc.isSelectAllstream,
                        initialData: bloc.isSelectAll,
                        builder: (context, snapshot) {
                          return Image.asset(
                            snapshot.data
                                ? "images/icon/isactive.png"
                                : "images/icon/noactive.png",
                            width: ScreenUtil().setWidth(15),
                            height: ScreenUtil().setWidth(15),
                          );
                        },
                      )),
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
