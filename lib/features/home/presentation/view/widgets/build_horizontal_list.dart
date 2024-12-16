import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/features/home/presentation/view/widgets/book_image_widget.dart';
import 'package:flutter/material.dart';

class BuildHorizontalList extends StatelessWidget {
  const BuildHorizontalList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: SizedBox(
              width: ScreenSize.screenWidth(context) / 3,
              child: const BookImageWidget()),
        );
      },
    );
  }
}
