import 'package:flutter/cupertino.dart';

printLog(String title, dynamic message) {
  debugPrint("-----------APPLOG::$title-----------");
  printWrapped(message.toString());
  debugPrint("----------------------------");
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}