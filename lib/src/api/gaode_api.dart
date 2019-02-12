import 'dart:async';
import 'package:dart_demo/src/exception/bs_exception.dart';
import 'package:dio/dio.dart';

class GaoDeApi {

  /// 根据给定的城市编码获取当前的天气数据
  /// 测试使用key: 42167db31cf6a8ff6eeced37d5433a68
  static Future getWeatherInfo({key, city, extensions}) async {
    try {
      Response response;
      response = await Dio().get(
          "https://restapi.amap.com/v3/weather/weatherInfo",
          data: {
            "key": key != null ? key : "42167db31cf6a8ff6eeced37d5433a68",
            "city": city != null ? city : "140105", // 城市编码:小店区
            "extensions": extensions != null ? extensions : "all", //base:返回实况天气 all:返回预报天气
            "output": "JSON" //返回格式: JSON、XML
          });
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("statusCode: ${response.statusCode}");
      }
    } catch (e) {
      throw e;
    }
  }

  ///根据给定的IP获取位置信息
  static Future getIPInfo(String key, String ip) async {
    try {
      Response response;
      response = await Dio().get(
          "https://restapi.amap.com/v3/ip",
          data: {
            "key": key,
            "ip": ip, // 城市编码:小店区
//            "sig": "all", //数字签名
            "output": "JSON" //返回格式: JSON、XML
          });
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("statusCode: ${response.statusCode}");
      }
    } catch (e) {
      throw BSException("getIPInfo");
    }
  }

}





