import 'package:alura_quest_app/components/personagem_card.dart';
import 'package:alura_quest_app/data/personagemDAO.dart';
import 'package:alura_quest_app/models/personagem.dart';
import 'package:alura_quest_app/screens/detail_screen.dart';
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
        actions: [
          IconButton(
              onPressed: () => setState(() => {}), icon: Icon(Icons.refresh))
        ],
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 600),
        child: Container(
          color: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 75),
            child: FutureBuilder<List<Personagem>>(
                future: PersonagemDao().findAll(),
                builder: (context, snapshot) {
                  List<Personagem>? itens = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text("Carregando")
                          ],
                        ),
                      );
                    case ConnectionState.waiting:
                      return Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text("Carregando")
                          ],
                        ),
                      );
                    case ConnectionState.active:
                      return Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text("Carregando")
                          ],
                        ),
                      );
                    case ConnectionState.done:
                      if (snapshot.hasData && itens != null) {
                        if (itens.isNotEmpty) {
                          return ListView.builder(
                            itemCount: itens.length,
                            itemBuilder: (BuildContext context, int index) {
                              final Personagem personagem = itens[index];
                              return PersonagemCard(personagem);
                            },
                          );
                        }
                        return Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 128,
                              ),
                              Text(
                                "Nenhum Personagem Cadastrado",
                                style: TextStyle(fontSize: 32),
                              )
                            ],
                          ),
                        );
                      }
                      return Text('Erro ao carregar Personagens');
                  }
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (contextNew) => FormScreen(context)),
          ).then((value) => setState(() {}));
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

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
