import 'dart:convert';

import 'package:flutter_vmanger/entity/getbanner_data_entity.dart';
import 'package:flutter_vmanger/entity/getroom_rate_entity.dart';
import 'package:flutter_vmanger/entity/gethot_infolist_entity.dart';
import 'package:flutter_vmanger/http/api.dart';
import 'package:flutter_vmanger/http/http.dart';

///getBannerData 活动场次
Future<GetbannerDataEntity> getBannerData(String type,int userId) async {
  var response = await dio.post(GET_BANNER_DATA, data: {"type": type,"userId":userId});
  if (response.statusCode == 200) {
    return GetbannerDataEntity.fromJson(json.decode(response.data.toString()));
  }
}
///getRoomRate top3
Future<GetroomRateEntity> getRoomRate(String startDate,String endDate,int systemId) async {
  var response = await dio.post(GET_ROOM_RATE, data: {"startDate": startDate,"endDate":endDate,"systemId":systemId,"orderBy":1,"type":0});
  if (response.statusCode == 200) {
    return GetroomRateEntity.fromJson(json.decode(response.data.toString()));
  }
}

///新增活动
Future<GethotInfolistEntity> getHotInfoList(int userId) async {
  var response = await dio.post(GET_HOT_INFO_LIST, data: {"userId": userId});
  if (response.statusCode == 200) {
    return GethotInfolistEntity.fromJson(json.decode(response.data.toString()));
  }
}