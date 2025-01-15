import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'http_interceptors.dart';

class AuthService{
  //TODO: Modularizar o endpoint;
  static const String url = "http://localhost:5146/usuario/";

  http.Client client = InterceptedClient.build(
      interceptors: [HttpInterceptors()]);

  Future<bool> login({required String email, required String password}) async {
    http.Response response = await client.post(
        Uri.parse('${url}login'),
      headers: {
        'Content-Type': 'application/json', // Define o tipo de conteúdo
      },
      body: jsonEncode({
        'Username': email,
        'Password': password,
      }),
    );
    if (response.statusCode != 200){
      return false;
    }

    saveUserInfos(response.body);

    return true;
  }

  Future<bool> register({required String email, required String password}) async {
    http.Response response = await client.post(
      Uri.parse('${url}cadastro'),
      headers: {
        'Content-Type': 'application/json', // Define o tipo de conteúdo
      },
      body: jsonEncode({
        "username": email,
        "password": password,
        "rePassword": password
      }),
    );
    if (response.statusCode != 200){
      String content = json.decode(response.body);
      switch (content){
        case "System.ApplicationException: Usuário não cadastrado":
          throw UserNotFoundException();
      }
      return false;
    }
    return true;
  }

  saveUserInfos(String body) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", body);
    String? tokenSalvo = prefs.getString("token");
  }
}

class UserNotFoundException implements Exception {}