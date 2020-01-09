import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vmanger/http/http.dart';
import 'package:flutter_vmanger/ui/activity_list.dart';
import 'package:flutter_vmanger/ui/home.dart';
import 'package:flutter_vmanger/ui/login.dart';
import 'package:flutter_vmanger/ui/my_activity.dart';
import 'package:flutter_vmanger/ui/select_time.dart';
import 'package:flutter_vmanger/ui/tab_navigator.dart';
import 'package:flutter_vmanger/ui/un_known_page.dart';
import 'package:flutter_vmanger/util/routes_name.dart';
import 'package:flutter_vmanger/util/show_toast.dart';
import 'package:flutter_vmanger/util/util.dart';
import 'package:flutter_vmanger/entity/base_entity.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter V智会酒店版',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        login: (context) => LoginWidget(),
        tab_navigator: (context) => TabNavigator(),
        home_page: (context) => HomePage(),
        select_time_page: (context) => SelectTimeWidget(),
        activity_list: (context) => ActivityListPage(),
        my_activity: (context) => MyActivity(),
      },
      onUnknownRoute: (RouteSettings setting) => MaterialPageRoute(builder: (context) => UnKnownPage()),
      home: FutureBuilder<bool>(
            future: getSP(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              switch(snapshot.connectionState){
                case ConnectionState.none:
                  return LoginWidget();
                  break;
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                  break;
                case ConnectionState.active:
                  return Center(child: CircularProgressIndicator());
                  break;
                case ConnectionState.done:
                  print("是否登录:${snapshot.data}");
                  return snapshot.data? MyHomePage(): LoginWidget();
                  break;
              }
              return LoginWidget();
            },
          )
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // 在请求被发送之前做一些事情
      print("onRequest path:${options.path}");
      print("onRequest baseUrl:${options.baseUrl}");
      print("onRequest data:${options.data.toString()}");
      String token = dio.options.headers["token"];
      if (token != null) {
        //get sp token
        print("options.headers token:$token");
        options.headers["token"] = token;
      }else{
        dio.lock();
        getLoginInfoToken().then((token){
          if(token!=null){
            print("getLoginInfoToken:$token");
            options.headers["token"] = token;
          }
        }).whenComplete((){
          dio.unlock();
        });
      }
      return options;
    }, onResponse: (Response response) async {
      // 在返回响应数据之前做一些预处理
      print("response data:${response.data.toString()}");
      var baseEntity = BaseEntity.fromJson(json.decode(response.data.toString()));
      print("baseEntity.code:${baseEntity.code}");
      if (baseEntity.code == 401) {
        //go to login
        saveLoginSuccessStatus(false).then((_){
          goToLogin();
        });
      }
      return response;
    }, onError: (DioError e) async {
      // 当请求失败时做一些预处理
      showToast(context, e.message);
      return e;
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    print("===========================mian build==========================");
    return TabNavigator();

  }


  void goToLogin() {
    Navigator.maybePop(context).then((value){
      if(!value){
        Navigator.pushReplacementNamed(context, login);
      }
    });
//    dio.close(force: true);
  }
}
