import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/main_bloc.dart';

class ModifyNicknamePage extends StatefulWidget {
  @override
  _ModifyNicknameState createState() => new _ModifyNicknameState();
}

class _ModifyNicknameState extends State<ModifyNicknamePage> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProviderMain.of(context);
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color.fromRGBO(243, 243, 243, 1),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setWidth(44)),
          child: AppBar(
            backgroundColor: Colors.white,
            brightness: Brightness.light,
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
            title: Text(
              "修改昵称",
              style: TextStyle(
                  fontSize: ScreenUtil().setWidth(16),
                  color: Color.fromRGBO(51, 51, 51, 1)),
            ),
          ),
        ),
        body: StreamBuilder(
          stream: bloc.userInfostream,
          builder: (context, snaphot) {
            TextEditingController _controller = TextEditingController();
            return ListView(
              padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.circular(ScreenUtil().setWidth(2))),
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(14),
                        color: Color.fromRGBO(151, 151, 151, 1)),
                    decoration: InputDecoration(
                        hintText: "输入昵称",
                        suffixIcon: IconButton(
                          onPressed: () {
                            _controller.clear();
                          },
                          icon: Image.asset(
                            "images/icon/clean.png",
                            width: ScreenUtil().setWidth(16),
                            height: ScreenUtil().setWidth(16),
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: ScreenUtil().setWidth(10),
                            vertical: ScreenUtil().setWidth(12)),
                        hintStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(153, 153, 153, 1)),
                        border: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(5),
                ),
                Text(
                  "注意：与商城业务或卖家冲突的昵称，商城将有权收回",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(12),
                      color: Color.fromRGBO(153, 153, 153, 1)),
                ),
                GestureDetector(
                  onTap: () {
                    bloc.editNickName(context, _controller.text);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: ScreenUtil().setWidth(44),
                    margin: EdgeInsets.only(top: ScreenUtil().setWidth(52)),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(74, 74, 74, 1),
                        borderRadius:
                            BorderRadius.circular(ScreenUtil().setWidth(2))),
                    child: Text(
                      "保存",
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
