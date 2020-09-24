import 'package:flutter/material.dart';
import 'package:hacker_news/pages/main/bloc/main_bloc_provider.dart';
import 'package:hacker_news/pages/main/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.red),
      home: MainBlocProvider(child: MainPage()),
    );
  }
}
