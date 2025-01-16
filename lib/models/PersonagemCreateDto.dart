import 'dart:developer';

class PersonagemCreateDto {
  String nome;
  String url;
  String raca;
  int forca;
  int vida;

  PersonagemCreateDto({
    required this.nome,
    required this.url,
    required this.raca,
    required this.forca,
    required this.vida,
  });


  static PersonagemCreateDto fromMap(dynamic map) {
    return PersonagemCreateDto(
      nome: map['nome'],
      url: map['url'],
      raca: map['raca'],
      forca: map['forca'],
      vida: map['vida'],
    );
  }

  Map<String, dynamic> toMap() {
    return{
      "nome": this.nome,
      "url": this.url,
      "raca": this.raca,
      "forca": this.forca,
      "vida": this.vida,
    };
  }


}
