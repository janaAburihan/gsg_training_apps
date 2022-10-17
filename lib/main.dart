import 'package:flutter/material.dart';
//import 'package:gsg/responsive_design/responsive_screen.dart';
//import 'package:gsg/social_app/screens/post_main_screen.dart';
import 'package:gsg/task_management_app/screens/main_tasks_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MainTaskScreen(),
    );
  }
}
