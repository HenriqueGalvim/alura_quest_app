import 'package:alura_quest_app/data/personagem_inheridt.dart';
import 'package:alura_quest_app/screens/form_screen.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  bool opacidade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade400,
        title: const Text(
          'AluraQuest',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 600),
        child: Container(
          color: Colors.white60,
          child: ListView(
            children: PersonagemInheridt.of(context)!.listaDePersonagens,
            padding: const EdgeInsets.only(top: 10, bottom: 75),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
  context,
  MaterialPageRoute(builder: (contextNew) => FormScreen(context)),
);
        },
        backgroundColor: Colors.red[100],
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
