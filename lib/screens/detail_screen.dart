import 'package:alura_quest_app/models/personagem.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // In the constructor, require a Todo.
   DetailScreen({super.key});

  // Declare a field that holds the Todo.
  final Personagem personagem = new Personagem("nome", "url", "s", 5, 100);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(personagem.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(personagem.raca),
      ),
    );
  }
}

