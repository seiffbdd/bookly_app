import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this._homeRepoImp) : super(SimilarBooksInitial());
  final HomeRepoImp _homeRepoImp;

  Future<void> fetchSimilarBooks() async {
    emit(SimilarBooksLoading());
    Either<Failure, List<BookModel>> data =
        await _homeRepoImp.fetchFeaturedBooks();

    data.fold(
      (failure) {
        emit(SimilarBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(SimilarBooksSuccess(books: books));
      },
    );
  }
}
