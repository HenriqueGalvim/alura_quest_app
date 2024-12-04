import 'package:alura_quest_app/components/personagem_card.dart';
import 'package:alura_quest_app/data/personagemDAO.dart';
import 'package:alura_quest_app/data/personagem_inheridt.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen(this.personagemContext, {super.key});
  final BuildContext personagemContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController racaController = TextEditingController();
  TextEditingController forcaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red.shade400,
            title: const Text("Novo Personagem",
                style: TextStyle(color: Colors.white)),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Container(
                  width: 475,
                  height: 550,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1),
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'O campo nome não pode ser vazio';
                            }

                            return null;
                          },
                          controller: nameController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Nome do Personagem',
                              fillColor: Colors.white70,
                              filled: true),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'O campo raça não pode ser vazio';
                            }

                            return null;
                          },
                          controller: racaController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Raça do personagem',
                              fillColor: Colors.white70,
                              filled: true),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value!.isEmpty ||
                                int.parse(value) > 5 ||
                                int.parse(value) < 1) {
                              return 'O campo força do personagem não pode ser vazio e precisa estar dentro do intervalo de 1 a 5';
                            }

                            return null;
                          },
                          keyboardType: TextInputType.number,
                          controller: forcaController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Força do personagem de 1 a 5',
                              fillColor: Colors.white70,
                              filled: true),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: TextFormField(
                          validator: (String? value) {
                            if (value != null && value.isEmpty) {
                              return 'O campo url da imagem não pode ser vazio';
                            }

                            return null;
                          },
                          keyboardType: TextInputType.url,
                          onChanged: (text) => setState(() {}),
                          controller: urlController,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Url da imagem',
                              fillColor: Colors.white70,
                              filled: true),
                        ),
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              borderRadius: BorderRadius.circular(4)),
                          width: 100,
                          height: 100,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                urlController.text,
                                fit: BoxFit.cover,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                                  return Container();
                                },
                              ))),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 150,
                          height: 30,
                          child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  PersonagemDao().save(PersonagemCard(
                                      nameController.text,
                                      urlController.text,
                                      racaController.text,
                                      int.parse(forcaController.text),
                                      100));

                                  PersonagemInheridt.of(
                                          widget.personagemContext)!
                                      .novoPersonagem(
                                          nameController.text,
                                          urlController.text,
                                          racaController.text,
                                          int.parse(forcaController.text));
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Personagem Adicionado com Sucesso",
                                              style: TextStyle(
                                                  color: Colors.green))));

                                  Navigator.pop(context);
                                }
                              },
                              child: const Text("Adicionar")),
                        ),
                      )
                    ],
                  )),
            ),
          )),
    );
  }
}
