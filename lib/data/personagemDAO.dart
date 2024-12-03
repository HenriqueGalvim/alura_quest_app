import 'package:alura_quest_app/components/personagem_card.dart';

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

}
