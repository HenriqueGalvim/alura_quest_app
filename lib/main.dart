import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alura Quest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 183, 62, 58)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'AluraQuest'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade500,
        title: Text(
          widget.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          PersonagemCard(
              "Aragorn",
              "https://th.bing.com/th/id/R.0d96ce0237f2b3c05225f75a2d50dff5?rik=PQpdhbN03x1wuA&pid=ImgRaw&r=0",
              "Humano",
              3),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => {}),
    );
  }
}

class PersonagemCard extends StatefulWidget {
  final String nome;
  final String url;
  final String raca;
  final int forca;

  const PersonagemCard(this.nome, this.url, this.raca, this.forca, {Key? key})
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
