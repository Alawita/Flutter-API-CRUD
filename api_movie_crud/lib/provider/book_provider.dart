import 'package:api_movie_crud/models/book_model.dart';
import 'package:api_movie_crud/services/book_service.dart';
import 'package:flutter/cupertino.dart';

class BookProvider extends ChangeNotifier {
  List<Book> booksList = [];

  final BookService _bookService = BookService();

  Future<void> getBookList() async {
    booksList = await _bookService.getBookListApi();

    notifyListeners();
  }

  Future<void> deleteBook(String bookId) async {
    booksList = await _bookService.deleteBookApi(bookId);
    getBookList();
    notifyListeners();
  }

  Future<void> addBook(String title, String price, description) async {
    booksList = await _bookService.addBookApi(title, price, description);
    getBookList();
    notifyListeners();
  }

  Future<void> editBook(String title, String price, description, int id) async {
    booksList = await _bookService.editBookApi(title, price, description, id);
    getBookList();
    notifyListeners();
  }
}
