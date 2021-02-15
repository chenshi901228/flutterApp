import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/main_bloc.dart';

import './modal.dart';

class SaleComponent extends StatefulWidget {
  SaleComponent({Key key, this.data}) : super(key: key);
  final data;
  @override
  _SaleState createState() => new _SaleState();
}

class _SaleState extends State<SaleComponent> {
  void chooseSizeFuc() {
    showModalBottomSheet(
        // barrierDismissible_cs: false,
        context: context,
        builder: (context) {
          return Modal(
            data: widget.data,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProviderMain.of(context);
    Container salesItem() {
      return Container(
        height: ScreenUtil().setWidth(44),
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("促销",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: Color.fromRGBO(102, 102, 102, 1))),
            SizedBox(
              width: ScreenUtil().setWidth(12),
            ),
            Image.asset(
              "images/icon/pinkage.png",
              width: ScreenUtil().setWidth(36),
              height: ScreenUtil().setWidth(18),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(12),
            ),
            Text("满98元，部分地区享包邮",
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(13),
                    color: Color.fromRGBO(102, 102, 102, 1)))
          ],
        ),
      );
    }

    GestureDetector sizeItem() {
      return GestureDetector(
        onTap: () {
          chooseSizeFuc();
        },
        child: Container(
          color: Colors.transparent,
          height: ScreenUtil().setWidth(44),
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              StreamBuilder(
                stream: bloc.goodsSizestream,
                initialData: bloc.goodsSizeChoice,
                builder: (context, snapshot) {
                  return Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("${snapshot.data["size"] == null ? "选择规格" : "已选"}",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(14),
                                color: Color.fromRGBO(102, 102, 102, 1))),
                        SizedBox(
                          width: ScreenUtil().setWidth(12),
                        ),
                        Text(
                            "${snapshot.data["size"] ?? ""} ${snapshot.data["size"] != null ? "×" : ""} ${snapshot.data["count"] ?? ""}",
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(13),
                                color: Color.fromRGBO(102, 102, 102, 1))),
                      ],
                    ),
                  );
                },
              ),
              Image.asset(
                "images/icon/right_icon.png",
                width: ScreenUtil().setWidth(6),
                height: ScreenUtil().setWidth(11),
              )
            ],
          ),
        ),
      );
    }

    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
      child: Column(
        children: <Widget>[
          salesItem(),
          sizeItem(),
        ],
      ),
    );
  }
}
