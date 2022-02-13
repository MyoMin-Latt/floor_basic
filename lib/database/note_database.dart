import 'dart:async';
import 'package:floor/floor.dart';
import 'package:flutter_database_floor_byrubylearner/database/note_table.dart';
import 'package:flutter_database_floor_byrubylearner/database/notedao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'note_database.g.dart';

@Database(version: 1, entities: [Note])
abstract class NoteDatabase extends FloorDatabase{
  NoteDao get noteDao;

}