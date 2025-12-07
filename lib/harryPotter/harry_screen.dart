import 'package:flutter/material.dart';
import 'package:pokemon_app/harryPotter/characters_screen.dart';
import 'package:pokemon_app/harryPotter/models/houses_screen.dart';
import 'package:pokemon_app/harryPotter/spells_screen.dart';
import 'books_screen.dart';
import 'category_item.dart';

class HarryPotterMainScreen extends StatelessWidget {
  const HarryPotterMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Potter', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Categories',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                children: [
                  CategoryItem(
                    title: 'Characters',
                    icon: Icons.people,
                    color: Colors.purple,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CharactersScreen(),
                      ),
                    ),
                  ),
                  CategoryItem(
                    title: 'Spells',
                    icon: Icons.auto_awesome,
                    color: Colors.blue,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SpellsScreen(),
                      ),
                    ),
                  ),
                  CategoryItem(
                    title: 'Houses',
                    icon: Icons.house,
                    color: Colors.red,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HousesScreen(),
                      ),
                    ),
                  ),
                  CategoryItem(
                    title: 'Books',
                    icon: Icons.book,
                    color: Colors.green,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BooksScreen(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}