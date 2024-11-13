import 'package:alura_quest_app/personagem_card.dart';
import 'package:flutter/material.dart';

class Forca extends StatelessWidget {
  const Forca({
    super.key,
    required this.widget,
  });

  final PersonagemCard widget;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

