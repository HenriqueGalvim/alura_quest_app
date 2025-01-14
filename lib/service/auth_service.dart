import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';
import 'http_interceptors.dart';

class AuthService{
  //TODO: Modularizar o endpoint;
  static const String url = "http://localhost:5146/Usuario/";

  http.Client client = InterceptedClient.build(
      interceptors: [HttpInterceptors()]);

  Future<bool> login({required String email, required String password}) async {
    http.Response response = await client.post(
        Uri.parse('${url}login'),
      headers: {
        'Content-Type': 'application/json', // Define o tipo de conteúdo
      },
      body: jsonEncode({
        'username': email,
        'password': password,
      }),
    );
    if (response.statusCode != 200){
      String content = json.decode(response.body);
      switch (content){
        case "Usuário não autenticado":
          throw UserNotFoundException();
      }
      throw HttpException(response.body);
      return false;
    }

    return true;
  }

  register(){}
}

class UserNotFoundException implements Exception {}