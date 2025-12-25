import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon/pokemon_item.dart';

import 'detail_pokemon_card_widget.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final bulbaUrl = 'https://gpng.net/wp-content/uploads/Cute-Bulbasaur-png.png';
  final charmaUrl = 'https://www.nicepng.com/png/detail/278-2789894_pokemon-charmander-vector.png';
  final butterUrl = 'https://www.vhv.rs/dpng/d/500-5002239_pokemon-butterfree-png-transparent-png.png';
  final squirtleUrl = 'https://www.clipartmax.com/png/middle/126-1268117_squirtle-is-a-small-light-blue-pokémon-with-an-appearance-squirtle-png.png';
  final pikachuUrl = 'https://www.kindpng.com/picc/m/782-7827143_pokemon-pikachu-png-picture-transparent-png.png';
  final gastlyUrl = 'https://www.kindpng.com/picc/m/482-4824163_monster-wiki-pokemon-ghastly-hd-png-download.png';
  final dittoUrl = 'https://www.kindpng.com/picc/m/715-7154907_ditto-pokemon-hd-png-download.png';

  List<PokemonModel> list = [];

  void initState() {
    super.initState();
    list = [
      PokemonModel(
        name: 'Bulbasaur',
        image: bulbaUrl,
        color: Colors.green,
        number: '#001',
        type: ['Bug', 'Flying'],
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
      PokemonModel(
        name: 'Butterfree',
        image: butterUrl,
        color: Colors.lightGreen,
        number: '#004',
        type: ['Fire'],
        weight: '8,5 kg',
        height: '0,6 m',
        moves: 'Compound-Eyes\nTinted-Lens',
        description: 'In battle, it flaps its wings at great speed to release highly toxic dust into the air.',
        stats: {
          'HP': 39,
          'ATK': 52,
          'DEF': 43,
          'SATK': 60,
          'SDEF': 50,
          'SPD': 65,
        },
      ),
      PokemonModel(
        name: 'Squirtle',
        image: squirtleUrl,
        color: Colors.blue,
        number: '#004',
        type: ['Fire'],
        weight: '8,5 kg',
        height: '0,6 m',
        moves: 'Torrent\nRain-Dish',
        description: 'When it retracts its long neck into its shell, it squirts out water with vigorous force.',
        stats: {
          'HP': 39,
          'ATK': 52,
          'DEF': 43,
          'SATK': 60,
          'SDEF': 50,
          'SPD': 65,
        },
      ),
      PokemonModel(
        name: 'Pikachu',
        image: pikachuUrl,
        color: Colors.amber,
        number: '#004',
        type: ['Fire'],
        weight: '8,5 kg',
        height: '0,6 m',
        moves: 'Mega-Punch\nPay-Day',
        description: 'Pikachu that can generate powerful electricity have cheek sacs that are extra soft and super stretchy.',
        stats: {
          'HP': 39,
          'ATK': 52,
          'DEF': 43,
          'SATK': 60,
          'SDEF': 50,
          'SPD': 65,
        },
      ),
      PokemonModel(
        name: 'Gastly',
        image: gastlyUrl,
        color: Colors.deepPurple,
        number: '#004',
        type: ['Ghost', 'Type'],
        weight: '8,5 kg',
        height: '0,6 m',
        moves: 'Levitate',
        description: 'Born from gases, anyone would faint if engulfed by its gaseous body, which contains poison.',
        stats: {
          'HP': 39,
          'ATK': 52,
          'DEF': 43,
          'SATK': 60,
          'SDEF': 50,
          'SPD': 65,
        },
      ),
      PokemonModel(
        name: 'Ditto',
        image: dittoUrl,
        color: Colors.lime,
        number: '#004',
        type: ['Normal'],
        weight: '8,5 kg',
        height: '0,6 m',
        moves: 'Limber\nImposter',
        description: 'It can reconstitute its entire cellular structure to change into what it sees, but it returns to normal when it relaxes.',
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
