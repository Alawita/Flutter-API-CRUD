import 'package:api_movie_crud/models/movie_model.dart';
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
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 16.0),
                                  child: Image.network(
                                    'https://m.media-amazon.com/images/W/MEDIAX_792452-T2/images/I/61aG6EicTIL.jpg',
                                    width: 100.0,
                                    height: 120.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        value.booksList[index].title.toString(),
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        value.booksList[index].description
                                            .toString(),
                                        style: TextStyle(fontSize: 14.0),
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                          "${value.booksList[index].price} KD"),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.delete),
                                      onPressed: () {
                                        context.read<BookProvider>().deleteBook(
                                            value.booksList[index].id
                                                .toString());
                                      },
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        GoRouter.of(context).push("/edit",
                                            extra: value.booksList[index].id);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );

                        /*ListTile(
                          title: Text(value.booksList[index].title.toString()),
                          trailing: IconButton(
                              onPressed: () {
                                context.read<BookProvider>().deleteBook(
                                    value.booksList[index].id.toString());
                              },
                              icon: Icon(Icons.delete)),
                        );*/
                      }));
            }));
  }
}
