
import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:flutter_database_floor_byrubylearner/database/note_dao.dart';
import 'note_dao.dart';
import 'note_table.dart';

part 'note_database.g.dart';
@Database(version: 1, entities: [NoteTable])
abstract class NoteDatabase extends FloorDatabase{
  NoteDao get noteDao;
}