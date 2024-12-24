import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/core/widgets/build_circle_indicator.dart';
import 'package:bookly/core/widgets/custom_book_card.dart';
import 'package:bookly/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksloading) {
          return const BuildCircleIndicator();
        } else if (state is NewestBooksFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            padding: const EdgeInsets.only(top: 5.0),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: SizedBox(
                  height: ScreenSize.screenHeight(context) / 7,
                  child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView,
                          extra: state.books[index]);
                    },
                    child: CustomBookCard(
                      book: state.books[index],
                    ),
                  ),
                ),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
