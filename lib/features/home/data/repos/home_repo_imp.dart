import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImp implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImp({required this.apiServices});
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      Map<String, dynamic> data = await apiServices.get(
          endPoint: 'volumes?q=programming&orderBy=newest');

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

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      Map<String, dynamic> data =
          await apiServices.get(endPoint: 'volumes?q=programming');

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
