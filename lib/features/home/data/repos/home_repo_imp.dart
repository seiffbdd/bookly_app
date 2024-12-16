import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dartz/dartz_unsafe.dart';

class HomeRepoImp implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImp({required this.apiServices});
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      Map<String, dynamic> data = await apiServices.get(
          endPoint: 'volumes?q=programming&filter=free-ebooks&orderBy=newest');

      List<BookModel> books = [];

      for (var book in data['items']) {
        books.add(BookModel.fromJson(book));
      }
      return right(books);
    } catch (e) {
      return left(ServerFailer());
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
