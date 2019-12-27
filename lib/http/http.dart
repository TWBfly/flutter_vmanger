import 'package:dio/dio.dart';

Dio dio = Dio(BaseOptions(
  baseUrl: "http://192.168.112.72:8080/apis/tm",
  connectTimeout: 5000,
  receiveTimeout: 3000,
  responseType: ResponseType.plain,//以字符串接收  Flutter FormatException: Unexpected character (at character 2)
));
