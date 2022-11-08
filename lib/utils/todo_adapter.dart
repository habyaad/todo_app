import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class TodoModel{
  @HiveField(0)
  final String task;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final bool isCompleted;

  TodoModel(this.task, this.description, this.isCompleted);
}