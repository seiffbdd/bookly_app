import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImp implements SearchRepo {
  final ApiServices apiServices;

  SearchRepoImp({required this.apiServices});

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchedBooks(
      {required String query}) async {
    try {
      Map<String, dynamic> data =
          await apiServices.get(endPoint: 'volumes?q=$query');

      List<BookModel> books = [];

      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailer(
            errMessage: ServerFailer.fromDioException(e).toString()));
      }
      return left(ServerFailer(errMessage: e.toString()));
    }
  }
}
