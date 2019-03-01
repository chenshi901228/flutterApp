import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AlertModalComponent extends StatefulWidget {
  AlertModalComponent({Key key, this.type}) : super(key: key);
  final type;
  @override
  _AlertModalState createState() => new _AlertModalState();
}

class _AlertModalState extends State<AlertModalComponent> {
  @override
  Widget build(BuildContext context) {
    Map data = {"title": "", "exct": ""};
    final _this = widget.type;

    switch (_this) {
      case "累计股权收益":
        setState(() {
          data["title"] = _this;
          data["exct"] = "通过自购或粉丝消费获得的所有股权";
        });
        break;
      case "累计现金奖励":
        setState(() {
          data["title"] = _this;
          data["exct"] = "通过推荐粉丝消费获得的所有现金奖励";
        });
        break;
      case "股权收益":
        setState(() {
          data["title"] = _this;
          data["exct"] = "通过自购或粉丝消费获得对应的股权";
        });
        break;
      case "现金奖励":
        setState(() {
          data["title"] = _this;
          data["exct"] = "通过推荐粉丝消费获得对应的现金奖励";
        });
        break;
    }

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
                      data["title"],
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(14),
                          color: Color.fromRGBO(102, 102, 102, 1)),
                    ),
                    Text(
                      data["exct"],
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Color.fromRGBO(153, 153, 153, 1)),
                    )
                  ],
                ),
              ),
              Container(
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: ScreenUtil().setWidth(48),
                      alignment: Alignment.center,
                      color: Colors.transparent,
                      child: Text(
                        "确认",
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(255, 102, 102, 1)),
                        textAlign: TextAlign.center,
                      ),
                    )),
              )
            ],
          ),
        ));
  }
}
