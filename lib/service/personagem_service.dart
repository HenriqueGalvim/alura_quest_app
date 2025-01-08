import 'dart:developer';

import 'package:alura_quest_app/models/personagem.dart';
import 'package:alura_quest_app/service/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'dart:convert';

import 'package:uuid/uuid.dart';

class PersonagemService {
  static const String urlBase = "http://172.25.128.1:3000/";
  static const String subDomain = "personagem/";
  http.Client client =
      InterceptedClient.build(interceptors: [HttpInterceptors()]);

  String getUrl() {
    return "$urlBase$subDomain";
  }

  Future<bool> create(Personagem personagem) async {
    String jsonPersonagem = json.encode(personagem.toMap());
    http.Response response = await client.post(
      Uri.parse(getUrl()),
      body: jsonPersonagem,
    );

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  Future<List<Personagem>> getAll() async {
    http.Response response = await client.get(Uri.parse(getUrl()));

    List<Personagem> personagens = [];
    List<dynamic> listaDePersonagens = json.decode(response.body);
    log("Log dos personagens");
    log(listaDePersonagens.toString());

    for (var jsonMap in listaDePersonagens) {
      log("Personagem");
      log(jsonMap.toString());
      log("Teste");
      log(Personagem.fromMap(jsonMap.id.jsonMap).toString());
      Map<String,dynamic> personagemTeste = {"id": jsonMap};
      log(personagemTeste.toString());
      personagens.add(Personagem.fromMap(personagemTeste));
    }
    log("Testeeee");
    log("personagens: ${personagens.toString()
    }");
    return personagens;
  }
}
