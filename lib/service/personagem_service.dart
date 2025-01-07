import 'package:alura_quest_app/models/personagem.dart';
import 'package:alura_quest_app/service/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

class PersonagemService {
  static const String urlBase = "http://172.25.128.1:3000/";
  static const String subDomain = "personagem/";
  http.Client client =
      InterceptedClient.build(interceptors: [HttpInterceptors()]);

  String geturl() {
    return "$urlBase$subDomain";
  }

  create(Personagem personagem) {
    client.post(Uri.parse(geturl()), body: {
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
    http.Response response = await client.get(Uri.parse(geturl()));
    return response.body;
  }
}
