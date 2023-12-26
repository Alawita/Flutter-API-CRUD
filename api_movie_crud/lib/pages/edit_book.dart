import 'package:api_movie_crud/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditBookPage extends StatelessWidget {
  EditBookPage({super.key, required this.id});
  final int id;
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
                  context.read<BookProvider>().editBook(_titleController.text,
                      _priceController.text, _discController.text, id);
                  GoRouter.of(context).pop();
                },
                child: Text("edit a book"))
          ],
        ),
      ),
    );
  }
}
