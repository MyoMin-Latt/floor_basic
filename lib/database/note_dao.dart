// floor, floor generate, build runner, get

import 'package:floor/floor.dart';
import 'package:flutter_database_floor_byrubylearner/database/note_table.dart';
@dao
abstract class NoteDao{
  @Query('Select * from NoteTable')
  Stream<List<NoteTable>> getStream();
  @insert
  Future<void> addNote(NoteTable noteTable);
}