import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  bool opacidade = true;

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AluraQuest',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
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
              children: [
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
      ),
    );
  }
}

class PersonagemCard extends StatefulWidget {
  final String nome;
  final String url;
  final String raca;
  final int forca;

  PersonagemCard(this.nome, this.url, this.raca, this.forca, {Key? key})
      : super(key: key);

  @override
  _PersonagemCardState createState() => _PersonagemCardState();
}

class _PersonagemCardState extends State<PersonagemCard> {
  int vida = 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.8),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.red.shade100,
                borderRadius: BorderRadius.circular(4)),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(4)),
                        width: 100,
                        height: 120,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              widget.url,
                              fit: BoxFit.cover,
                            ))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, left: 10),
                          child: Container(
                              width: 350,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.nome,
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (vida >= 100) {
                                            vida = 100;
                                          } else {
                                            vida++;
                                          }
                                        });
                                      },
                                      child: Icon(Icons.arrow_drop_up)),
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 10),
                          child: Container(
                            width: 350,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.raca,
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.red.shade900),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (vida <= 0) {
                                            vida = 0;
                                          } else {
                                            vida--;
                                          }
                                        });
                                      },
                                      child: Icon(Icons.arrow_drop_down))
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 10),
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: widget.forca >= 1
                                      ? Colors.red.shade900
                                      : Colors.red[300],
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: widget.forca >= 2
                                      ? Colors.red.shade900
                                      : Colors.red[300],
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: widget.forca >= 3
                                      ? Colors.red.shade900
                                      : Colors.red[300],
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: widget.forca >= 4
                                      ? Colors.red.shade900
                                      : Colors.red[300],
                                  size: 15,
                                ),
                                Icon(
                                  Icons.star,
                                  color: widget.forca >= 5
                                      ? Colors.red.shade900
                                      : Colors.red[300],
                                  size: 15,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red.shade200,
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            child: LinearProgressIndicator(
                              value: vida / 100,
                              color: Colors.yellow.shade500,
                              backgroundColor: Colors.white,
                            ),
                            width: 300,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            'Vida: $vida',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
