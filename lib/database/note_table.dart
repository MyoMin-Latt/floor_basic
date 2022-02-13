import 'package:floor/floor.dart';
import 'package:flutter/material.dart';

@Entity(tableName: "NoteTable")
class NoteTable{
  @PrimaryKey(autoGenerate: true)
  String id;
  String name;
  String phone;
  NoteTable(this.id, this.name, this.phone);
}
