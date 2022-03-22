import 'package:flutter/material.dart';
import 'package:flutter_database_floor_byrubylearner/database/name_dao.dart';
import 'package:flutter_database_floor_byrubylearner/database/name_table.dart';
import 'package:flutter_database_floor_byrubylearner/screen/add.dart';
import 'package:flutter_database_floor_byrubylearner/screen/update.dart';
import 'package:get/get.dart';

// heroTag is very important for route

class HomePage extends StatefulWidget {
  
  HomePage(this.contactDao, { Key? key }) : super(key: key);
  ContactDao contactDao = Get.find();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ContactTable> _list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floor Database"),
      ),
      body: NoteList(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              heroTag: 'add', // heroTag is very important for route
              onPressed: (){
                Get.to(AddPage());
              },
              child: Icon(Icons.add)),
              SizedBox(width: 9,),
          FloatingActionButton(
            heroTag: 'delete',
            onPressed: () {
              widget.contactDao.deleteAllContact(_list);
            },
            child: Icon(Icons.delete),
          )
        ],
      ),
    );
  }

  Widget NoteList(){
    return StreamBuilder<List<ContactTable>>(
      stream: widget.contactDao.getStream(),
      builder: (BuildContext context, AsyncSnapshot<List<ContactTable>> snapshot){
        if(snapshot.hasData){
          _list = snapshot.data!;
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index){
              return Card(child: ListTile(
                onLongPress: () {
                  Get.to(UpdatePage(), arguments: snapshot.data![index]);
                },
                trailing: IconButton(onPressed: (){
                  widget.contactDao.deleteContact(snapshot.data![index]);
                }, icon: Icon(Icons.delete)),
                leading: Icon(Icons.phone, size: 30,),
                subtitle: Text(snapshot.data![index].phone),
                title: Text((index+1).toString() + '. '+ snapshot.data![index].name)));
            }
          );
        }
        else if(snapshot.hasError){
          return Center(child: Text('Snapshot has Error'),);
        }
        else{
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}
