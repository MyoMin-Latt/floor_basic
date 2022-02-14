// floor, floor generator, build runner, get

import 'package:flutter/material.dart';
import 'package:flutter_database_floor_byrubylearner/database/note_database.dart';
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
    return GetMaterialApp(
      home: FutureBuilder(
        future: $FloorNoteDatabase.databaseBuilder('note.db').build(),
        builder: (BuildContext context, AsyncSnapshot<NoteDatabase> snapshot){
          if(snapshot.hasData){
            return HomePage(snapshot.data!.noteDao);
          }
          else if(snapshot.hasError){
            return Center(child: Text('Error'),);
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }
  
}