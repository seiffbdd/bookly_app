import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this._homeRepoImp) : super(NewestBooksInitial());
  final HomeRepo _homeRepoImp;
  Future<void> fetchNewestBooks() async {
    emit(NewestBooksloading());

    Either<Failure, List<BookModel>> books =
        await _homeRepoImp.fetchNewestBooks();
    books.fold(
      (failure) {
        emit(NewestBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(NewestBooksSuccess(books: books));
      },
    );
  }

  Future<void> refreshNewestBooks() async {
    await fetchNewestBooks();
  }
}
