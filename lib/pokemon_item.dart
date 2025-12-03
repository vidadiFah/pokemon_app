import 'package:flutter/material.dart';

class PokemonItem extends StatelessWidget {
  const PokemonItem({super.key});

  @override
  Widget build(BuildContext context) {
    final url = 'https://gpng.net/wp-content/uploads/Cute-Bulbasaur-png.png';

    return Container(
      height: 204,
      width: 212,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 8),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('#003'),
          Expanded(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Image.network(
                  url,
                  height: 100,
                ),
              ),
            ),
          ),
          Container(width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.green,
            ),
            child: Text(
              'Bulba',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
