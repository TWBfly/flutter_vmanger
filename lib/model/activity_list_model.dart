import 'dart:convert';

import 'package:flutter_vmanger/http/api.dart';
import 'package:flutter_vmanger/http/http.dart';
import 'package:flutter_vmanger/entity/getmeeting_complete_data_entity.dart';
import 'package:flutter_vmanger/entity/getmeeting_list_entity.dart';
import 'package:flutter_vmanger/entity/getsmscode_entity.dart';

Future<GetmeetingCompleteDataEntity> getMeetingCompleteData(String startDate,String endDate,int userId) async {
  var response = await dio.post(GET_MEETING_COMPLETEDATA, data: {"startDate": startDate,"endDate":endDate,"userId":userId});
  if (response.statusCode == 200) {
    return GetmeetingCompleteDataEntity.fromJson(json.decode(response.data.toString()));
  }
}

Future<GetmeetingListEntity> getMeetingList(String startDate,String endDate,int userId,int curPage,int pageSize) async {
  var response = await dio.post(GET_MEETINGLIST, data: {"startDate": startDate,"endDate":endDate,"userId":userId,"curPage":curPage,"pageSize":pageSize});
  if (response.statusCode == 200) {
    return GetmeetingListEntity.fromJson(json.decode(response.data.toString()));
  }
}
Future<GetsmscodeEntity> followUserMeeting(int meetingId,int userId) async {
  var response = await dio.post(FOLLOW_USER_MEETING, data: {"meetingId": meetingId,"userId":userId});
  if (response.statusCode == 200) {
    return GetsmscodeEntity.fromJson(json.decode(response.data.toString()));
  }
}
Future<GetsmscodeEntity> cancelUserMeeting(int meetingId,int userId) async {
  var response = await dio.post(CANCEL_USER_MEETING, data: {"meetingId": meetingId,"userId":userId});
  if (response.statusCode == 200) {
    return GetsmscodeEntity.fromJson(json.decode(response.data.toString()));
  }
}


