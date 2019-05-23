import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Item extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item> {
  final List _data = [
    {'imgUrl': 'images/storeImg.png', 'text': '天猫'},
    {'imgUrl': 'images/storeImg.png', 'text': '聚划算'},
    {'imgUrl': 'images/storeImg.png', 'text': '天猫国际'},
    {'imgUrl': 'images/storeImg.png', 'text': '饿了么'},
    {'imgUrl': 'images/storeImg.png', 'text': '天猫超市'},
    {'imgUrl': 'images/storeImg.png', 'text': '充值中心'},
    {'imgUrl': 'images/storeImg.png', 'text': '飞猪旅行'},
    {'imgUrl': 'images/storeImg.png', 'text': '淘金币'},
    {'imgUrl': 'images/storeImg.png', 'text': '拍卖'},
    {'imgUrl': 'images/storeImg.png', 'text': '海鲜达'},
    {'imgUrl': 'images/storeImg.png', 'text': '分类'},
    {'imgUrl': 'images/storeImg.png', 'text': '天猫生鲜'},
    {'imgUrl': 'images/storeImg.png', 'text': '阿里健康'},
    {'imgUrl': 'images/storeImg.png', 'text': '口碑美食'},
    {'imgUrl': 'images/storeImg.png', 'text': '闲鱼'},
    {'imgUrl': 'images/storeImg.png', 'text': '88VIP'},
    {'imgUrl': 'images/storeImg.png', 'text': '淘票票'},
  ];
  double _progress = 0.0;

  ScrollController _scrollController = ScrollController();
  _onscrollController() {
    setState(() {
      _progress = (_scrollController.position.pixels /
              _scrollController.position.maxScrollExtent)
          .clamp(0.0, 1.0);
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_onscrollController);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onscrollController);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget _item(Map i) {
      return Column(
        children: <Widget>[
          ClipOval(
            child: Image.asset(
              i['imgUrl'],
              width: ScreenUtil().setWidth(30),
              height: ScreenUtil().setWidth(30),
            ),
          ),
          Text(
            i['text'],
            style: TextStyle(fontSize: ScreenUtil().setSp(10)),
          ),
        ],
      );
    }

    return Column(
      children: <Widget>[
        Container(
            width: ScreenUtil.screenWidth,
            height: ScreenUtil().setWidth(100),
            child: GridView.count(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              primary: false,
              crossAxisSpacing: ScreenUtil().setWidth(10),
              mainAxisSpacing: ScreenUtil().setWidth(33),
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
              crossAxisCount: 2,
              children: _data.map((f) {
                return GestureDetector(
                  onTap: () {
                    print("分类");
                  },
                  child: _item(f),
                );
              }).toList(),
            )),
        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setWidth(6)),
              width: ScreenUtil().setWidth(40),
              height: ScreenUtil().setWidth(3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(2)),
                  color: Color.fromRGBO(212, 216, 222, 1)),
            ),
            Positioned(
              top: 0,
              left: 25 * _progress,
              child: Container(
                margin: EdgeInsets.only(top: ScreenUtil().setWidth(6)),
                width: ScreenUtil().setWidth(15),
                height: ScreenUtil().setWidth(3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(ScreenUtil().setWidth(2)),
                  color: Color.fromRGBO(255, 109, 42, 1),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
