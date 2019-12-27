import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vmanger/entity/login_entity.dart';
import 'package:flutter_vmanger/util/show_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'contains.dart';

///校验手机号码
checkPhoneNum(BuildContext context, String phone) {
  if (!checkPhone(phone)) {
    showToast(context, "手机号格式错误");
    return false;
  } else {
    return true;
  }
}

checkPhone(String phone) => RegExp('^((13[0-9])|(15[^4])|(166)|(17[0-8])|(18[0-9])|(19[8-9])|(147,145))\\d{8}\$').hasMatch(phone);

///获取登录信息
getLoginInfo() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return LoginData.fromJson(json.decode(prefs.getString(loginInfo)));
}

final int MIN_CLICK_DELAY_TIME = 1000;
int lastClickTime = 0;
isFastClick() {
  bool flag = false;
  int curClickTime = currentTimeMillis();
  if ((curClickTime - lastClickTime) >= MIN_CLICK_DELAY_TIME) {
    flag = true;
    lastClickTime = curClickTime;
  }
  return flag;
}

int currentTimeMillis() {
  return DateTime.now().millisecondsSinceEpoch;
}
