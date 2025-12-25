import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon/pokemon_screen.dart';

class PokemonItem extends StatelessWidget {
  final PokemonModel model;
  const PokemonItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 204,
      width: 212,
      decoration: BoxDecoration(
        border: Border.all(color: model.color, width: 2),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('#003'),
          Expanded(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(4),
                child: Image.network(
                  model.image,
                ),
              ),
            ),
          ),
          Container(width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: model.color,
            ),
            child: Text(
              model.name,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
