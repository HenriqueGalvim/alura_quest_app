import 'package:alura_quest_app/components/personagem_card.dart';
import 'package:alura_quest_app/data/personagemDAO.dart';
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
        actions: [
          IconButton(onPressed: () => setState(() =>{
            
          }), icon: Icon(Icons.refresh))
        ],
      ),
      body: AnimatedOpacity(
        opacity: opacidade ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 600),
        child: Container(
          color: Colors.white60,
          child: Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 75),
            child: FutureBuilder<List<PersonagemCard>>(
                future: PersonagemDao().findAll(),
                builder: (context, snapshot) {
                  List<PersonagemCard>? itens = snapshot.data;
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
                      break;
                    case ConnectionState.waiting:
                      return Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text("Carregando")
                          ],
                        ),
                      );
                      break;
                    case ConnectionState.active:
                      return Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(),
                            Text("Carregando")
                          ],
                        ),
                      );
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasData && itens != null) {
                        if (itens.isNotEmpty) {
                          return ListView.builder(
                            itemCount: itens.length,
                            itemBuilder: (BuildContext context, int index) {
                              final PersonagemCard personagem = itens[index];
                              return personagem;
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
                      break;
                  }
                  return Text('Erro desconhecido');
                }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (contextNew) => FormScreen(context)),
          ).then((value) => setState(() {
            
          }));
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
