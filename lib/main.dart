import 'dart:developer';

import 'package:alura_quest_app/data/personagem_inheridt.dart';
import 'package:alura_quest_app/screens/initial_screen.dart';
import 'package:alura_quest_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  bool isLogged = await verifyToken();
  runApp(MyApp(isLogged: isLogged));
}

Future<bool> verifyToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? token = prefs.getString("token");

  if (token != null) {
    return true;
  }
  return false;
}

class MyApp extends StatelessWidget {
  final bool isLogged;
  const MyApp({Key? key, required this.isLogged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AluraQuest',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: (isLogged) ? "home" : "login",
      routes: {
        "home": (context) => const InitialScreen(),
        "login": (context) => LoginScreen(),
      },
    );
  }
}

