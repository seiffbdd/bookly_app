import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_image_widget.dart';
import 'package:bookly/features/home/presentation/view/widgets/build_circle_indicator.dart';
import 'package:bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuildHorizontalList extends StatelessWidget {
  const BuildHorizontalList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksLoading) {
          return const BuildCircleIndicator();
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is FeaturedBooksSuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SizedBox(
                    width: ScreenSize.screenWidth(context) / 3,
                    child: BookImageWidget(
                      book: state.books[index],
                    )),
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
