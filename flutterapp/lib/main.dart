import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './utils/routes.dart';

void main() {
  final router = new Router();
  Routes.configureRoutes(router);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.router.generator,
    );
  }
}
