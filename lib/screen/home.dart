import 'package:flutter/material.dart';
import 'package:flutter_database_floor_byrubylearner/screen/add.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, 
            MaterialPageRoute(builder: (context) {
              return AddPage();
            },));
          }, icon: Icon(Icons.next_plan))
        ],
        title: Text("Floor Database"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return AddPage();
              }));
            },
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(onPressed: () {}, child: Icon(Icons.delete)),
        ],
      ),
    );
  }
}


