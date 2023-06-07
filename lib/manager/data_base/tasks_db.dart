import 'package:hive/hive.dart';

import '../../model/task_Details/task_model.dart';

class Tasks {

  static Box<TaskModel> getData() => Hive.box<TaskModel>('tasks');

}