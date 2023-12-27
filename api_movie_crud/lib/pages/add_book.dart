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
            buildTextFormFieldWithLabel(
              controller: _titleController,
              labelText: 'Book Title',
            ),
            buildTextFormFieldWithLabel(
              controller: _priceController,
              labelText: 'Price',
              keyboardType: TextInputType.number,
            ),
            buildTextFormFieldWithLabel(
              controller: _discController,
              labelText: 'Description',
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  context.read<BookProvider>().addBook(
                        _titleController.text,
                        _priceController.text,
                        _discController.text,
                      );
                });

                GoRouter.of(context).pop();
              },
              child: Text("Add a Book"),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextFormFieldWithLabel({
    required TextEditingController controller,
    required String labelText,
    TextInputType? keyboardType,
  }) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                labelText: '',
                border: InputBorder.none,
              ),
              keyboardType: keyboardType,
            ),
          ),
          Positioned(
            left: 10.0,
            top: 8.0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                labelText,
                style: TextStyle(
                  backgroundColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
