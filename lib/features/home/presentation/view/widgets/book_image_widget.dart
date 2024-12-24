import 'package:bookly/core/models/book_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookImageWidget extends StatelessWidget {
  const BookImageWidget({
    super.key,
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: CachedNetworkImage(
          imageUrl: book.volumeInfo!.imageLinks?.thumbnail! ?? '',
          errorWidget: (context, url, error) =>
              const Center(child: CircularProgressIndicator()),
          fit: BoxFit.fill,
        ));
  }
}
