import 'dart:convert';


import 'package:flutter_vmanger/http/api.dart';
import 'package:flutter_vmanger/http/http.dart';
import 'package:flutter_vmanger/entity/my_activity_entity.dart';

Future<MyActivityEntity> myAllMeetings(String flag,int userId) async {
  var response = await dio.post(MY_ALL_MEETINGS, data: {"flag": flag,"userId":userId,"curPage":1,"pageSize":50,"isVzh":"-1"});
  if (response.statusCode == 200) {
    return MyActivityEntity.fromJson(json.decode(response.data.toString()));
  }
}