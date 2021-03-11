import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import './index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 667),
      allowFontScaling: false,
      builder: () => MaterialApp(home: Index()),
    );
  }
}
