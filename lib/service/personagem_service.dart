import 'dart:developer';

import 'package:alura_quest_app/models/PersonagemCreateDto.dart';
import 'package:alura_quest_app/models/personagem.dart';
import 'package:alura_quest_app/service/http_interceptors.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'package:uuid/uuid.dart';

class PersonagemService {
  static const String urlBase = "http://localhost:5146/";
  static const String subDomain = "personagem/";
  http.Client client =
      InterceptedClient.build(interceptors: [HttpInterceptors()]);

  String getUrl() {
    return "$urlBase$subDomain";
  }

  Future<bool> create(PersonagemCreateDto personagem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    log("Cai dentro 2");
      String jsonPersonagem = json.encode(personagem.toMap());
      log(jsonPersonagem);
      http.Response response = await client.post(
        Uri.parse(getUrl()),
        body: jsonPersonagem,
          headers: {
      "Accept": "application/json",
      "content-type":"application/json",
            "Authorization": "Bearer $token"
          }
      );
      log("Resposta");
      log(response.body);
      if (response.statusCode == 201) {
        return true;
      }
      return false;
  }

  Future<List<Personagem>> getAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");


      http.Response response = await client.get(
          Uri.parse(getUrl()), headers: {
        "Authorization": "Bearer $token"
      });
      List<Personagem> personagens = [];
      List<dynamic> listaDePersonagens = json.decode(response.body);

      for (var jsonMap in listaDePersonagens) {
        Personagem personagem = new Personagem(id: jsonMap['id'],
            nome: jsonMap['nome'],
            url: jsonMap['url'],
            raca: jsonMap['raca'],
            forca: jsonMap['forca'],
            vida: jsonMap['vida']);
        personagens.add(personagem);
      }
      return personagens;
  }

  Future<bool> deleta(int id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    http.Response response = await client.delete(
      Uri.parse("${getUrl()}${id}"),
        headers: {
          "Authorization": "Bearer $token"
        }
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }


  Future<bool> save(Personagem personagem) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");
    String jsonPersonagem = json.encode(personagem.toMap());
    http.Response response = await client.put(
      Uri.parse("${getUrl()}${personagem.id}"),
      body: jsonPersonagem,
        headers: {
          "Accept": "application/json",
          "content-type":"application/json",
          "Authorization": "Bearer $token"
        }
    );

    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
