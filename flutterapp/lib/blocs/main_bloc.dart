import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/httpRequest.dart';
import '../utils/routes.dart';

class MainBLoC {
  // ==============首页初始化数据
  Map _count = {};
  var _subject = BehaviorSubject<Map>();
  Stream<Map> get stream => _subject.stream;
  Map get value => _count;
  //================首页初始化数据

  //===================商品详情
  Map _goodsDetails = {};
  var _goods = BehaviorSubject<Map>();
  Stream<Map> get goodsstream => _goods.stream;
  Map get goodsDetails => _goodsDetails;
  //===================商品详情

  //==================商品规格选择
  Map _goodsSizeChoice = {};
  var _goodsSize = BehaviorSubject<Map>();
  Stream<Map> get goodsSizestream => _goodsSize.stream;
  Map get goodsSizeChoice => _goodsSizeChoice;
  //==================商品规格选择

  //==================购物车列表
  List _shoppingCartList = [];
  var _shoppingCartBLOC = BehaviorSubject<List>();
  Stream<List> get shoppingCartstream => _shoppingCartBLOC.stream;
  List get shoppingCartList => _shoppingCartList;

  bool _isSelectAll = false;
  var _isSelectAllBloc = BehaviorSubject<bool>();
  Stream<bool> get isSelectAllstream => _isSelectAllBloc.stream;
  bool get isSelectAll => _isSelectAll;

  //==================购物车列表

  // ==================店铺
  Map _store = {};
  var _storeBloc = BehaviorSubject<Map>();
  Stream<Map> get storestream => _storeBloc.stream;
  Map get storeDetails => _store;
  // ==================店铺

  // ===================首页分类
  List _classifyList = [];
  var _classifyBloc = BehaviorSubject<List>();
  Stream<List> get classifystream => _classifyBloc.stream;
  List get classifyList => _classifyList;

  // ===================首页分类

  //登录
  void login(params, form, context) async {
    try {
      final data = await HttpUtil().post("/admin/login", params: params);
      if (data["code"] == 1) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setString("token", data["token"]);
        preferences.setString("userId", data["id"].toString());
        form.reset();
        Routes.router.navigateTo(context, '/');
        init(context);
      } else {
        Fluttertoast.showToast(msg: data["msg"]);
      }
    } catch (error) {
      print(error);
    }
  }

  //首页初始化
  void init(BuildContext context) async {
    print("==================初始化");
    try {
      final data = await HttpUtil().post("/init/initHomePage");
      if (data["code"] == 0) {
        showDialog<Null>(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("登录失效，请重新登录"),
              );
            }).then((val) {
          Routes.router.navigateTo(context, "/login");
        });
      } else {
        _subject.add(data);
      }
    } catch (err) {
      print(err);
    }
  }

  //获取商品详情
  void goodsDetailsInit(BuildContext context, int goodsId) async {
    print("===============商品详情");
    _goodsSize.add({});
    try {
      final res =
          await HttpUtil().post("/goods/getOne", params: {"id": goodsId});
      if (res["code"] == 1) {
        _goods.add(res["goodsDetails"]);
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

  //商品规格
  void goodsSizeChoose(params) {
    _goodsSize.add(params);
  }

  //添加到购物车
  void addToShoppingCart() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var userId = int.parse(preferences.getString("userId"));
    var goodsId = _goods.value;
    if (_goodsSize.value.isEmpty) {
      Fluttertoast.showToast(
          msg: "你还没有选择规格",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 1,
          backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
          textColor: Colors.white,
          fontSize: ScreenUtil().setSp(12));
    } else {
      Map params = {};
      params["goodsId"] = goodsId["id"];
      params["adminId"] = userId;
      params["size"] = _goodsSize.value["size"];
      params["count"] = _goodsSize.value["count"];
      try {
        final res =
            await HttpUtil().post("/shoppingCart/addTo", params: params);
        if (res["code"] == 1) {
          Fluttertoast.showToast(
              msg: "添加成功，在购物车等您~",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
              textColor: Colors.white,
              fontSize: ScreenUtil().setSp(12));
        } else {
          Fluttertoast.showToast(
              msg: res["msg"],
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIos: 1,
              backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
              textColor: Colors.white,
              fontSize: ScreenUtil().setSp(12));
        }
      } catch (error) {
        print(error);
      }
    }
  }

  //获取购物车列表
  void initShoppingCart(BuildContext context) async {
    print("=================购物车列表");
    _isSelectAllBloc.add(false);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final userId = preferences.getString("userId");
    try {
      final res = await HttpUtil()
          .post("/shoppingCart/list", params: {"adminId": int.parse(userId)});
      if (res["code"] == 1) {
        final list = res["list"].map((f) {
          f["isSelect"] = false;
          return f;
        }).toList();
        _shoppingCartBLOC.add(list);
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

  // 购物车选中商品
  void goodsSelectOne(int shoppingCartId) {
    List list = _shoppingCartBLOC.value;
    list.forEach((f) {
      if (f["shoppingCartId"] == shoppingCartId) {
        f["isSelect"] = !f["isSelect"];
      }
    });
    bool isSelectAll = list.every((test) => test["isSelect"]);
    _isSelectAllBloc.add(isSelectAll);
    _shoppingCartBLOC.add(list);
  }

  // 购物车全选反选
  void selectAll() {
    List list = _shoppingCartBLOC.value;
    _isSelectAllBloc.add(!_isSelectAllBloc.value);
    list.forEach((f) {
      f["isSelect"] = _isSelectAllBloc.value;
    });
    _shoppingCartBLOC.add(list);
  }

  // 购物车改变商品数量
  void countChange(Map params) async {
    List list = _shoppingCartBLOC.value;
    int newCount = 0;
    switch (params["type"]) {
      case "decrease":
        list.forEach((f) {
          if (f["shoppingCartId"] == params["shoppingCartId"]) {
            f["count"]--;
            newCount = f["count"];
          }
        });
        break;
      case "increase":
        list.forEach((f) {
          if (f["shoppingCartId"] == params["shoppingCartId"]) {
            f["count"]++;
            newCount = f["count"];
          }
        });
        break;
      default:
        list.forEach((f) {
          if (f["shoppingCartId"] == params["shoppingCartId"]) {
            f["count"] = params["newCount"];
            newCount = f["count"];
          }
        });
    }
    if (newCount == 0) {
      list.removeWhere(
          (item) => item["shoppingCartId"] == params["shoppingCartId"]);
      _shoppingCartBLOC.add(list);
      await HttpUtil().post("/shoppingCart/deleteOne", params: {
        "shoppingCartId": [params["shoppingCartId"]]
      });
    } else {
      _shoppingCartBLOC.add(list);
      await HttpUtil().post("/shoppingCart/edit",
          params: {"id": params["shoppingCartId"], "count": newCount});
    }
  }

  // 删除购物车商品
  void deleteSome(BuildContext context) async {
    List list = _shoppingCartBLOC.value;
    List willDeleteList = list.map((f) {
      if (f["isSelect"]) {
        return f["shoppingCartId"];
      }
    }).toList()
      ..retainWhere((test) => test.runtimeType == int);
    final res = await HttpUtil().post("/shoppingCart/deleteOne",
        params: {"shoppingCartId": willDeleteList});
    if (res["code"] == 1) {
      list.retainWhere((f) => f["isSelect"] == false);
      _shoppingCartBLOC.add(list);
    }
    _isSelectAllBloc.add(false);
    Navigator.pop(context);
  }

  // 店铺初始化
  void initStore(int storeId) async {
    print("=====================店铺详情");
    final res = await HttpUtil()
        .post("/store/storeDetails", params: {"storeId": storeId});
    if (res["code"] == 1) {
      _storeBloc.add(res["list"]);
    }
  }

  // 首页分类初始化
  void initClassify(String title) async {
    final res = await HttpUtil()
        .post("/classify/getGoodsList", params: {"classify": title});
    if (res["code"] == 1) {
      _classifyBloc.add(res["goodsList"]);
    }
  }

  void dispose() {
    _subject.close();
    _goods.close();
    _goodsSize.close();
    _shoppingCartBLOC.close();
    _isSelectAllBloc.close();
    _storeBloc.close();
    _classifyBloc.close();
  }
}

class BlocProviderMain extends InheritedWidget {
  final MainBLoC bLoC = MainBLoC();

  BlocProviderMain({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static MainBLoC of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(BlocProviderMain)
              as BlocProviderMain)
          .bLoC;
}
