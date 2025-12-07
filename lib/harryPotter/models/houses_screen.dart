import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'house_model.dart';

class HousesScreen extends StatefulWidget {
  const HousesScreen({super.key});

  @override
  State<HousesScreen> createState() => _HousesScreenState();
}

class _HousesScreenState extends State<HousesScreen> {
  final dio = Dio();
  List<HouseModel> houses = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final response = await dio.get(
        'https://potterapi-fedeperin.vercel.app/en/houses',
      );
      final data = response.data as List;
      setState(() {
        houses = data
            .map((e) => HouseModel.fromJson(e as Map<String, dynamic>))
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
        title: const Text('Houses'),
        backgroundColor: Colors.red[800],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: houses.length,
        itemBuilder: (context, index) {
          final house = houses[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            color: _getHouseColor(house.house),
            child: ListTile(
              title: Text(
                house.house,
                style: const TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Founder: ${house.founder}\nAnimal: ${house.animal}',
                style: const TextStyle(color: Colors.white70),
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getHouseColor(String houseName) {
    switch (houseName.toLowerCase()) {
      case 'gryffindor':
        return Colors.red;
      case 'slytherin':
        return Colors.green;
      case 'hufflepuff':
        return Colors.yellow;
      case 'ravenclaw':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}