import 'package:api_movie_crud/pages/add_book.dart';
import 'package:api_movie_crud/pages/edit_book.dart';
import 'package:api_movie_crud/pages/home_page.dart';
import 'package:api_movie_crud/provider/book_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => BookProvider(), child: const MyApp()));
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
    ),
    GoRoute(
      path: '/add',
      builder: (BuildContext context, GoRouterState state) {
        return AddBookPage();
      },
    ),
    GoRoute(
      path: '/edit',
      builder: (BuildContext context, GoRouterState state) {
        return EditBookPage(id: 1);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
