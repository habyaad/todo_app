import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'todoview.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    TextEditingController? name = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: TextFormField(
                controller: name,
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                    hintText: 'Enter your name to continue',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    )
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  TodoView(name: name.text)
                  )
                  );
                },
                child: Text('Submit',
                style: GoogleFonts.montserrat(
                    fontSize: 14.0
                ),
                ))
          ],
        ),
      ),
    );
  }
}

