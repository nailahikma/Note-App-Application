// import 'package:sqflite/sqflite.dart';

// class NoteLocalDatasource {
//   NoteLocalDatasource._init();

//   static final NoteLocalDatasource instance = NoteLocalDatasource._init();

//   final String tableNotes = 'notes';

//   static Database? _database;

//   Future<Database> _initDB(String filePath) async {
//     final dbPath = await getDatabasesPath();
//     final path = dbPath + filePath;

//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _createDB,
//     );
//   }

//   Future<void> _createDB(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE $tableNotes (
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         title TEXT,
//         content TEXT,
//         image TEXT,
//       )
//     ''');
//   }

//   // Save Order
//   // Future<int> saveOrder(OrderModel order) async {
//   //   final db = await instance.database;
//   //   int id = await db.insert('orders', order.toMapForLocal());
//   //   for (var orderItem in order.orders) {
//   //     await db.insert('order_item', orderItem.toMapForLocal(id));
//   //   }
//   //   return id;
//   // }


//   // get order item by id order
//   Future<List<OrderItem>> getNoteByUserId(int idUser) async {
//     final db = await instance.database;
//     final result = await db.query('notes', where: 'user_id = $idUser');
//     return result.map((e) => OrderItem.fromMap(e)).toList();
//   }

// }
