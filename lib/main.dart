import 'package:flutter/material.dart';

import 'home/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //final appTitle = 'Form Validation Demo';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: HomePage(),
      ),
    );
  }
}

