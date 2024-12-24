import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/models/book_model.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_image_widget.dart';
import 'package:flutter/material.dart';

class CustomBookCard extends StatelessWidget {
  const CustomBookCard({
    super.key,
    required this.book,
  });
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: SizedBox(
            width: ScreenSize.screenWidth(context) / 5,
            height: ScreenSize.screenHeight(context) / 7,
            child: BookImageWidget(book: book),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 3,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  book.volumeInfo!.title ?? '',
                  style: Styles.textStyle20,
                ),
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      for (int i = 0;
                          i < book.volumeInfo!.authors!.length;
                          i++) ...[
                        TextSpan(
                          text: book.volumeInfo!.authors![i],
                          style: Styles.textStyle14
                              .copyWith(color: Colors.white.withOpacity(0.5)),
                        ),
                        if (i != book.volumeInfo!.authors!.length - 1)
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
              Row(
                children: [
                  const Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'Free',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    book.volumeInfo!.publishedDate!,
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
