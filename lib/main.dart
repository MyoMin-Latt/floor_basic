// very important
// Create method in dao> run flutter pub run build_runner watch > save(Ctrl + s)


import 'package:flutter/material.dart';
import 'package:flutter_database_floor_byrubylearner/database/note_database.dart';
import 'package:flutter_database_floor_byrubylearner/database/notedao.dart';
import 'package:flutter_database_floor_byrubylearner/screen/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // get
      home: FutureBuilder<NoteDatabase>(
        future: $FloorNoteDatabase.databaseBuilder('note.db').build(),
        builder: (context, data){
          if(data.hasData){
            Get.put(data.data!.noteDao); // get
            return Home();
          }
          else if(data.hasError){
            return Center(child: Text('Error'));
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },
      ),
    );
  }
}