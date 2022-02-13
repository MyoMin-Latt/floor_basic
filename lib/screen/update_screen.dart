import 'package:flutter/material.dart';
import 'package:flutter_database_floor_byrubylearner/database/note_table.dart';
import 'package:flutter_database_floor_byrubylearner/database/notedao.dart';
import 'package:get/get.dart';

class UpdateScreen extends StatelessWidget {
  UpdateScreen({ Key? key }) : super(key: key);
  TextEditingController title = TextEditingController();
  TextEditingController message = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    Note note = Get.arguments;
    title.text = note.title;
    message.text = note.message;
    final NoteDao noteDao = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Note'),
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
                noteDao.updateNote(Note(title.text, message.text, id: note.id));
                Get.back();
                // print(note.id);
              }, 
              child: Text('Update Note'),
            )
          ],
        ),
      ),
    );
  }
}