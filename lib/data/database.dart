import 'package:alura_quest_app/data/personagemDAO.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'personagem.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(PersonagemDao.tableSql);
  }, version: 1);
}