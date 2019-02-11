import 'dart:io';
import 'dart:convert';

class FileUtil {
  /**
   * launcher a websocker server.
   */
  runZoned() async {
    var server = await HttpServer.bind('127.0.0.1', 4040);
    server.listen((HttpRequest req) async {
      if (req.uri.path == '/ws') {
        var socket = await WebSocketTransformer.upgrade(req);
        socket.listen(print);
      }
    });
  }

  runSocker() async {
    // socket实现
    ServerSocket.bind('127.0.0.1', 4040)
        .then((serverSocket) {
      serverSocket.listen((socket) {
        socket.transform(utf8.decoder).listen(print);
      });
    });
  }

  /**
   * created directory.
   */
  getDirectory() async {
    new Directory('./dir/subdir').create(recursive: true)
    // The created directory is returned as a Future.
        .then((Directory directory) {
      print(directory.path);
    });
  }

  /**
   * list directory.
   */
  getSystemTemps() async {
    // Get the system temp directory.
    var systemTempDir = Directory.systemTemp;

    // List directory contents, recursing into sub-directories,
    // but not following symbolic links.
    systemTempDir.list(recursive: true, followLinks: false)
        .listen((FileSystemEntity entity) {
      print(entity.path);
    });
  }

  /**
   * [] 为参数数组
   */
  processlist() {
    Process.start('dart', ['--version']).then((process) {
      stdout.addStream(process.stdout);
      stderr.addStream(process.stderr);
      process.exitCode.then(print);
    });
  }
}