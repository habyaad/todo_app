import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'createTodo.dart';
import 'package:todo_app/providers/done_provider.dart';
import 'package:provider/provider.dart';

class TodoView extends StatelessWidget {
  const TodoView({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) =>  const CreateTodo()
          ));
        },

      ),
      body: Column(
        children: [
          Expanded(

            flex: 1,
            child:  Container(
              width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0))
      ),
                child: Center(
                  child: Text('Hi $name! ',
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0
                    ),
                  ),
                ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        context.read<NewTask>().tasks.isNotEmpty? const Text('Tasks', style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold, color: Colors.redAccent),): const Text(''),
                        Expanded(
                          child: ListView(
                             children: <Widget>[
                               for(var i in context.watch<NewTask>().tasks) i
                             ],
                           ),
                        ),
                      ],
                    ),
                  )),
          )
        ]
      ),
    );
  }
}

class Todo extends StatelessWidget {
  const Todo({Key? key, required this.task, this.description}) : super(key: key);
  final String task;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: (
          Card(
            child: ListTile(
                title: Text(task),
                subtitle: Text(description!),
                leading: ChangeNotifierProvider(
                  create: (_) => CheckboxProvider(),
                  child: Consumer<CheckboxProvider>(
                    builder: (context, checkboxProvider, _) => Checkbox(
                      value: checkboxProvider.isChecked,
                      onChanged: (value) {
                        checkboxProvider.isChecked = value ?? true;
                      },
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: ()=>{
                    context.read<NewTask>().removeTask(this),

                  },
                  tooltip: 'Delete',
                )

            ),
          )
      ),
    );
  }
}
