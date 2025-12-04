import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon_item.dart';

import 'detail_pokemon_card_widget.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final bulbaUrl = 'https://gpng.net/wp-content/uploads/Cute-Bulbasaur-png.png';
  final charmaUrl = 'https://www.nicepng.com/png/detail/278-2789894_pokemon-charmander-vector.png';

  List<PokemonModel> list = [];

  void initState() {
    super.initState();
    list = [
      PokemonModel(
        name: 'Bulbasaur',
        image: bulbaUrl,
        color: Colors.green,
        number: '#001',
        type: ['Grass'],
        weight: '6,9 kg',
        height: '0,7 m',
        moves: 'Chlorophyll\nOvergrow',
        description: 'There is a plant seed on its back right from the day this Pokémon is born. The seed slowly grows larger.',
        stats: {
          'HP': 45,
          'ATK': 49,
          'DEF': 49,
          'SATK': 65,
          'SDEF': 65,
          'SPD': 45,
        },
      ),
      PokemonModel(
        name: 'Charmander',
        image: charmaUrl,
        color: Colors.orange,
        number: '#004',
        type: ['Fire'],
        weight: '8,5 kg',
        height: '0,6 m',
        moves: 'Mega-Punch\nFire-Punch',
        description: 'It has a preference for hot things. When it rains, steam is said to spout from the tip of its tail.',
        stats: {
          'HP': 39,
          'ATK': 52,
          'DEF': 43,
          'SATK': 60,
          'SDEF': 50,
          'SPD': 65,
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: list.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                  ),
                  itemBuilder: (_, index) {
                    final item = list[index];
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPokemonCardWidget(
                            model: item,
                          )));
                        },
                        child: PokemonItem(model: item));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ); 
  }
}

class PokemonModel {
  final String name;
  final String image;
  final Color color;
  final String number;
  final List<String>? type;
  final String? weight;
  final String? height;
  final String? moves;
  final String? description;
  final Map<String, int>? stats;

  PokemonModel({
    required this.name,
    required this.image,
    required this.color,
    required this.number,
    this.type,
    this.weight,
    this.height,
    this.description,
    this.stats,
    this.moves,
  });
}
