import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this._homeRepoImp) : super(FeaturedBooksInitial());

  final HomeRepoImp _homeRepoImp;
  List<BookModel> books = [];
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    Either<Failure, List<BookModel>> data =
        await _homeRepoImp.fetchFeaturedBooks();

    data.fold(
      (failure) {
        emit(FeaturedBooksFailure(errMessage: failure.errMessage));
      },
      (data) {
        books = data;
        emit(FeaturedBooksSuccess());
      },
    );
  }
}
