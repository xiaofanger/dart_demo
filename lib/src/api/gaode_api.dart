import 'dart:async';
import 'package:logging/logging.dart';
import 'package:dio/dio.dart';
import 'package:dart_demo/src/util/index.dart';

class GaoDeApi {

  static Future getWeatherInfo() async {
    try {
      Response response;
      response = await Dio().get(
          "https://restapi.amap.com/v3/weather/weatherInfo",
          data: {
            "key": "42167db31cf6a8ff6eeced37d5433a68",
            "city": "140105", // 城市编码:小店区
            "extensions": "all", //base:返回实况天气 all:返回预报天气
            "output": "JSON" //返回格式: JSON、XML
          });
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception("statusCode: ${response.statusCode}");
      }
    } catch (e) {
      return print(e);
    }
  }

}



void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    ///自定义输出格式
    print('[${rec.level.name}] ${rec.time}: ${rec.loggerName}: ${rec.message}');
//    print(rec.toString());
  });

  final Logger log = new Logger("GaoDeApi");

  log.info("get weather info.");

  GaoDeApi.getWeatherInfo().then((onValue) {
    print(onValue);
  });

  log.warning(DateUtil.getDate());

  log.warning(DateUtil.getDateTime());

}

