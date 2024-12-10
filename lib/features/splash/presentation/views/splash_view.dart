import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width / 1.5,
        child: SvgPicture.asset(
          AssetsData.logo,
          fit: BoxFit.contain,
        ),
      )),
    );
  }
}
