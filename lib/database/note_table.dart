import 'package:floor/floor.dart';

@Entity(tableName: "NoteTable")
class NoteTable{
  
  @ColumnInfo(name: 'Title')
  @primaryKey
  String name;
  String phone;
  NoteTable(this.name, this.phone);
}