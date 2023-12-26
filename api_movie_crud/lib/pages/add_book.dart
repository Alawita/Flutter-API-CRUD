import 'package:api_movie_crud/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatefulWidget {
  AddBookPage({super.key});

  @override
  State<AddBookPage> createState() => _AddBookPageState();
}

class _AddBookPageState extends State<AddBookPage> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _discController = TextEditingController();

  bool isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: _titleController,
              decoration: new InputDecoration.collapsed(hintText: 'book title'),
            ),
            TextField(
              controller: _priceController,
              decoration: new InputDecoration.collapsed(hintText: 'price'),
            ),
            TextField(
              controller: _discController,
              decoration:
                  new InputDecoration.collapsed(hintText: 'description'),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<BookProvider>().addBook(_titleController.text,
                      _priceController.text, _discController.text);
                  GoRouter.of(context).pop();
                },
                child: Text("add a book"))
          ],
        ),
      ),
    );
  }
}
