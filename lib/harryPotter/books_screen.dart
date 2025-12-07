import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/book_model.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({super.key});

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final dio = Dio();
  List<BookModel> books = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final response = await dio.get(
        'https://potterapi-fedeperin.vercel.app/en/books',
      );
      final data = response.data as List;
      setState(() {
        books = data
            .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
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
        title: const Text('Books'),
        backgroundColor: Colors.green[800],
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ListTile(
              leading: book.cover.isNotEmpty
                  ? Image.network(book.cover, width: 50, height: 70)
                  : const Icon(Icons.book, size: 40),
              title: Text(book.originalTitle),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${book.pages} pages'),
                  Text(
                    book.description.length > 60
                        ? '${book.description.substring(0, 60)}...'
                        : book.description,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
