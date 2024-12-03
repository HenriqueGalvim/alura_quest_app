import 'package:alura_quest_app/components/forca.dart';
import 'package:alura_quest_app/data/personagemDAO.dart';
import 'package:flutter/material.dart';

class PersonagemCard extends StatefulWidget {
  final String nome;
  final String url;
  final String raca;
  final int forca;
  int vida;

  PersonagemCard(this.nome, this.url, this.raca, this.forca, {super.key, this.vida = 100});
  @override
  // ignore: library_private_types_in_public_api
  _PersonagemCardState createState() => _PersonagemCardState();
}

class _PersonagemCardState extends State<PersonagemCard> {


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
                          child: SizedBox(
                              width: 300,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.nome,
                                    style: const TextStyle(
                                        fontSize: 24, color: Colors.black),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (widget.vida >= 100) {
                                            widget.vida = 100;
                                          } else {
                                            widget.vida++;
                                          }
                                        });
                                      },
                                      child: const Icon(Icons.arrow_drop_up)),
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
                                    widget.raca,
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Colors.red.shade900),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        setState(() {
                                          if (widget.vida <= 0) {
                                            widget.vida = 0;
                                          } else {
                                            widget.vida--;
                                          }
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
                            width: 250,
                            child: LinearProgressIndicator(
                              value: widget.vida / 100,
                              color: widget.vida > 80
                                  ? const Color.fromARGB(255, 14, 219, 58)
                                  : widget.vida> 50
                                      ? Colors.yellow.shade500
                                      : widget.vida > 20
                                          ? const Color.fromARGB(255, 194, 46, 20)
                                          : Colors.black,
                              backgroundColor: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            'Vida: ${widget.vida}',
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),

                        SizedBox(
                          width: 50,
                          height: 50,
                          child: FloatingActionButton(onPressed: () =>{
                           PersonagemDao().delete(widget.nome)
                          }, child: Icon(Icons.remove,color: Colors.red,),),
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
