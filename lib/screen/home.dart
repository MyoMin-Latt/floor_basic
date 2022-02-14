import 'package:flutter/material.dart';
import 'package:flutter_database_floor_byrubylearner/database/note_table.dart';
import 'package:flutter_database_floor_byrubylearner/database/notedao.dart';
import 'package:flutter_database_floor_byrubylearner/screen/add.dart';
import 'package:get/get.dart';

// heroTag is very important for route

class HomePage extends StatelessWidget {
  NoteDao noteDao;
  HomePage(this.noteDao, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floor Database"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'add', // heroTag is very important for route
              onPressed: () {
                noteDao.addNote(Note("This is Name", "This is phone no"));
              },
              child: Icon(Icons.add)),
              SizedBox(width: 9,),
          FloatingActionButton(
            heroTag: 'delete',
            onPressed: () {},
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }

}
