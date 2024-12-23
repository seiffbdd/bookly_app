import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_book_card.dart';
import 'package:flutter/material.dart';

class SearchResultList extends StatelessWidget {
  const SearchResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      padding: const EdgeInsets.only(top: 5.0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: SizedBox(
            height: ScreenSize.screenHeight(context) / 7,
            // child: const CustomBookCard(),
          ),
        );
      },
    );
  }
}
