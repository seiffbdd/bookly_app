import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/core/widgets/build_circle_indicator.dart';
import 'package:bookly/core/widgets/custom_book_card.dart';
import 'package:bookly/features/search/presentation/view_model/searched_books_cubit/searched_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchedBooksCubit, SearchedBooksState>(
      builder: (context, state) {
        if (state is SearchedBooksLoading) {
          return const BuildCircleIndicator();
        } else if (state is SearchedBooksFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is SearchedBooksSuccess) {
          return ListView.builder(
            itemCount: 10,
            padding: const EdgeInsets.only(top: 5.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  height: ScreenSize.screenHeight(context) / 7,
                  child: CustomBookCard(
                    book: state.books[index],
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
