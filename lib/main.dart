import 'package:flutter/material.dart';
import 'package:scroller/body.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scrolling',
      
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        elevation: 0,
        title:  Text(
          'Autoscroll',
          style: TextStyle(
            color: Colors.grey[200],
            fontSize: 14.0,
            fontWeight: FontWeight.bold
          ),
          ),
      ),
      body: const MyBody(),
    );
  }
}