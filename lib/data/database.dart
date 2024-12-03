import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'personagem.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(tableSql);
  }, version: 1);
}

const String tableSql = 'CREATE TABLE $_tableName';

const String _tableName = 'PersonagemTable';