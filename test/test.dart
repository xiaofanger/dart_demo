
import 'package:dart_demo/src/api/gaode_api.dart';
import 'package:dart_demo/src/util/index.dart';
import 'package:logging/logging.dart';

/**
 * 测试组类
 */
void main() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((LogRecord rec) {
    ///自定义输出格式
    print('[${rec.level.name}] ${rec.time}: ${rec.loggerName}: ${rec.message}');
//    print(rec.toString());
  });

  final Logger log = new Logger("GaoDeApi");
  final String key = "42167db31cf6a8ff6eeced37d5433a68";


  GaoDeApi.getWeatherInfo().then((onValue) {
    log.info("display weather info:");
    print(onValue);
  });

  log.warning(DateUtil.getDate());

  log.warning(DateUtil.getDateTime());

  GaoDeApi.getIPInfo(key, "114.247.50.2").then((onValue) {
    log.info("display ip info:");
    print(onValue);
  });

}