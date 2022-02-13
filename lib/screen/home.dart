
import 'package:flutter/material.dart';
import 'package:flutter_database_floor_byrubylearner/database/note_table.dart';
import 'package:flutter_database_floor_byrubylearner/database/notedao.dart';
import 'package:flutter_database_floor_byrubylearner/screen/add_screen.dart';
import 'package:flutter_database_floor_byrubylearner/screen/update_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  List<Note> notes = [];
  final NoteDao noteDao = Get.find();
  Home({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Floor Database'),
      ),
      body: noteList(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            heroTag: 'Add', // need to route
            onPressed: (){
              Get.to(AddScreen());
            },
            child: Icon(Icons.add)
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            heroTag: 'Delete',  // need to route
            onPressed: (){
              noteDao.deleteAllNote(notes);
            },
            child: Icon(Icons.delete)
          )
        ],
      ),
    );


    
  }

  Widget noteList(){
  return StreamBuilder<List<Note>>(
    stream: noteDao.getAllNotes(),
    builder: (_, data){
      if(data.hasData){
        notes = data.data!;
        return ListView.builder(
          itemCount: data.data!.length,
          itemBuilder: (_, position){
            return Card(
              child: ListTile(
                title: Text(data.data![position].title),
                subtitle: Text(data.data![position].message,),
                trailing: IconButton(
                  onPressed: (){
                    noteDao.deleteNote(data.data![position]);
                  }, 
                  icon: Icon(Icons.delete)
                ),
                leading: IconButton(
                  onPressed: (){
                    Get.to(UpdateScreen(), arguments: data.data![position]);
                  }, 
                  icon: Icon(Icons.edit)
                ),
              ),
            );
          }
        );
      }
      else if(data.hasError){
        return Center(child: Text('Error'),);
      }
      else{
        return Center(child: CircularProgressIndicator(),);
      }
    } 
  );
}
}


