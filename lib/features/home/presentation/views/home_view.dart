import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/best_seller_list_view.dart';
import 'package:bookly/features/home/presentation/views/widgets/build_horizontal_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 16),
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
                    'Best Seller',
                    style: Styles.textStyle18,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverFillRemaining(
            child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(AppRouter.kBookDetailsView);
                },
                child: const BestSellerListView()))
      ],
    ));
  }
}
