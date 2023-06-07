import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sathguru/pages/login_page.dart';

import 'model/task_Details/task_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory() ;
  Hive.init(directory.path);
  Hive.registerAdapter(TaskModelAdapter()) ;
  await Hive.openBox<TaskModel>('tasks');
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LoginPage(),
    );
  }
}
