import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'pages/homepage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/todoview.dart';
import 'package:provider/provider.dart';
import 'providers/task_provider.dart';

void main() {
  runApp(MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_) => NewTask()),

      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),

      home: splash(),
    );
  }
}
Widget splash(){
  return SplashScreen(
    seconds: 5,
    photoSize: 150.0,
    image: Image.asset(
      'assets/images/todos.png',
    ),
    title: Text('TODO',
      style: GoogleFonts.montserrat(
          color: Colors.redAccent,
          fontWeight: FontWeight.bold,
          fontSize: 24.0
      ),
    ),
    loadingText: Text('Organize your daily activities',
      style: GoogleFonts.poppins(
          color: Colors.redAccent,
          fontSize: 12.0
      ),
    ),
    navigateAfterSeconds: const MyHomePage(title: 'Todo'),
  );
}