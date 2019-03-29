import 'package:fluro/fluro.dart';
import '../view/login_reg/login.dart'; //登录界面
import '../view/login_reg/forget.dart'; //忘记密码
import '../view/login_reg/reg.dart'; //注册
import '../view/tab/index.dart'; //首页
import '../view/classify/classify.dart'; //分类商品
import '../view/goodsDetails/goodsDetails.dart'; //商品详情
import '../view/store/store.dart'; //店铺页面
import '../view/confirmOrder/confirmOrder.dart'; //确认订单
import '../view/myAddress/myAddress.dart'; //我的收货地址
import '../view/order/order.dart'; //订单页
import '../view/dividendCenter/dividendCenter.dart'; //分红中心
import '../view/myFans/myFans.dart'; //我的粉丝
import '../view/checkLogistics/checkLogistics.dart'; //查看物流
import '../view/earningsReport/earningsReport.dart'; //收益报表
import '../view/earningsReport/orderClear.dart'; //订单结算明细
import '../view/earningsReport/withdrawalRecord.dart'; //提现记录
import '../view/earningsReport/balanceOfAccount.dart'; //账户余额
import '../view/setting/setting.dart'; //设置
import '../view/setting/personalData.dart'; //个人资料
import '../view/setting/modifyNickname.dart'; //修改昵称
import '../view/myAddress/addAddress.dart'; //添加新地址
import '../view/myAddress/editAddress.dart'; //编辑收货地址

class Routes {
  static Router router;
  static String indexPage = '/';
  static String loginPage = "/login";
  static String forgetPassWordPage = '/forgetPassWordPage';
  static String regPage = '/regPage';
  static String classIfyPage = '/classIfyPage';
  static String goodsDetailsPage = '/goodsDetailsPage';
  static String storePage = '/storePage';
  static String confirmOrderPage = '/confirmOrderPage';
  static String myAddressPage = '/myAddressPage';
  static String orderPage = '/orderPage';
  static String dividendCenterPage = '/dividendCenterPage';
  static String myFansPage = '/myFansPage';
  static String checkLogisticsPage = '/checkLogisticsPage';
  static String earningsReportPage = '/earningsReportPage';
  static String orderClearPage = '/orderClearPage';
  static String withdrawalRecordPage = '/withdrawalRecordPage';
  static String balanceOfAccountPage = '/balanceOfAccountPage';
  static String settingPage = '/settingPage';
  static String personalDataPage = '/personalDataPage';
  static String modifyNicknamePage = '/modifyNicknamePage';
  static String addAddressPage = '/addAddressPage';
  static String editAddressPage = '/editAddressPage';

  static void configureRoutes(Router router) {
    router.define(loginPage,
        handler: Handler(handlerFunc: (context, params) => Login()));
    router.define(forgetPassWordPage,
        handler:
            Handler(handlerFunc: (context, params) => ForgetPassWordPage()));
    router.define(regPage,
        handler: Handler(handlerFunc: (context, params) => RegPage()));
    router.define(indexPage,
        handler: Handler(handlerFunc: (context, params) => IndexPage()));
    router.define(classIfyPage,
        handler: Handler(handlerFunc: (context, params) {
      var title = params["classify"]?.first;
      return ClassIfyPage(title);
    }));
    router.define(goodsDetailsPage,
        handler: Handler(handlerFunc: (context, params) {
      var goodsId = params["goodsId"]?.first;
      return GoodsDetailsPage(int.parse(goodsId));
    }));
    router.define(storePage, handler: Handler(handlerFunc: (context, params) {
      var storeId = params["storeId"]?.first;
      return StorePage(int.parse(storeId));
    }));
    router.define(confirmOrderPage,
        handler: Handler(handlerFunc: (context, params) => ConfirmOrderPage()));
    router.define(myAddressPage,
        handler: Handler(handlerFunc: (context, params) => MyAddressPage()));
    router.define(orderPage, handler: Handler(handlerFunc: (context, params) {
      var initIndex = params["initIndex"]?.first;
      var selfOrFans = params["selfOrFans"]?.first;
      return OrderPage(int.parse(initIndex), selfOrFans);
    }));
    router.define(dividendCenterPage,
        handler:
            Handler(handlerFunc: (context, params) => DividendCenterPage()));
    router.define(myFansPage,
        handler: Handler(handlerFunc: (context, params) => MyFansPage()));
    router.define(checkLogisticsPage,
        handler:
            Handler(handlerFunc: (context, params) => CheckLogisticsPage()));
    router.define(earningsReportPage,
        handler:
            Handler(handlerFunc: (context, params) => EarningsReportPage()));
    router.define(orderClearPage,
        handler: Handler(handlerFunc: (context, params) => OrderClearPage()));
    router.define(withdrawalRecordPage,
        handler:
            Handler(handlerFunc: (context, params) => WithdrawalRecordPage()));
    router.define(balanceOfAccountPage,
        handler: Handler(
            handlerFunc: (context, params) => BalanceOfAccountPagePage()));
    router.define(settingPage,
        handler: Handler(handlerFunc: (context, params) => SettingPage()));
    router.define(personalDataPage,
        handler: Handler(handlerFunc: (context, params) => PersonalDataPage()));
    router.define(modifyNicknamePage,
        handler:
            Handler(handlerFunc: (context, params) => ModifyNicknamePage()));
    router.define(addAddressPage,
        handler: Handler(handlerFunc: (context, params) => AddAddressPage()));
    router.define(editAddressPage,
        handler: Handler(handlerFunc: (context, params) => EditAddressPage()));
    Routes.router = router;
  }
}
