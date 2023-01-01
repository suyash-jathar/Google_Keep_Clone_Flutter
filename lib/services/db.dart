// import 'package:google_keep_clone_application_1/services/firestore_db.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// import '../model/MyNoteModel.dart';

// class NotesDatabase {
//   static final NotesDatabase instance = NotesDatabase._init();
//   static Database? _database;
//   NotesDatabase._init();

//   Future<Database?> get database async {
//     if (_database != null) return _database;
//     _database = await _initializeDB('Notes.db');
//     return _database;
//   }

//   Future<Database> _initializeDB(String filepath) async {
//     final dbPath = await getDatabasesPath();
//     final path = join(dbPath, filepath);

//     return await openDatabase(path, version: 1, onCreate: _createDB);
//   }

//   Future _createDB(Database db, int version) async {
//     final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     final boolType = 'BOOLEAN NOT NULL';
//     final textType = 'TEXT NOT NULL';
//     await db.execute('''
//     CREATE TABLE Notes(
//       ${NotesImpName.id} $idType,
//       ${NotesImpName.pin} $boolType,
//       ${NotesImpName.isArchieve} $boolType,
//       ${NotesImpName.title} $textType,
//       ${NotesImpName.content} $textType,
//       ${NotesImpName.createdTime} $textType
//     )
//     ''');
//   }

// // Will Return Packet
//   Future<Note?> InsertEntry(Note note) async {
//     await FireDB().createNewNoteFirestore(note);
//     final db = await instance.database;
//     final id = await db!.insert(NotesImpName.TableName, note.toJson());
//     return note.copy(id: id);
//   }

//   Future<List<Note>> readAllNotes() async {
//     final db = await instance.database;
//     final orderBy = '${NotesImpName.createdTime} ASC';
//     final query_result = await db!.query(
//       NotesImpName.TableName,
//       orderBy: orderBy,
//     );
//     print(query_result);
//     return query_result.map((json)=>Note.fromJSON(json)).toList();
//   }

//   Future<Note?> readOneNote(int id) async {
//     final db = await instance.database;
//     final map = await db!.query(
//       NotesImpName.TableName,
//       columns: NotesImpName.values,
//       where: '${NotesImpName.id}=?',
//       whereArgs: [id],
//     );
//     if(map.isNotEmpty){
//       return Note.fromJSON(map.first);
//     }
//     else{
//       return null;
//     }
//   }

//   Future updateNotes(Note note) async {
//     await FireDB().updateNoteFirestore(note);
//     final db = await instance.database;
//     return await db!.update(
//       NotesImpName.TableName,
//       note.toJson(),
//       where: '${NotesImpName.id}==?',
//       whereArgs: [note.id],
//     );
//   }

//   Future pinNote(Note? note)async{
//     final db=await instance.database;
//     return await db!.update(
//       NotesImpName.TableName,
//       {NotesImpName.pin:!note!.pin?1:0},
//       where: '${NotesImpName.id}==?',
//       whereArgs: [note.id],
//       );
//   }
//   Future archieveNote(Note? note)async{
//     final db=await instance.database;
//     return await db!.update(
//       NotesImpName.TableName,
//       {NotesImpName.isArchieve:!note!.isArchieve?1:0},
//       where: '${NotesImpName.id}==?',
//       whereArgs: [note.id],
//       );
//   }

//   Future<List<int>> getNoteString(String query) async
//   {
//     final db= await instance.database;
//     final result=await db!.query(NotesImpName.TableName);
//     List<int> resultIds=[];
//     result.forEach((element) {
//       if(element["title"].toString().toLowerCase().contains(query) || element["content"].toString().toLowerCase().contains(query))
//       {
//         resultIds.add(element["id"] as int );
//       }
//     });
//     return resultIds;
//   }

//   Future deleteOneNote(Note note) async {
//     final db = await instance.database;
//     return await db!.delete(NotesImpName.TableName, where: '${NotesImpName.id}=?', whereArgs: [note.id]);
//   }
//   Future deleteNote(Note? note) async {
//     await FireDB().deleteNoteFireStore(note!);
//     final db = await instance.database;
//     return await db!.delete(NotesImpName.TableName, where: '${NotesImpName.id}=?', whereArgs: [note.id]);
//   }

//   Future closeDB()async{
//     final db=await instance.database;
//     db!.close();
//   }
// }

import 'package:google_keep_clone_application_1/services/firestore_db.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../model/MyNoteModel.dart';

class NotesDatabse {
  static final NotesDatabse instance = NotesDatabse._init();
  static Database? _database;
  NotesDatabse._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB('NewNotes.db');
    return _database;
  }

  Future<Database> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final boolType = ' BOOLEAN NOT NULL';
    final textType = 'TEXT NOT NULL';
    await db.execute('''
    CREATE TABLE Notes(
      ${NotesImpNames.id} $idType,
      ${NotesImpNames.uniqueID} $textType,
      ${NotesImpNames.pin} $boolType,
      ${NotesImpNames.isArchieve} $boolType,
      ${NotesImpNames.title} $textType,
      ${NotesImpNames.content} $textType,
      ${NotesImpNames.createdTime} $textType
  
    )
    ''');
  }

  Future<Note?> InsertEntry(Note note) async {
    final db = await instance.database;
    final id = await db!.insert(NotesImpNames.TableName, note.toJson());
    await FireDB().createNewNoteFirestore(note);
    return note.copy(id: id);
  }

  Future<List<Note>> readAllNotes() async {
    final db = await instance.database;
    final orderBy = '${NotesImpNames.createdTime} ASC';
    final query_result =
        await db!.query(NotesImpNames.TableName, orderBy: orderBy);
    return query_result.map((json) => Note.fromJson(json)).toList();
  }

  Future<List<Note>> readAllArchiveNotes() async {
    final db = await instance.database;
    final orderBy = '${NotesImpNames.createdTime} ASC';
    final query_result =
        await db!.query(NotesImpNames.TableName, orderBy: orderBy,where: '${NotesImpNames.isArchieve} = 1');
    return query_result.map((json) => Note.fromJson(json)).toList();
  }

  Future<Note?> readOneNote(int id) async {
    final db = await instance.database;
    final map = await db!.query(NotesImpNames.TableName,
        columns: NotesImpNames.values,
        where: '${NotesImpNames.id} = ?',
        whereArgs: [id]);
    if (map.isNotEmpty) {
      return Note.fromJson(map.first);
    } else {
      return null;
    }
  }

  Future updateNote(Note note) async {
    await FireDB().updateNoteFirestore(note);
    final db = await instance.database;

    await db!.update(NotesImpNames.TableName, note.toJson(),
        where: '${NotesImpNames.id} = ?', whereArgs: [note.id]);
  }

  Future pinNote(Note? note) async {
    final db = await instance.database;

    await db!.update(
        NotesImpNames.TableName, {NotesImpNames.pin: !note!.pin ? 1 : 0},
        where: '${NotesImpNames.id} = ?', whereArgs: [note.id]);
  }

  Future archNote(Note? note) async {
    final db = await instance.database;

    await db!.update(NotesImpNames.TableName,
        {NotesImpNames.isArchieve: !note!.isArchieve ? 1 : 0},
        where: '${NotesImpNames.id} = ?', whereArgs: [note.id]);
  }

  Future<List<int>> getNoteString(String query) async {
    final db = await instance.database;
    final result = await db!.query(NotesImpNames.TableName);
    List<int> resultIds = [];
    result.forEach((element) {
      if (element["title"].toString().toLowerCase().contains(query) ||
          element["content"].toString().toLowerCase().contains(query)) {
        resultIds.add(element["id"] as int);
      }
    });

    return resultIds;
  }

  Future delteNote(Note? note) async {
    await FireDB().deleteNoteFirestore(note!);
    final db = await instance.database;

    await db!.delete(NotesImpNames.TableName,
        where: '${NotesImpNames.id}= ?', whereArgs: [note.id]);
  }

  Future closeDB() async {
    final db = await instance.database;
    db!.close();
  }
}
