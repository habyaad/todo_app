import 'package:flutter/material.dart';
import 'new_todo.dart';
class CreateTodo extends StatelessWidget {
  const CreateTodo({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create a new task'),
        ),
      body: const FormInput(),
    );
  }
}
