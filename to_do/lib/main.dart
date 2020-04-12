 
import 'package:flutter/material.dart';
import 'package:to_do/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        canvasColor: Colors.transparent
      ),
      //Our only screen/page we have
      home: HomePage(title: 'My Todo List'),
    );
  }
}
