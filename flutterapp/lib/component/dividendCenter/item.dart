import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemComponent extends StatefulWidget {
  ItemComponent({Key key, this.isTitle, this.data}) : super(key: key);
  final isTitle;
  final data;
  @override
  _ItemState createState() => new _ItemState();
}

class _ItemState extends State<ItemComponent> {
  @override
  Widget build(BuildContext context) {
    final isTitle = widget.isTitle;
    final _this = widget.data;
    return Container(
      height: ScreenUtil().setWidth(isTitle ? 44 : 40),
      padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(color: Color.fromRGBO(242, 243, 242, 1)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            _this["name"],
            style: isTitle
                ? TextStyle(
                    fontSize: ScreenUtil().setWidth(15), color: Colors.black)
                : TextStyle(
                    fontSize: ScreenUtil().setWidth(14),
                    color: Color.fromRGBO(102, 102, 102, 1)),
          ),
          Text(
            "${_this["number"]}股",
            style: TextStyle(
                fontSize: ScreenUtil().setWidth(isTitle ? 18 : 14),
                color: Color.fromRGBO(239, 204, 111, 1)),
          )
        ],
      ),
    );
  }
}
