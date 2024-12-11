import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/features/home/presentation/views/widgets/build_horizontal_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            const EdgeInsets.only(top: 30, right: 16, left: 16, bottom: 16),
        child: Column(
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
            )
          ],
        ),
      ),
    );
  }
}
