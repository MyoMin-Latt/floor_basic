// floor, floor generator, build runner, get

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_database_floor_byrubylearner/screen/home.dart';
import 'package:get/get.dart';

void main(){
  runApp(
    MyApp()
  );
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}