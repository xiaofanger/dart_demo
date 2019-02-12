
///
///自定义业务异常类
///
class BSException implements Exception {

  final message;

  BSException([this.message]);

  String toString() {
    if (message == null) return "Exception";
    return "BSException: $message";
  }

}