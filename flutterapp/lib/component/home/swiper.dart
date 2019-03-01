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
      fit: BoxFit.fill,
    ),
    Image.asset(
      "images/banner_1.jpg",
      fit: BoxFit.fill,
    ),
    Image.asset(
      "images/banner_2.jpg",
      fit: BoxFit.fill,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenUtil().setWidth(4)),
      height: ScreenUtil().setWidth(154),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return _swiperItem[index];
        },
        itemCount: 3,
        autoplay: true,
        pagination: SwiperPagination(
            builder: DotSwiperPaginationBuilder(
                color: Color.fromRGBO(155, 155, 155, 1),
                size: ScreenUtil().setWidth(8),
                activeColor: Color.fromRGBO(74, 74, 74, 1),
                activeSize: ScreenUtil().setWidth(8)),
            margin: EdgeInsets.only(bottom: ScreenUtil().setWidth(10))),
      ),
    );
  }
}
