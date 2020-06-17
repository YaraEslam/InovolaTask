import 'package:flutter/material.dart';
import 'package:inovola_task/screens/home.dart';

void main() {
  runApp(MaterialApp(
    title: 'Inovola task',
    debugShowCheckedModeBanner: false,
    home: Directionality(
      textDirection: TextDirection.rtl,
      child: Home(),
    ),
  ));
}
