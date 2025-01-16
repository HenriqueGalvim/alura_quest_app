import 'package:alura_quest_app/components/personagem_card.dart';
import 'package:alura_quest_app/models/personagem.dart';
import 'package:flutter/material.dart';

class PersonagemInheridt extends InheritedWidget {
  PersonagemInheridt({super.key, required this.child}) : super(child: child);

  @override
  final Widget child;

  final List<Personagem> listaDePersonagens = [
    Personagem(
      id:1,
        nome:"Aragorn",
        url:"https://th.bing.com/th/id/R.0d96ce0237f2b3c05225f75a2d50dff5?rik=PQpdhbN03x1wuA&pid=ImgRaw&r=0",
        raca:"Humano",
        forca:3,
        vida:100),
    Personagem(
        id:1,
        nome:"Aragorn",
        url:"https://th.bing.com/th/id/R.0d96ce0237f2b3c05225f75a2d50dff5?rik=PQpdhbN03x1wuA&pid=ImgRaw&r=0",
        raca:"Humano",
        forca:3,
        vida:100),
    Personagem(
        id:1,
        nome:"Aragorn",
        url:"https://th.bing.com/th/id/R.0d96ce0237f2b3c05225f75a2d50dff5?rik=PQpdhbN03x1wuA&pid=ImgRaw&r=0",
        raca:"Humano",
        forca:3,
        vida:100),
    Personagem(
        id:1,
        nome:"Aragorn",
        url:"https://th.bing.com/th/id/R.0d96ce0237f2b3c05225f75a2d50dff5?rik=PQpdhbN03x1wuA&pid=ImgRaw&r=0",
        raca:"Humano",
        forca:3,
        vida:100),
  ];

  void novoPersonagem(String nome, String url, String raca, int forca){
      listaDePersonagens.add(Personagem(id:1,nome:nome, url:url, raca:raca, forca:forca,vida:100));
  }

  static PersonagemInheridt? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<PersonagemInheridt>();
  }

  @override
  bool updateShouldNotify(PersonagemInheridt oldWidget) {
    return oldWidget.listaDePersonagens.length != listaDePersonagens.length;
  }
}
