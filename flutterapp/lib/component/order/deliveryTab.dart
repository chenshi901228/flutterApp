import 'package:flutter/material.dart';
import './deliveryItem.dart';

class DeliveryComponent extends StatefulWidget {
  @override
  _DeliveryState createState() => new _DeliveryState();
}

class _DeliveryState extends State<DeliveryComponent> {
  final List _data = [
    {
      "name": "nars限量高光散粉 珠光腮红 蜜粉 定妆粉修容orgasm",
      "img": "images/goods_img.jpg",
      "number": 2,
      "size": "",
      "price": 150.22,
      "select": false
    },
    {
      "name": "日本进口正品白色恋人饼干 套盒夹心饼干一盒黑白饼干 24枚/盒",
      "img": "images/goods1.jpg",
      "number": 3,
      "size": "1盒",
      "price": 502,
      "select": false
    },
    {
      "name": "祖玛珑苦橙香氛圣诞限量100ML Jo Malone London",
      "img": "images/storeBgm.jpg",
      "number": 1,
      "size": "100ml",
      "price": 2534,
      "select": false
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _data.length,
      itemBuilder: (context, int index) {
        return new DeliveryItem(
          data: _data[index],
        );
      },
    );
  }
}
