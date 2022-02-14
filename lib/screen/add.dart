import 'package:flutter/material.dart';
import 'package:flutter_database_floor_byrubylearner/database/note_table.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  AddPage({ Key? key }) : super(key: key);
  final _name = TextEditingController();
  final _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(title: Text('Add Contact'),),
      body: Column(children: [
        TextField(
          controller: _name,
          decoration: InputDecoration(
            labelText: 'Name',
            hintText: "eg. Mg Mg"
          ),
        ),
        SizedBox(height: 7,),
        TextField(
          controller: _phone,
          decoration: InputDecoration(
            labelText: 'Phone No.',
            hintText: "eg. 09123456789"
          ),
        ),
        ElevatedButton(onPressed: (){
          Get.back();
          print(_name.text + _phone.text);
        }, child: Text("Save"))
      ],),
    );
  }
}