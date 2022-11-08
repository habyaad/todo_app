import 'package:flutter/material.dart';

class NewTask with ChangeNotifier{
 final List<Widget> _tasks =  [];

 List<Widget> get tasks => _tasks;

 void addTask(newTask){
   _tasks.add(newTask);
   notifyListeners();
 }
 void removeTask(task){
   _tasks.remove(task);
   notifyListeners();
 }
}

