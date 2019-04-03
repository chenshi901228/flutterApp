import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import '../../utils/routes.dart';

import '../../utils/httpRequest.dart';
import '../../blocs/main_bloc.dart';

class PersonalDataPage extends StatefulWidget {
  @override
  _PersonalDataState createState() => new _PersonalDataState();
}

class _PersonalDataState extends State<PersonalDataPage> {
  File _image;

  Future getImage(String type) async {
    var source;
    switch (type) {
      case "gallery":
        source = ImageSource.gallery;
        break;
      default:
        source = ImageSource.camera;
    }
    var image = await ImagePicker.pickImage(source: source);
    setState(() {
      _image = image;
    });
  }

  void wayOfImagePick() {
    showModalBottomSheet(
        barrierDismissible_cs: false,
        context: context,
        builder: (context) {
          return Container(
            height: ScreenUtil().setWidth(101),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    getImage("camera");
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: ScreenUtil.screenWidth,
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(6)),
                    child: Text("拍照"),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(1),
                  child: Container(
                    color: Colors.grey[200],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    getImage("gallery");
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: ScreenUtil.screenWidth,
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(6)),
                    child: Text("从手机相册选择"),
                  ),
                ),
                SizedBox(
                  height: ScreenUtil().setWidth(2),
                  child: Container(
                    color: Colors.grey[200],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: ScreenUtil.screenWidth,
                    color: Colors.transparent,
                    padding: EdgeInsets.symmetric(
                        vertical: ScreenUtil().setWidth(6)),
                    child: Text("取消"),
                  ),
                ),
              ],
            ),
          );
        });
  }

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
              "个人资料",
              style: TextStyle(
                  fontSize: ScreenUtil().setWidth(16),
                  color: Color.fromRGBO(51, 51, 51, 1)),
            ),
          ),
        ),
        body: StreamBuilder(
          stream: bloc.userInfostream,
          builder: (context, snaphot) {
            return ListView(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    // getImage();
                    wayOfImagePick();
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setWidth(20),
                        right: ScreenUtil().setWidth(10),
                        top: ScreenUtil().setWidth(12),
                        bottom: ScreenUtil().setWidth(12)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(
                                color: Color.fromRGBO(231, 231, 231, 1)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "头像",
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(14),
                              color: Color.fromRGBO(51, 51, 51, 1)),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              width: ScreenUtil().setWidth(50),
                              height: ScreenUtil().setWidth(50),
                              margin: EdgeInsets.only(
                                  right: ScreenUtil().setWidth(24)),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(216, 216, 216, 1),
                                  borderRadius: BorderRadius.circular(100)),
                              child: snaphot.data == null
                                  ? Text(
                                      "头像",
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(12),
                                          color:
                                              Color.fromRGBO(102, 102, 102, 1)),
                                    )
                                  : ClipOval(
                                      child: _image != null
                                          ? Image.file(
                                              _image,
                                              width: ScreenUtil().setWidth(50),
                                              height: ScreenUtil().setWidth(50),
                                            )
                                          : snaphot.data["headImg"] != null
                                              ? Image.network(
                                                  snaphot.data["headImg"],
                                                  width:
                                                      ScreenUtil().setWidth(50),
                                                  height:
                                                      ScreenUtil().setWidth(50),
                                                )
                                              : Text(
                                                  "头像",
                                                  style: TextStyle(
                                                      fontSize: ScreenUtil()
                                                          .setSp(12),
                                                      color: Color.fromRGBO(
                                                          102, 102, 102, 1)),
                                                ),
                                    ),
                            ),
                            Image.asset(
                              "images/icon/right_icon.png",
                              alignment: Alignment.centerRight,
                              width: ScreenUtil().setWidth(6),
                              height: ScreenUtil().setWidth(11),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            top: BorderSide(
                                color: Color.fromRGBO(231, 231, 231, 1)))),
                    child: Padding(
                      padding: EdgeInsets.only(
                          right: ScreenUtil().setWidth(10),
                          left: ScreenUtil().setWidth(20),
                          top: ScreenUtil().setWidth(12),
                          bottom: ScreenUtil().setWidth(12)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "用户名",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                color: Color.fromRGBO(51, 51, 51, 1)),
                          ),
                          Text(
                            snaphot.data != null
                                ? snaphot.data["phone"].toString()
                                : "",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                color: Color.fromRGBO(102, 102, 102, 1)),
                          ),
                        ],
                      ),
                    )),
                GestureDetector(
                  onTap: () {
                    Routes.router.navigateTo(context, "/modifyNicknamePage");
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border(
                              top: BorderSide(
                                  color: Color.fromRGBO(231, 231, 231, 1)))),
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: ScreenUtil().setWidth(10),
                            left: ScreenUtil().setWidth(20),
                            top: ScreenUtil().setWidth(12),
                            bottom: ScreenUtil().setWidth(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "昵称",
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(14),
                                  color: Color.fromRGBO(51, 51, 51, 1)),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  snaphot.data != null
                                      ? snaphot.data["nick_name"]
                                      : "",
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(14),
                                      color: Color.fromRGBO(102, 102, 102, 1)),
                                ),
                                SizedBox(
                                  width: ScreenUtil().setWidth(10),
                                ),
                                Image.asset(
                                  "images/icon/right_icon.png",
                                  width: ScreenUtil().setWidth(6),
                                  height: ScreenUtil().setWidth(11),
                                )
                              ],
                            )
                          ],
                        ),
                      )),
                ),
              ],
            );
          },
        ));
  }
}
