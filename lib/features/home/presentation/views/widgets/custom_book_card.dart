import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_image_widget.dart';
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
              width: screenWidth(context) / 5,
              height: screenHeight(context) / 7,
              child: const BookImageWidget()),
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
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                'book owner',
                style: TextStyle(
                    fontSize: 16.0, color: Colors.white.withOpacity(0.5)),
              ),
              Row(
                children: [
                  const Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    '19.9 \$',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
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
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    '   (2390)',
                    style: TextStyle(
                        fontSize: 16.0, color: Colors.white.withOpacity(.5)),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
