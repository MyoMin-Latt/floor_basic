import 'package:flutter/material.dart';
import 'package:flutter_database_floor_byrubylearner/database/note_table.dart';
import 'package:flutter_database_floor_byrubylearner/database/notedao.dart';
import 'package:get/get.dart';

class AddScreen extends StatelessWidget {
  AddScreen({ Key? key }) : super(key: key);
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final NoteDao noteDao = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: 'Title',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: message,
              decoration: InputDecoration(
                hintText: 'Message',
                border: OutlineInputBorder()
              ),
            ),
            ElevatedButton(
              onPressed: (){
                noteDao.addNote(Note(title.text, message.text));
                Get.back();
              }, 
              child: Text('Add Note'),
            )
          ],
        ),
      ),
    );
  }
}