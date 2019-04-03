import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
    List _this = widget.data;
    // List<Widget> _swiperItem = _this.map((f) {
    //   return Builder(
    //     builder: (context) {
    //       return Container(
    //           width: ScreenUtil.screenWidth,
    //           child: FadeInImage(
    //             image: NetworkImage(f["url"]),
    //             placeholder: AssetImage("images/loading_1.gif"),
    //             fit: BoxFit.cover,
    //             fadeInDuration: Duration(milliseconds: 100),
    //             fadeOutDuration: Duration(milliseconds: 100),
    //           ));
    //     },
    //   );
    // }).toList();

    List<Widget> pageMap(List list) {
      List<Widget> list = [];
      for (var i = 0; i < (_this != null ? _this.length : 1); i++) {
        list.add(Container(
          margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(3),
              vertical: ScreenUtil().setWidth(8)),
          child: ClipOval(
            child: Container(
              width: ScreenUtil().setWidth(8),
              height: ScreenUtil().setWidth(8),
              color: i == currentPage
                  ? Color.fromRGBO(74, 74, 74, 1)
                  : Color.fromRGBO(155, 155, 155, 1),
            ),
          ),
        ));
      }
      return list;
    }

    Widget pagination() {
      return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: pageMap(_this));
    }

    return Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: ScreenUtil().setWidth(4)),
        height: ScreenUtil().setWidth(154),
        child: Stack(
          children: <Widget>[
            _this != null
                ? CarouselSlider(
                    items: _this.map<Widget>((f) {
                      return Builder(
                        builder: (context) {
                          return Container(
                              width: ScreenUtil.screenWidth,
                              child: FadeInImage(
                                image: NetworkImage(f["url"]),
                                placeholder: AssetImage("images/loading_1.gif"),
                                fit: BoxFit.cover,
                                fadeInDuration: Duration(milliseconds: 100),
                                fadeOutDuration: Duration(milliseconds: 100),
                              ));
                        },
                      );
                    }).toList(),
                    height: ScreenUtil().setWidth(154),
                    viewportFraction: 1.0,
                    autoPlayCurve: Curves.easeIn,
                    autoPlayAnimationDuration: Duration(milliseconds: 300),
                    autoPlay: true,
                    onPageChanged: (int index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                  )
                : Center(
                    child: Icon(Icons.equalizer),
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: pagination(),
            ),
          ],
        ));
  }
}
