import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/spell_model.dart';

class SpellsScreen extends StatefulWidget {
  const SpellsScreen({super.key});

  @override
  State<SpellsScreen> createState() => _SpellsScreenState();
}

class _SpellsScreenState extends State<SpellsScreen> {
  final dio = Dio();
  List<SpellModel> spells = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final response = await dio.get(
        'https://potterapi-fedeperin.vercel.app/en/spells',
      );
      final data = response.data as List;
      setState(() {
        spells = data
            .map((e) => SpellModel.fromJson(e as Map<String, dynamic>))
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
        title: const Text('Spells'),
        backgroundColor: Colors.blue[800],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: spells.length,
        itemBuilder: (context, index) {
          final spell = spells[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: const Icon(Icons.auto_awesome, color: Colors.blue),
              title: Text(spell.spell),
              subtitle: Text(spell.use),
            ),
          );
        },
      ),
    );
  }
}