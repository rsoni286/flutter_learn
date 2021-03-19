import 'package:flutter/material.dart';
import 'package:flutter_learn/helpers/constants.dart';
import 'package:flutter_learn/ui/screens/auth.dart';
import 'package:flutter_learn/ui/screens/home.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: AppRoutes.AUTH,
      routes: {
        AppRoutes.AUTH: (context) => Auth(),
        AppRoutes.HOME: (context) => Home()
      },
    );
  }
}
