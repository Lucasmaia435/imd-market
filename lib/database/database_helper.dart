import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:mobile/models/product.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'products.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE products(code TEXT PRIMARY KEY, name TEXT, description TEXT, storage INTEGER)',
        );
      },
    );
  }

  Future<void> insertProduct(Product product) async {
    final db = await database;
    await db.insert('products', product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return Product(
        code: maps[i]['code'],
        name: maps[i]['name'],
        description: maps[i]['description'],
        storage: maps[i]['storage'],
      );
    });
  }

  Future<void> updateProduct(Product product) async {
    final db = await database;
    await db.update('products', product.toMap(),
        where: 'code = ?', whereArgs: [product.code]);
  }

  Future<void> deleteProduct(String code) async {
    final db = await database;
    await db.delete('products', where: 'code = ?', whereArgs: [code]);
  }
}
