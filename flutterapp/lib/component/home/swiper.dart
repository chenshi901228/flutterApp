import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwiperComponent extends StatefulWidget {
  SwiperComponent({Key key, this.data}) : super(key: key);
  final data;
  @override
  _SwiperComponentState createState() => new _SwiperComponentState();
}

class _SwiperComponentState extends State<SwiperComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    List _this = widget.data ?? [];
    Image swiperImg(String url) {
      return Image.network(
        url,
        fit: BoxFit.fill,
      );
    }

    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: ScreenUtil().setWidth(4)),
      height: ScreenUtil().setWidth(154),
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return _this.map((f) {
            return swiperImg(f["url"]);
          }).toList()[index];
        },
        itemCount: _this.length,
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
