import 'package:bookly/core/errors/failure.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    Either<Failure, List<BookModel>> books =
        await homeRepo.fetchFeaturedBooks();

    books.fold(
      (failure) {
        emit(FeaturedBooksFailure(errMessage: failure.errMessage));
      },
      (books) {
        emit(FeaturedBooksSuccess(books: books));
      },
    );
  }
}
