import 'package:alura_quest_app/models/personagem.dart';
import 'package:http/http.dart' as http;

class PersonagemService {
  static const String urlBase = "http://172.25.128.1:3000/";
  static const String subDomain = "personagem/";

  String geturl() {
    return "$urlBase$subDomain";
  }

  create(Personagem personagem) {
    http.post(Uri.parse(geturl()), body: {
      "personagem": {
        "nome": personagem.nome,
        "url": personagem.url,
        "raca": personagem.raca,
        "forca": personagem.forca,
        "vida": personagem.vida
      }
    });
  }

  get() async {
    http.Response response = await http.get(Uri.parse(geturl()));
    return response.body;
  }
}
