import 'package:flutter/material.dart';
import 'package:flutter_walpaper/pages/home.dart';

void main() {
  runApp(FlutterWalpaper());
}

class FlutterWalpaper extends StatelessWidget {
  const FlutterWalpaper({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Walpaper',
      home: HomePage(),
    );
  }
}
