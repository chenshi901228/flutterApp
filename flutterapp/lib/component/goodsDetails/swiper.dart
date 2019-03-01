import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperComponent extends StatefulWidget {
  @override
  _SwiperComponentState createState() => new _SwiperComponentState();
}

class _SwiperComponentState extends State<SwiperComponent> {
  final List _swiperItem = [
    Image.asset(
      "images/banner.jpg",
      width: ScreenUtil.screenWidth,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "images/banner_1.jpg",
      width: ScreenUtil.screenWidth,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "images/banner_2.jpg",
      width: ScreenUtil.screenWidth,
      fit: BoxFit.cover,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: ScreenUtil.screenWidth,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return _swiperItem[index];
        },
        itemCount: 3,
        pagination: SwiperPagination(
            paginationPadding: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setWidth(10),
                vertical: ScreenUtil().setWidth(2)),
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))),
            alignment: Alignment.bottomRight,
            builder: FractionPaginationBuilder(
              fontSize: ScreenUtil().setSp(12),
              activeFontSize: ScreenUtil().setSp(12),
              activeColor: Colors.white,
            ),
            margin: EdgeInsets.only(
                bottom: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10))),
      ),
    );
  }
}
