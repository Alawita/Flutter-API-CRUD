import 'package:api_movie_crud/models/movie_model.dart';
import 'package:dio/dio.dart';

class BookService {
  final String _serverUrl =
      "https://coded-books-api-crud.eapi.joincoded.com/books";
  final Dio _dio = Dio();

  Future<List<Book>> getBookListApi() async {
    List<Book> books = [];
    try {
      final response = await _dio.get(_serverUrl);
      books =
          (response.data as List).map((book) => Book.fromJson(book)).toList();
      return books;
    } catch (e) {
      throw "Error";
    }
  }

  Future<List<Book>> deleteBookApi(String id) async {
    List<Book> books = [];
    try {
      final response = await _dio.delete(_serverUrl + "/$id");
      books =
          (response.data as List).map((book) => Book.fromJson(book)).toList();
      return books;
    } catch (e) {
      throw "Error";
    }
  }

  Future<List<Book>> addBookApi(
      String title, String price, String description) async {
    List<Book> books = [];
    try {
      final response = await _dio.post(_serverUrl,
          data: {"title": title, "price": price, "description": description});
      books =
          (response.data as List).map((book) => Book.fromJson(book)).toList();
      return books;
    } catch (e) {
      throw "Error";
    }
  }
}
