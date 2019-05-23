import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerDecoration extends CustomPainter {
  var _paint = new Paint()
    ..color = Color.fromRGBO(242, 242, 242, 1)
    ..strokeCap = StrokeCap.round
    ..isAntiAlias = true
    ..style = PaintingStyle.fill;

  @override
  void paint(Canvas canvas, Size size) {
    // 绘制代码
    Path path = new Path();
    path.moveTo(-ScreenUtil.screenWidth / 4, 0.2);
    path.cubicTo(-ScreenUtil.screenWidth / 4, 0.2, 0.0,
        -ScreenUtil().setWidth(24), ScreenUtil.screenWidth / 4, 0.2);
    path.close();
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class HomeBanner extends StatefulWidget {
  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final List _list = ['images/banner.jpg', 'images/banner_1.jpg'];

  int currentPage = 0;

  List<Widget> _pagetionItem() {
    final len = _list.length;
    List<Widget> list = [];
    for (var i = 0; i < len; i++) {
      list.add(Container(
        margin: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(2)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            width: ScreenUtil().setWidth(8),
            height: ScreenUtil().setWidth(8),
            color:
                i == currentPage ? Color.fromRGBO(255, 80, 0, 1) : Colors.white,
          ),
        ),
      ));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    CarouselSlider _banner(List data) {
      return CarouselSlider(
        height: ScreenUtil().setWidth(120),
        viewportFraction: 1.0,
        autoPlay: true,
        items: data.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Image.asset(
                i,
                width: ScreenUtil.screenWidth,
                fit: BoxFit.fill,
              );
            },
          );
        }).toList(),
        onPageChanged: (int i) {
          setState(() {
            currentPage = i;
          });
        },
      );
    }

    Row _pagetion(List data) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _pagetionItem(),
      );
    }

    return Container(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          _banner(_list),
          Positioned(
            bottom: ScreenUtil().setWidth(20),
            child: _pagetion(_list),
          ),
          Positioned(
              bottom: -0.2,
              child: CustomPaint(
                painter: BannerDecoration(),
              ))
        ],
      ),
    );
  }
}
