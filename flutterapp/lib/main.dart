import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './utils/routes.dart';
import 'blocs/main_bloc.dart';

void main() {
  final router = FluroRouter();
  Routes.configureRoutes(router);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProviderMain(
      child: MaterialApp(
        onGenerateRoute: Routes.router.generator,
      ),
    );
  }
}
