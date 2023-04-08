import 'package:flutter/material.dart';
import 'package:flutter_catalog/Pages/home_page.dart';
import 'package:flutter_catalog/Pages/login_page.dart';
import 'package:flutter_catalog/utils/routes.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        ),
      debugShowCheckedModeBanner: false,
      initialRoute:MyRoutes.homeRoute ,
      routes: {
        "/" :(context) => LoginPage(),
        MyRoutes.homeRoute:(context) => HomePage(),
        MyRoutes.loginRoute :(context) => LoginPage()
      },
    ); 
  }
}
 