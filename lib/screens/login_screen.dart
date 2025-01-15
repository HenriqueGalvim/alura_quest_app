import 'dart:developer';

import 'package:alura_quest_app/components/confirmation_dialog.dart';
import 'package:alura_quest_app/screens/initial_screen.dart';
import 'package:alura_quest_app/service/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(32),
        decoration:
        BoxDecoration(border: Border.all(width: 8), color: Colors.white),
        child: Form(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(
                    Icons.bookmark,
                    size: 64,
                    color: Colors.brown,
                  ),
                  const Text(
                    "Personagens",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const Text("por Henrique",
                      style: TextStyle(fontStyle: FontStyle.italic)),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Divider(thickness: 2),
                  ),
                  const Text("Entre ou Registre-se"),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      label: Text("E-mail"),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextFormField(
                    controller: _passController,
                    decoration: const InputDecoration(label: Text("Senha")),
                    keyboardType: TextInputType.visiblePassword,
                    maxLength: 16,
                    obscureText: true,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        login(context);
                      }, child: const Text("Continuar")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  login(BuildContext context) async {
    String email = _emailController.text;
    String password = _passController.text;

      bool result = await authService.login(email: email, password: password);
      if(!result){
        showConfirmationDialog(context,content:
        "Deseja criar um novo usuário usando o e-mail $email e a senha inserida?",
            affirmativeOption: "CRIAR").then((value) {
          if (value != null && value) {
            authService.register(email: email, password: password);
          }
        });
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (contextNew) => InitialScreen()),
        );
      }
  }
}