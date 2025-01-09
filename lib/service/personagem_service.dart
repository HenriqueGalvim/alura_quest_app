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

    for (var jsonMap in listaDePersonagens) {
      Personagem personagem = new Personagem(id: jsonMap['id'], nome: jsonMap['nome'], url: jsonMap['url'], raca: jsonMap['raca'], forca: jsonMap['forca'], vida: jsonMap['vida']);
      personagens.add(personagem);
    }
    return personagens;
  }

  Future<bool> deleta(String id) async {
    http.Response response = await client.delete(
      Uri.parse("${getUrl()}${id}"),
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }


  Future<bool> save(Personagem personagem) async {
    String jsonPersonagem = json.encode(personagem.toMap());
    http.Response response = await client.put(
      Uri.parse("${getUrl()}${personagem.id}"),
      body: jsonPersonagem,
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
