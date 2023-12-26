import 'package:api_movie_crud/provider/book_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Book app"),
          actions: [
            IconButton(
                onPressed: () {
                  GoRouter.of(context).push("/add");
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: FutureBuilder(
            future: context.read<BookProvider>().getBookList(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: LinearProgressIndicator(),
                );
              }
              return Consumer<BookProvider>(
                  builder: (context, value, child) => ListView.builder(
                      itemCount: value.booksList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(value.booksList[index].title.toString()),
                          trailing: IconButton(
                              onPressed: () {
                                context.read<BookProvider>().deleteBook(
                                    value.booksList[index].id.toString());
                              },
                              icon: Icon(Icons.delete)),
                        );
                      }));
            }));
  }
}
