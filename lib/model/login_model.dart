import 'package:flutter_vmanger/entity/getsmscode_entity.dart';
import 'package:flutter_vmanger/entity/login_entity.dart';
import 'package:flutter_vmanger/http/api.dart';
import 'package:flutter_vmanger/http/http.dart';
import 'dart:convert';

///短信登录
Future<LoginEntity> smsLogin(String phoneNum,String smsCode) async {
  var response = await dio.post(USER_LOGIN_SMS, data: {"mobile": phoneNum,"smsCode":smsCode});
  if (response.statusCode == 200) {
    return LoginEntity.fromJson(json.decode(response.data.toString()));
  }
}

///获取验证码
Future<GetsmscodeEntity> getSmsCode(String phoneNum) async {
  var response = await dio.post(USER_SEND_VERIFY_CODE_LOGIN, data: {"mobile": phoneNum});
  if (response.statusCode == 200) {
    return GetsmscodeEntity.fromJson(json.decode(response.data.toString()));
  }
}