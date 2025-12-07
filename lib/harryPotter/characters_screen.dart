import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_app/harryPotter/models/character_model.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final dio = Dio();
  List<CharacterModel> characters = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final response = await dio.get(
        'https://potterapi-fedeperin.vercel.app/en/characters',
      );
      final data = response.data as List;
      setState(() {
        characters = data
            .map((e) => CharacterModel.fromJson(e as Map<String, dynamic>))
            .toList();
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Characters'),
        backgroundColor: Colors.purple[800],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: characters.length,
        itemBuilder: (context, index) {
          final character = characters[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: character.image.isNotEmpty
                  ? NetworkImage(character.image)
                  : null,
              child: character.image.isEmpty
                  ? const Icon(Icons.person)
                  : null,
            ),
            title: Text(character.fullName),
            subtitle: Text('Born: ${character.birthdate}'),
          );
        },
      ),
    );
  }
}