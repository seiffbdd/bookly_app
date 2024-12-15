import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/view/widgets/custom_search_text_field.dart';
import 'package:bookly/features/search/presentation/view/widgets/search_result_list.dart';
import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(
            children: [
              CustomSearchTextField(),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Search Result',
                  style: Styles.textStyle16,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(child: SearchResultList())
            ],
          ),
        ),
      ),
    );
  }
}
