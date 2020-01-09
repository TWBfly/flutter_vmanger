import 'package:flutter/material.dart';
import 'package:flutter_vmanger/util/show_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'contains.dart';
import 'date_format/date_format_base.dart';

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

///获取登录 token
Future<String> getLoginInfoToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString(loginInfoToken);
  print("token:$token");
  return token;
}

///userId
Future<int> getLoginInfoUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int userId = prefs.getInt(loginInfoUserId);
  print("userId:$userId");
  return userId;
}

///systemId
Future<int> getLoginInfoSystemId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int systemId = prefs.getInt(loginInfoSystemId);
  print("systemId:$systemId");
  return systemId;
}

///登录状态
Future<bool> getSP() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.get(loginSuccessStatus) ?? false;
}

///保存登录成功状态
saveLoginSuccessStatus(bool status) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool(loginSuccessStatus, status);
}

///双击
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

///今日 "startDate": "2019-12-31 00:00:00",  "endDate": "2019-12-31 23:59:59",
///本月 "startDate": "2019-12-01 00:00:00",  "endDate": "2019-12-31 23:59:59",
///今年 "startDate": "2019-1-01 00:00:00",  "endDate": "2019-12-31 23:59:59",
String startEnd =" "+"00:00:00";
String endEnd =" "+"23:59:59";
todayStartDate(){
  return formatDate(DateTime.now() ,[yyyy,'-',mm,'-',dd])+startEnd;
}
todayEndDate(){
  return formatDate(DateTime.now() ,[yyyy,'-',mm,'-',dd])+endEnd;
}

monthStartDate(){
  String yearString = formatDate(DateTime.now() ,[yyyy]);
  String month = formatDate(DateTime.now() ,[mm]);
  return yearString+"-"+month+"-"+"01"+startEnd;
}

monthEndDate(){
  String yearString = formatDate(DateTime.now() ,[yyyy]);
  Map<String,int> map = leapYear(yearString);
  String month = formatDate(DateTime.now() ,[mm]);
  print("month:$month");
  int lastMonthDay =  map[month];
  print("lastMonthDay:$lastMonthDay");
  return  yearString+"-"+month+"-"+lastMonthDay.toString()+endEnd;
}

yearStartDate(){
  String year = formatDate(DateTime.now() ,[yyyy]);
  return year+"-"+"01"+"-"+"01"+startEnd;
}

yearEndDate(){
  String year = formatDate(DateTime.now() ,[yyyy]);
  return year+"-"+"12"+"-"+"31"+endEnd;
}

Map<String,int> leapYear(String yearString) {
  int yearInt =int.parse(yearString);
  if(yearInt % 400 ==0 || (yearInt%4==0 && yearInt%100!=0)){
    //是闰年
    Map<String,int> monthMap = {"01":31,"02":29,"03":31,"04":30,"05":31,"06":30,"07":31,"08":31,"09":30,"10":31,"11":30,"12":31};
    return monthMap;
  }else{
    Map<String,int> monthMap = {"01":31,"02":28,"03":31,"04":30,"05":31,"06":30,"07":31,"08":31,"09":30,"10":31,"11":30,"12":31};
    return monthMap;
  }
}








