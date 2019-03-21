import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperComponent extends StatefulWidget {
  SwiperComponent({Key key, this.data, this.swiperLength}) : super(key: key);
  final data;
  final swiperLength;
  @override
  _SwiperComponentState createState() => new _SwiperComponentState();
}

class _SwiperComponentState extends State<SwiperComponent> {
  @override
  Widget build(BuildContext context) {
    final _this = widget.data ?? [];
    Image swiperImg(String url) {
      return Image.network(
        url,
        fit: BoxFit.cover,
      );
    }

    return Container(
      color: Colors.white,
      width: ScreenUtil.screenWidth,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return _this.map((f) {
            return swiperImg(f);
          }).toList()[index];
        },
        itemCount: widget.swiperLength ?? 0,
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
