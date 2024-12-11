import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();

    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo and its animation
            AnimatedBuilder(
                animation: _animation,
                builder: (context, _) {
                  return SlideTransition(
                    position: _animation,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: MediaQuery.of(context).size.height / 4,
                      child: SvgPicture.asset(
                        AssetsData.logo,
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                }),
            // text and its animation
            AnimatedBuilder(
                animation: _animation,
                builder: (context, _) {
                  return SlideTransition(
                    position: _animation,
                    child: const Text(
                      'Everything is free',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }

  void initSlidingAnimation() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 2,
      ),
    );

    _animation =
        Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
            .animate(_animationController);
    _animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Get.off(() => const HomeView(),
            transition: Transition.fadeIn, duration: kTransitionDuration);
      },
    );
  }
}
