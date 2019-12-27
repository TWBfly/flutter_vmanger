import 'package:flutter_vmanger/entity/getsmscode_entity.dart';
import 'package:flutter_vmanger/entity/login_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "GetsmscodeEntity") {
      return GetsmscodeEntity.fromJson(json) as T;
    } else if (T.toString() == "LoginEntity") {
      return LoginEntity.fromJson(json) as T;
    }
    else {
      return null;
    }
  }
}