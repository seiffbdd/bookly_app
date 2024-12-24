import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/search/data/repos/search_repo_imp.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'searched_books_state.dart';

class SearchedBooksCubit extends Cubit<SearchedBooksState> {
  final SearchRepoImp searchRepoImp;
  SearchedBooksCubit(this.searchRepoImp) : super(SearchedBooksInitial());

  Future<void> fetchSearchedBooks({required String query}) async {
    emit(SearchedBooksLoading());
    Either<Failure, List<BookModel>> data =
        await searchRepoImp.fetchSearchedBooks(query: query);

    data.fold(
      (failure) {
        emit(SearchedBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(SearchedBooksSuccess(books: books));
      },
    );
  }
}
