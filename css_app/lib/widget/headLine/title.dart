import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HeadLineTitle extends StatefulWidget {
  @override
  _HeadLineTitleState createState() => _HeadLineTitleState();
}

class _HeadLineTitleState extends State<HeadLineTitle> {
  final List _titleList = [
    {'tag': '数码', 'news': '6月3日，苹果开发者大会，新产品提前知晓'},
    {'tag': '超赞', 'news': '又一合资车跌至10.29万起还买啥轩逸'},
    {'tag': '围观', 'news': '红米新旗舰已定，5月17日发布'},
    {'tag': '围观', 'news': '又一国产手机"凉凉"了？曾与华为齐名'},
  ];

  @override
  Widget build(BuildContext context) {
    Widget _titleSwiperItem(Map data) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(4)),
            decoration: BoxDecoration(
                color: Color.fromRGBO(255, 238, 238, 1),
                borderRadius: BorderRadius.circular(2)),
            child: Text(
              data['tag'],
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(10),
                  color: Color.fromRGBO(255, 157, 116, 1)),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(220),
            padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(6)),
            child: Text(
              data['news'],
              style: TextStyle(fontSize: ScreenUtil().setSp(10)),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      );
    }

    CarouselSlider _titleSwiper() {
      return CarouselSlider(
          options: CarouselOptions(
            scrollDirection: Axis.vertical,
            height: ScreenUtil().setWidth(30),
            autoPlay: true,
            // dragable: false,
            viewportFraction: 1.0,
          ),
          items: _titleList.map((f) {
            return _titleSwiperItem(f);
          }).toList());
    }

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: ScreenUtil().setWidth(10),
          vertical: ScreenUtil().setWidth(4)),
      child: Row(
        children: <Widget>[
          Image.asset(
            "images/tbtt.png",
            width: ScreenUtil().setWidth(60),
            height: ScreenUtil().setWidth(20),
          ),
          Expanded(
            child: _titleSwiper(),
          )
        ],
      ),
    );
  }
}
