import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_image_widget.dart';
import 'package:bookly/features/home/presentation/view/widgets/similar_books_list_view.dart';
import 'package:bookly/features/home/presentation/view/widgets/two_material_buttons_row.dart';
import 'package:bookly/features/home/presentation/view_model/similar_books_cubit/similar_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({super.key, required this.book});
  final BookModel book;
  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(category: widget.book.volumeInfo!.categories![0]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BookDetailsAppBar(),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: ScreenSize.screenHeight(context) / 3.3,
                width: ScreenSize.screenWidth(context) / 2.3,
                child: BookImageWidget(
                  book: widget.book,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                widget.book.volumeInfo!.title ?? '',
                style: Styles.textStyle30,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: ScreenSize.screenHeight(context) / 20,
                child: Text.rich(
                  TextSpan(
                    children: [
                      for (int i = 0;
                          i < widget.book.volumeInfo!.authors!.length;
                          i++) ...[
                        TextSpan(
                          text: widget.book.volumeInfo!.authors![i],
                          style: Styles.textStyle14
                              .copyWith(color: Colors.white.withOpacity(0.5)),
                        ),
                        if (i != widget.book.volumeInfo!.authors!.length - 1)
                          const TextSpan(
                            text: ' - ',
                            style: TextStyle(color: Colors.white54),
                          ),
                      ],
                    ],
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                widget.book.volumeInfo!.publishedDate ?? '',
                style: const TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              const TwoMaterialButtonsRow(),
              const SizedBox(
                height: 40,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'You can also like',
                  style: Styles.textStyle14,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: ScreenSize.screenHeight(context) / 7.25,
                child: const SimilarBooksListView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
