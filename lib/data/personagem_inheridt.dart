import 'package:alura_quest_app/components/personagem_card.dart';
import 'package:flutter/material.dart';

class PersonagemInheridt extends InheritedWidget {
  PersonagemInheridt({super.key, required this.child}) : super(child: child);

  @override
  final Widget child;

  final List<PersonagemCard> listaDePersonagens = [
    PersonagemCard(
        "Aragorn",
        "https://th.bing.com/th/id/R.0d96ce0237f2b3c05225f75a2d50dff5?rik=PQpdhbN03x1wuA&pid=ImgRaw&r=0",
        "Humano",
        3,100),
    PersonagemCard(
        "Legolas",
        "https://th.bing.com/th/id/R.9d6be011a84eeebdc1250f0b77a22054?rik=RZtLGT0wDTVoIw&pid=ImgRaw&r=0",
        "Elfo",
        5,100),
    PersonagemCard(
        "Gimli",
        "https://th.bing.com/th/id/R.97f42309db427c761c7581f96a47b43f?rik=PjWPVYd7z%2fpiaQ&pid=ImgRaw&r=0",
        "Anão",
        5,100),
    PersonagemCard(
        "Gandalf",
        "https://th.bing.com/th/id/R.3a77a78e93845e6ec7f48ac3a3b22fee?rik=AePiDOZtCVTVyg&pid=ImgRaw&r=0",
        "Mago",
        5,100)
  ];

  void novoPersonagem(String nome, String url, String raca, int forca){
      listaDePersonagens.add(PersonagemCard(nome, url, raca, forca,100));
  }

  static PersonagemInheridt? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PersonagemInheridt>();
  }

  @override
  bool updateShouldNotify(PersonagemInheridt oldWidget) {
    return oldWidget.listaDePersonagens.length != listaDePersonagens.length;
  }
}
