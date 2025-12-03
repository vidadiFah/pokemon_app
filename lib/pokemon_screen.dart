import 'package:flutter/material.dart';
import 'package:pokemon_app/pokemon_item.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  final list = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (_, __) => SizedBox(height: 12),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return PokemonItem();
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
