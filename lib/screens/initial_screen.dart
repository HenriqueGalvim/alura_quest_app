import 'package:alura_quest_app/components/personagem_card.dart';
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
            children: const [
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: PersonagemCard(
                      "Aragorn",
                      "https://th.bing.com/th/id/R.0d96ce0237f2b3c05225f75a2d50dff5?rik=PQpdhbN03x1wuA&pid=ImgRaw&r=0",
                      "Humano",
                      3)),
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: PersonagemCard(
                      "Legolas",
                      "https://th.bing.com/th/id/R.9d6be011a84eeebdc1250f0b77a22054?rik=RZtLGT0wDTVoIw&pid=ImgRaw&r=0",
                      "Elfo",
                      5)),
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: PersonagemCard(
                      "Gimli",
                      "https://th.bing.com/th/id/R.97f42309db427c761c7581f96a47b43f?rik=PjWPVYd7z%2fpiaQ&pid=ImgRaw&r=0",
                      "Anão",
                      5)),
              Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: PersonagemCard(
                      "Gandalf",
                      "https://th.bing.com/th/id/R.3a77a78e93845e6ec7f48ac3a3b22fee?rik=AePiDOZtCVTVyg&pid=ImgRaw&r=0",
                      "Mago",
                      5)),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        backgroundColor: Colors.red[100],
        child: const Icon(
          Icons.remove_red_eye,
          color: Colors.black,
        ),
      ),
    );
  }
}
