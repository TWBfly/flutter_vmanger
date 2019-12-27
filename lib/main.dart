import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vmanger/http/http.dart';
import 'package:flutter_vmanger/ui/home.dart';
import 'package:flutter_vmanger/ui/select_time.dart';
import 'package:flutter_vmanger/ui/tab_navigator.dart';
import 'package:flutter_vmanger/ui/un_known_page.dart';
import 'package:flutter_vmanger/util/routes_name.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    dio.interceptors.add(LogInterceptor());
    return MaterialApp(
      title: 'Flutter V智会酒店版',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        tab_navigator: (context) => TabNavigator(),
        home_page: (context) => HomePage(),
        select_time_page: (context) => SelectTimeWidget(),
      },
      onUnknownRoute: (RouteSettings setting) => MaterialPageRoute(builder: (context) => UnKnownPage()),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//    return LoginWidget();
    return TabNavigator();
  }
}
