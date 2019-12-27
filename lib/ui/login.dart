import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vmanger/entity/login_entity.dart';
import 'package:flutter_vmanger/model/login_model.dart';

import 'package:flutter_vmanger/model/timer_model.dart';
import 'package:flutter_vmanger/util/routes_name.dart';
import 'package:flutter_vmanger/util/util.dart';
import 'package:flutter_vmanger/util/colors.dart';
import 'package:flutter_vmanger/util/contains.dart';
import 'package:flutter_vmanger/util/show_toast.dart';
import 'package:flutter_vmanger/widget/webview.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

///登录
class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController phoneController;

  TextEditingController verificationCodeController;

//  getLoginSuccessStatus() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    bool status = prefs.getBool(loginSuccessStatus) ?? false;
//    print("status:$status");
//    if(status){
//      Navigator.pushNamed(context, tab_navigator);
//    }
//    return status;
//  }

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(color: Colors.white, fontSize: 15);
    var textCodeStyle = TextStyle(
      color: Colors.white,
      fontSize: 12,
    );
    phoneController = TextEditingController();
    verificationCodeController = TextEditingController();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: <Widget>[
          Container(
            child: Image.asset(
              "images/login_bg.png",
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 20,
            top: 100,
            child: Text(
              "欢迎使用V智会酒店版",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
          Positioned(
              left: 20,
              top: 280,
              right: 20,
              child: Container(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: phoneController,
                      style: textStyle,
                      inputFormatters: [LengthLimitingTextInputFormatter(11)],
                      decoration: InputDecoration(
                        labelText: "手机号码",
                        labelStyle: textStyle,
                        hintText: "请输入手机号码",
                        hintStyle: textStyle,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    Stack(
                      children: <Widget>[
                        Positioned(
                          child: TextField(
                            //                            onTap: (){
                            //                              _checkPhone(phoneController, context);
                            //                            },
                            style: textStyle,
                            //                            maxLength: 6,
                            inputFormatters: [LengthLimitingTextInputFormatter(6)],
                            //没有右下角的计数标记
                            controller: verificationCodeController,
                            //obscureText: true, //密码
                            decoration: InputDecoration(
                              labelText: "验证码",
                              labelStyle: textStyle,
                              hintText: "请输入验证码",
                              hintStyle: textStyle,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 20,
                            child: ChangeNotifierProvider<TimerModel>(
                                create: (BuildContext context) => TimerModel(),
                                child: Consumer<TimerModel>(
                                  builder: (BuildContext context, TimerModel timerModel, Widget child) {
                                    return GestureDetector(
                                      onTap: () => _verificationCodeClick(timerModel),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 33,
                                        width: 90,
                                        decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(4)), border: Border.all(width: 1, color: Colors.white)),
                                        child: Text(
                                          timerModel.count == 60 || timerModel.count == 0 ? "获取验证码" : '${timerModel.count} 秒后重发',
                                          style: textCodeStyle,
                                        ),
                                      ),
                                    );
                                  },
                                )))
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 50,
                      margin: EdgeInsets.only(top: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: RaisedButton(
                        onPressed: () {
                          _loginBtn();
                        },
                        textColor: Colors.white,
                        color: Colors_.color_2195EE,
                        child: Text("登录"),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: () {
                  _toUnderstandingV();
                },
                child: Container(
                  width: 125,
                  height: 33,
                  margin: EdgeInsets.only(bottom: 20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    border: Border.all(width: 1, color: Colors.white),
                  ),
                  child: Text(
                    "了解V智会酒店版",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ))
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  ///验证码点击
  _verificationCodeClick(TimerModel timerModel) {
    //校验手机号
    if (phoneController.text.isEmpty) {
      showToast(context, "手机号为空");
    } else if (checkPhoneNum(context, phoneController.text)) {
      if (timerModel.count == 60) {
        timerModel.startTimer();
        //获取验证码
        getSmsCode(phoneController.text).then((value){
          if(value.data){
            showToast(context, "获取验证码成功");
          }else{
            showToast(context, value.message);
          }
        });
      }
    }
  }

  ///登录
  void _loginBtn() {
    print("登录");
    if (phoneController.text.isEmpty) {
      showToast(context, "手机号为空");
    } else if (checkPhoneNum(context, phoneController.text)) {
      //校验手机号
      if (verificationCodeController.text.isEmpty) {
        showToast(context, "验证码为空");
      } else {
        //登录
        smsLogin(phoneController.text,verificationCodeController.text).then((value){
          if(value.code == 200){
            saveLoginInfo(value.data.toString());
            saveLoginSuccessStatus(true);
            showToast(context, "登录成功");
            //保存成功之后 跳转
            Navigator.pushNamed(context, tab_navigator);
          }else{
            saveLoginSuccessStatus(false);
            showToast(context, value.message);
          }
        });
      }
    }
  }

  ///了解V智会酒店版
  void _toUnderstandingV() {
    print("了解V智会酒店版");
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
      return WebViewWidget(
        url: "https://flutter-io.cn/",
        title: "Flutter 中文社区",
      );
    }));
  }

  @override
  void dispose() {
    phoneController.dispose();
    verificationCodeController.dispose();
    super.dispose();
  }

  saveLoginInfo(String data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(loginInfo, data);
  }

  ///保存登录成功状态
  saveLoginSuccessStatus(bool status) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(loginSuccessStatus, status);
  }
}
