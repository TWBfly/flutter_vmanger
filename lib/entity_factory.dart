import 'package:flutter_vmanger/entity/getbanner_data_entity.dart';
import 'package:flutter_vmanger/entity/gethot_infolist_entity.dart';
import 'package:flutter_vmanger/entity/getmeeting_complete_data_entity.dart';
import 'package:flutter_vmanger/entity/getmeeting_list_entity.dart';
import 'package:flutter_vmanger/entity/getroom_rate_entity.dart';
import 'package:flutter_vmanger/entity/getsmscode_entity.dart';
import 'package:flutter_vmanger/entity/login_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "GetbannerDataEntity") {
      return GetbannerDataEntity.fromJson(json) as T;
    } else if (T.toString() == "GethotInfolistEntity") {
      return GethotInfolistEntity.fromJson(json) as T;
    } else if (T.toString() == "GetmeetingCompleteDataEntity") {
      return GetmeetingCompleteDataEntity.fromJson(json) as T;
    } else if (T.toString() == "GetmeetingListEntity") {
      return GetmeetingListEntity.fromJson(json) as T;
    } else if (T.toString() == "GetroomRateEntity") {
      return GetroomRateEntity.fromJson(json) as T;
    } else if (T.toString() == "GetsmscodeEntity") {
      return GetsmscodeEntity.fromJson(json) as T;
    } else if (T.toString() == "LoginEntity") {
      return LoginEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}