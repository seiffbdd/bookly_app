import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
            height: screenHeight(context) / 10,
            width: screenWidth(context) / 4,
            child: SvgPicture.asset(AssetsData.logo)),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ))
      ],
    );
  }
}
