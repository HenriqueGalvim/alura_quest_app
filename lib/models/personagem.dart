class Personagem {
  String id;
  String nome;
  String url;
  String raca;
  int forca;
  int vida;

  Personagem({
    required this.id,
    required this.nome,
    required this.url,
    required this.raca,
    required this.forca,
    required this.vida,
  });


  static Personagem fromMap(Map<String,dynamic> map) {
    return Personagem(
      id: map['id'],
      nome: map['name'],
      url: map['url'],
      raca: map['raca'],
      forca: map['forca'],
      vida: map['vida'],
    );
  }

  Map<String, dynamic> toMap() {
    return{
      "id": this.id,
      "nome": this.nome,
      "url": this.url,
      "raca": this.raca,
      "forca": this.forca,
      "vida": this.vida,
    };
  }


}
