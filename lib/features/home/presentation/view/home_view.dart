import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/view/widgets/build_horizontal_list.dart';
import 'package:bookly/features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/features/home/presentation/view_model/newest_books_cubit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        BlocProvider.of<FeaturedBooksCubit>(context).refreshFeaturedBooks();
        BlocProvider.of<NewestBooksCubit>(context).refreshNewestBooks();
        return Future.value();
      },
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.only(
          top: 30,
          right: 16,
          left: 16,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: ScreenSize.screenHeight(context) / 10,
                      child: const CustomAppBar(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: ScreenSize.screenHeight(context) / 4,
                      child: const BuildHorizontalList(),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Newest Books',
                      style: Styles.textStyle18,
                    ),
                  ],
                ),
              ),
            ),
            const SliverFillRemaining(child: BestSellerListView())
          ],
        ),
      )),
    );
  }
}
