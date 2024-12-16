import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_details_app_bar.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/build_horizontal_list.dart';
import 'package:bookly/features/home/presentation/views/widgets/two_material_buttons_row.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

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
                child: const BookImageWidget(),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                'The Jungle Book',
                style: Styles.textStyle30,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'owner name',
                style: Styles.textStyle18
                    .copyWith(color: Colors.white.withOpacity(0.7)),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  const Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    '4.8',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                  ),
                  Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      '   (2390)',
                      style: Styles.textStyle14
                          .copyWith(color: Colors.white.withOpacity(0.5))),
                ],
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
                child: const BuildHorizontalList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
