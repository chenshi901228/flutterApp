import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../model/loading.dart';

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
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    final _this = widget.data;
    Widget pagination() {
      return Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(10),
            vertical: ScreenUtil().setWidth(2)),
        decoration: BoxDecoration(
            color: Color.fromRGBO(0, 0, 0, 0.3),
            borderRadius: BorderRadius.circular(ScreenUtil().setWidth(10))),
        child: Text(
          "${currentPage + 1}/${_this?.length}",
          style:
              TextStyle(fontSize: ScreenUtil().setSp(12), color: Colors.white),
        ),
      );
    }

    return Container(
        color: Colors.white,
        width: ScreenUtil.screenWidth,
        child: Stack(
          children: <Widget>[
            _this != null
                ? CarouselSlider(
                    items: _this.map<Widget>((f) {
                      return Builder(builder: (context) {
                        return Container(
                            width: ScreenUtil.screenWidth,
                            child: FadeInImage(
                              image: NetworkImage(f),
                              placeholder: AssetImage(Common.loadImg),
                              fit: BoxFit.cover,
                              fadeInDuration: Duration(milliseconds: 100),
                              fadeOutDuration: Duration(milliseconds: 100),
                            ));
                      });
                    }).toList(),
                    height: ScreenUtil().setWidth(360),
                    viewportFraction: 1.0,
                    onPageChanged: (int index) {
                      setState(() {
                        currentPage = index;
                      });
                    })
                : Center(
                    child: Icon(Icons.equalizer),
                  ),
            Positioned(
              right: ScreenUtil().setWidth(10),
              bottom: ScreenUtil().setWidth(10),
              child: pagination(),
            )
          ],
        ));
  }
}
