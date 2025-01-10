import 'package:alura_quest_app/components/confirmation_dialog.dart';
import 'package:alura_quest_app/components/forca.dart';
import 'package:alura_quest_app/data/personagemDAO.dart';
import 'package:alura_quest_app/models/personagem.dart';
import 'package:alura_quest_app/screens/form_screen.dart';
import 'package:alura_quest_app/service/personagem_service.dart';
import 'package:flutter/material.dart';

class PersonagemCard extends StatefulWidget {
  final Personagem personagem;

  PersonagemCard(this.personagem, {super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PersonagemCardState createState() => _PersonagemCardState();
}

class _PersonagemCardState extends State<PersonagemCard> {
  PersonagemService personagemService = new PersonagemService();
  void refreshFunction() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
    onTap: () { Navigator.push(
        context,
        MaterialPageRoute(builder: (contextNew) => FormScreen(context, personagem: widget.personagem,)),
    ).then((value) => setState(() {}));
    },
    child:Padding(
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
                              widget.personagem.url,
                              fit: BoxFit.cover,
                            ))),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5, left: 10),
                          child: SizedBox(
                              width: 300,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.personagem.nome,
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (widget.personagem.vida >= 100) {
                                            widget.personagem.vida = 100;
                                          } else {
                                            widget.personagem.vida++;
                                          }
                                          personagemService.save(Personagem(
                                            id:widget.personagem.id,
                                              nome:widget.personagem.nome,
                                              url:widget.personagem.url,
                                              raca:widget.personagem.raca,
                                              forca:widget.personagem.forca,
                                              vida:widget.personagem.vida));
                                        });
                                      },
                                      child: const Icon(Icons.arrow_drop_up))
                                ],
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 10),
                          child: SizedBox(
                            width: 300,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.personagem.raca,
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.red.shade900),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (widget.personagem.vida <= 0) {
                                            widget.personagem.vida = 0;
                                          } else {
                                            widget.personagem.vida--;
                                          }
                                          personagemService.save(Personagem(
                                            id:widget.personagem.id,
                                             nome: widget.personagem.nome,
                                             url: widget.personagem.url,
                                             raca: widget.personagem.raca,
                                             forca: widget.personagem.forca,
                                             vida: widget.personagem.vida));
                                        });
                                      },
                                      child: const Icon(Icons.arrow_drop_down))
                                ]),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4, left: 10),
                          child: Forca(widget: widget),
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
                          child: SizedBox(
                            width: 150,
                            child: LinearProgressIndicator(
                              value: widget.personagem.vida / 100,
                              color: widget.personagem.vida > 80
                                  ? const Color.fromARGB(255, 14, 219, 58)
                                  : widget.personagem.vida > 50
                                      ? Colors.yellow.shade500
                                      : widget.personagem.vida > 20
                                          ? const Color.fromARGB(
                                              255, 194, 46, 20)
                                          : Colors.black,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            'Vida: ${widget.personagem.vida}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          child: FloatingActionButton(
                            heroTag: 'btn1',
                            onPressed: () {
                            showConfirmationDialog(
                            context,
                            content:
                            "Deseja realmente remover o personagem  ${widget.personagem.nome}?",
                            affirmativeOption: "Remover",
                            ).then((value) {
                            if (value != null){
                              if (value){
                                personagemService.deleta(widget.personagem.id).then(((_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                  content: Text("Removido com sucesso!"),
                                  ),
                                );
                                  refreshFunction();
                                }));
                              }
                            } } );
                                }
                            ,
                            child: Icon(
                              Icons.highlight_remove_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
