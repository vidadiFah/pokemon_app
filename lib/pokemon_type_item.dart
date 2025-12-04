import 'package:flutter/material.dart';

class PokemonTypeItem extends StatelessWidget {
  final String type;
  final Color color;

  const PokemonTypeItem({
    super.key,
    required this.type,
    required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        type,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}