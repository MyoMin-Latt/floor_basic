// Select * from note => Small letter at note

import 'package:floor/floor.dart';
import 'note_table.dart';
@dao
abstract class NoteDao{
  @Query('Select * from note') 
  Stream<List<Note>> getAllNotes();
  @insert
  Future<void> addNote(Note note);
  @delete
  Future<void> deleteNote(Note note);
  @update
  Future<void> updateNote(Note note);
  @delete
  Future<void> deleteAllNote(List<Note> notes);
}