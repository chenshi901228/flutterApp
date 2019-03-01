import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/routes.dart';

class AddressItemComponent extends StatefulWidget {
  AddressItemComponent({Key key, this.data}) : super(key: key);
  final data;
  @override
  _AddressItemState createState() => new _AddressItemState();
}

class _AddressItemState extends State<AddressItemComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Routes.router.navigateTo(context, "/editAddressPage");
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.only(top: ScreenUtil().setWidth(10)),
        padding: EdgeInsets.only(
            top: ScreenUtil().setWidth(16),
            bottom: ScreenUtil().setWidth(16),
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        widget.data["name"],
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(51, 51, 51, 1)),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(10),
                      ),
                      Text(
                        widget.data["phone"].replaceRange(3, 7, "****"),
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(14),
                            color: Color.fromRGBO(51, 51, 51, 1)),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(4),
                      ),
                      widget.data["isdefault"]
                          ? Image.asset(
                              "images/icon/default.png",
                              width: ScreenUtil().setWidth(35),
                              height: ScreenUtil().setWidth(18),
                            )
                          : SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil().setWidth(6),
                  ),
                  Text(
                    widget.data["address"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(13),
                        color: Color.fromRGBO(102, 102, 102, 1)),
                  )
                ],
              ),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(20),
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
}
