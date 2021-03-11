import 'package:flutter/material.dart';

import '../widget/classify/title.dart';
import '../widget/classify/item.dart';

class ClassIfy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClassTitle(),
        Item()
      ],
    );
  }
}
