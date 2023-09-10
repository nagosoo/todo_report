import 'package:sqflite/sqflite.dart';
import 'package:todo_report/model/short_rating_model.dart';
import 'package:todo_report/model/todo_report_model.dart';

import '../../util/const.dart';

class AppDatabase {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('todo_report.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = [dbPath, filePath].join();
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  //open the db
  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT';
    const integerType = 'INTEGER NOT NULL';

    await db.execute('''
CREATE TABLE $tableTodoReport ( 
 id $idType, 
  dateTime $integerType,
  title $textType,
  stamp $textType
  )
''');

    await db.execute('''
CREATE TABLE $tableShortRating ( 
 id $idType, 
  dateTime $integerType,
  rating $textType
  )
''');
  }

  //insert todoReportModel
  Future<void> insertTodoReportModel(TodoReportModel todoReportModel) async {
    final db = await database;
    await db.insert(tableTodoReport, todoReportModel.toMap());
  }

  //insert shortRatingModel
  Future<void> insertShortRatingModel(ShortRatingModel shortRatingModel) async {
    final db = await database;
    await db.insert(tableShortRating, shortRatingModel.toMap());
  }

  //update todoReportModel
  Future<int> updateTodoReportModel(TodoReportModel todoReportModel) async {
    final db = await database;

    return db.update(
      tableTodoReport,
      todoReportModel.toMap(),
      where: 'id = ?',
      whereArgs: [todoReportModel.id],
    );
  }

  //update shortRatingModel
  Future<int> updateShortRatingModel(ShortRatingModel shortRatingModel) async {
    final db = await database;

    return db.update(
      tableShortRating,
      shortRatingModel.toMap(),
      where: 'id = ?',
      whereArgs: [shortRatingModel.id],
    );
  }

  //특정 날짜 TodoReportModel 읽기
  Future<List<TodoReportModel>> getTodoReportModelWithDate(int dateTime) async {
    final db = await database;

    final maps = await db.query(
      tableTodoReport,
      columns: ['id', 'dateTime', 'title', 'stamp'],
      where: 'dateTime = ?',
      whereArgs: [dateTime],
    );

    if (maps.isEmpty) {
      return [];
    }

    List<TodoReportModel> list = List.generate(maps.length, (index) {
      return TodoReportModel(
        id: maps[index]['id'] as int,
        dateTime: maps[index]['dateTime'] as int,
        title: maps[index]['title'] as String?,
        stamp: maps[index]['stamp'] as String?,
      );
    });

    return list;
  }

  //특정 날짜 shortRatingModel 읽기
  Future<ShortRatingModel> getShortRatingModelWithDate(int dateTime) async {
    final db = await database;

    final maps = await db.query(
      tableShortRating,
      columns: [
        'id',
        'dateTime',
        'rating',
      ],
      where: 'dateTime = ?',
      whereArgs: [dateTime],
    );

    if (maps.isEmpty) {
      return ShortRatingModel();
    }

    List<ShortRatingModel> list = List.generate(maps.length, (index) {
      return ShortRatingModel(
        id: maps[index]['id'] as int,
        dateTime: maps[index]['dateTime'] as int,
        rating: maps[index]['rating'] as String?,
      );
    });

    return list.first;
  }

  //모든 shortRating 읽기
  Future<List<ShortRatingModel>> getAllShortRating() async {
    final db = await database;

    final maps = await db.query(
      tableShortRating,
      columns: [
        'id',
        'dateTime',
        'rating',
      ],
    );

    if (maps.isEmpty) {
      return [];
    }

    List<ShortRatingModel> list = List.generate(maps.length, (index) {
      return ShortRatingModel(
        id: maps[index]['id'] as int,
        dateTime: maps[index]['dateTime'] as int,
        rating: maps[index]['rating'] as String?,
      );
    });

    return list;
  }

  //모든 todoReport 읽기
  Future<List<TodoReportModel>> getAllTodoReport() async {
    final db = await database;

    final maps = await db.query(
      tableTodoReport,
      columns: ['id', 'dateTime', 'title', 'stamp'],
    );

    if (maps.isEmpty) {
      return [];
    }

    List<TodoReportModel> list = List.generate(maps.length, (index) {
      return TodoReportModel(
        id: maps[index]['id'] as int,
        dateTime: maps[index]['dateTime'] as int,
        title: maps[index]['title'] as String?,
        stamp: maps[index]['stamp'] as String?,
      );
    });

    return list;
  }

  // //해당 달의 모든 shortRatingModel 읽기
  // Future<List<ShortRatingModel>> getShortRatingForMonth(
  //   int year,
  //   int month,
  // ) async {
  //   final db = await database;
  //   DateTime dateTime = DateTime(
  //     year,
  //     month,
  //   );
  //
  //   final maps = await db.query(
  //     tableShortRating,
  //     columns: [
  //       'id',
  //       'dateTime',
  //       'rating',
  //     ],
  //     where: 'dateTime >= ? AND dateTime <= ?',
  //     whereArgs: [dateTime.toFirstDayOfMonth(), dateTime.toLastDayOfMonth()],
  //   );
  //
  //   if (maps.isEmpty) {
  //     return [];
  //   }
  //
  //   List<ShortRatingModel> list = List.generate(maps.length, (index) {
  //     return ShortRatingModel(
  //       id: maps[index]['id'] as int,
  //       dateTime: maps[index]['dateTime'] as int,
  //       rating: maps[index]['rating'] as String?,
  //     );
  //   });
  //
  //   return list;
  // }
  //
  // //해당 달의 모든 todoReportModel 읽기
  // Future<List<TodoReportModel>> getTodoReportForMonth(
  //   int year,
  //   int month,
  // ) async {
  //   final db = await database;
  //
  //   DateTime dateTime = DateTime(
  //     year,
  //     month,
  //   );
  //
  //   final maps = await db.query(
  //     tableTodoReport,
  //     columns: ['id', 'dateTime', 'title', 'stamp'],
  //     where: 'dateTime >= ? AND dateTime <= ?',
  //     whereArgs: [dateTime.toFirstDayOfMonth(), dateTime.toLastDayOfMonth()],
  //   );
  //
  //   if (maps.isEmpty) {
  //     return [];
  //   }
  //
  //   List<TodoReportModel> list = List.generate(maps.length, (index) {
  //     return TodoReportModel(
  //       id: maps[index]['id'] as int,
  //       dateTime: maps[index]['dateTime'] as int,
  //       title: maps[index]['title'] as String?,
  //       stamp: maps[index]['stamp'] as String?,
  //     );
  //   });
  //
  //   for (var e in list) {
  //     debugPrint('todoReportModel: ${e.toString()}');
  //   }
  //   return list;
  // }

  //delete todoReportModel
  Future<int> deleteTodoReportModel(int id) async {
    final db = await database;

    return await db.delete(
      tableTodoReport,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //delete shortRatingModel
  Future<int> deleteShortRatingModel(int id) async {
    final db = await database;

    return await db.delete(
      tableShortRating,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await database;
    db.close();
  }
}
