import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/features/home/presentation/views/widgets/build_horizontal_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_card.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screenHeight(context) / 10,
                child: const CustomAppBar(),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: screenHeight(context) / 4,
                child: const BuildHorizontalList(),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Best Seller',
                style: TextStyle(fontSize: 20),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: SizedBox(
                      height: screenHeight(context) / 7,
                      child: const CustomBookCard(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
