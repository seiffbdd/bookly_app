import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_image_widget.dart';
import 'package:bookly/features/home/presentation/view/widgets/build_circle_indicator.dart';
import 'package:bookly/features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksLoading) {
          return const BuildCircleIndicator();
        } else if (state is SimilarBooksFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is SimilarBooksSuccess) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SizedBox(
                    width: ScreenSize.screenWidth(context) / 3,
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.kBookDetailsView);
                      },
                      child: BookImageWidget(
                        book: state.books[index],
                      ),
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
