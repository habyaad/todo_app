import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/task_provider.dart';
import 'todoview.dart';

class FormInput extends StatelessWidget {
  const FormInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController task = TextEditingController();
    final TextEditingController description = TextEditingController();

    return(
        Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text('Enter new task',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      controller: task,
                      decoration: const InputDecoration(
                          hintText: 'Enter task',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          )
                      ),
                      validator: (value) {
                        if(value != null && value.isNotEmpty){
                          return null;
                        }
                        return 'Enter a task';
                      },

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Description(Optional)',
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: TextFormField(
                      controller: description,

                      decoration: const InputDecoration(
                          hintText: 'Description',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          )
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:18.0),

                    child: MaterialButton(
                      height: 48.0,
                      color: Colors.redAccent,
                      onPressed: ()=>{
                        if(formKey.currentState!.validate()){
                        context.read<NewTask>().addTask(Todo(task: task.text, description: description.text)),
                        Navigator.pop(context)
                      }},
                      child:  Text('Create Task',
                        style: GoogleFonts.poppins(
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
        )
    );  }
}
