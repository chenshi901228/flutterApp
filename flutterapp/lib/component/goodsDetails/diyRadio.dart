import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DiyRadioBtn extends StatefulWidget {
  DiyRadioBtn({Key key, this.value, this.groupValue, this.onChanged})
      : super(key: key);
  final value;
  final groupValue;
  final onChanged;
  @override
  _RadioState createState() => new _RadioState();
}

class _RadioState extends State<DiyRadioBtn> {
  @override
  Widget build(BuildContext context) {
    bool checked = widget.value == widget.groupValue;
    Color checkedBorderColor =
        checked ? Color.fromRGBO(255, 102, 102, 1) : Colors.transparent;
    Color checkedBgc =
        checked ? Colors.white : Color.fromRGBO(233, 233, 233, 1);
    Color checkedTextColor = checked
        ? Color.fromRGBO(255, 102, 102, 1)
        : Color.fromRGBO(74, 74, 74, 1);
    return GestureDetector(
      onTap: () {
        widget.onChanged(widget.value);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(14),
            vertical: ScreenUtil().setWidth(2)),
        decoration: BoxDecoration(
            color: checkedBgc,
            border: Border.all(color: checkedBorderColor),
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(5))),
        child: Text(
          widget.value,
          style: TextStyle(
              fontSize: ScreenUtil().setWidth(12), color: checkedTextColor),
        ),
      ),
    );
  }
}
