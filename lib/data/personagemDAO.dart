import 'package:alura_quest_app/components/personagem_card.dart';
import 'package:alura_quest_app/data/database.dart';
import 'package:sqflite/sqflite.dart';

class PersonagemDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_url TEXT¨, '
      '$_raca TEXT¨, '
      '$_forca INTEGER¨, '
      '$_vida INTEGER¨)';

  static const String _tableName = 'PersonagemTable';
  static const String _name = 'nome';
  static const String _url = 'url';
  static const String _raca = 'raca';
  static const String _forca = 'forca';
  static const String _vida = 'vida';

  save(PersonagemCard personagem) async {
    final Database database = await getDatabase();
    var isExist = await find(personagem.nome);
    if (isExist.isEmpty) {
      return await database.insert(_tableName, toMap(personagem));
    } else {
      return await database.update(_tableName, toMap(personagem),
          where: '$_name = ?', whereArgs: [personagem.nome]);
    }
  }

  Future<List<PersonagemCard>> findAll() async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(_tableName);
    return toList(result);
  }

  Map<String, dynamic> toMap(PersonagemCard personagem) {
    final Map<String, dynamic> mapPersonagem = Map();
    mapPersonagem[_name] = personagem.nome;
    mapPersonagem[_url] = personagem.url;
    mapPersonagem[_raca] = personagem.raca;
    mapPersonagem[_forca] = personagem.forca;
    mapPersonagem[_vida] = personagem.vida;

    return mapPersonagem;
  }

  List<PersonagemCard> toList(List<Map<String, dynamic>> mapaDePersonagens) {
    final List<PersonagemCard> personagens = [];
    for (Map<String, dynamic> linha in mapaDePersonagens) {
      final PersonagemCard personagemCard = PersonagemCard(
          linha[_name], linha[_url], linha[_raca], linha[_forca]);
      personagens.add(personagemCard);
    }
    return personagens;
  }

  Future<List<PersonagemCard>> find(String nomeDoPersonagem) async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> result = await database
        .query(_tableName, where: '$_name = ?', whereArgs: [nomeDoPersonagem]);
    return toList(result);
  }

  delete(String nomeDoPersonagem) async {
    final Database database = await getDatabase();
    return database.delete(_tableName, where: '$_name = ? ', whereArgs: [nomeDoPersonagem]  );
  }
}
