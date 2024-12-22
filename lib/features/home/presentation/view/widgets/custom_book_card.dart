import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomBookCard extends StatelessWidget {
  const CustomBookCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child: SizedBox(
            width: ScreenSize.screenWidth(context) / 5,
            height: ScreenSize.screenHeight(context) / 7,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  'this is a good cat vdsvvdsdfdfvdsdfvfdvfvdfvfddvvdfdffvd',
                  style: Styles.textStyle20,
                ),
              ),
              Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  'book owner',
                  style: Styles.textStyle14
                      .copyWith(color: Colors.white.withOpacity(0.5))),
              Row(
                children: [
                  const Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    '19.9 \$',
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
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
              )
            ],
          ),
        )
      ],
    );
  }
}
