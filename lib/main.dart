import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_05_1_24/view/home_screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyDZZx0mA8-D2MoymTB_zjDG2mzEnWOZW9E",
          appId: "1:423564272923:android:cecd49d2b699f0198b1fbe",
          messagingSenderId: "",
          projectId: "task-project-b6e63",
          storageBucket: "task-project-b6e63.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
