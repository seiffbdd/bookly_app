import 'package:flutter/material.dart';

class BuildCircleIndicator extends StatelessWidget {
  const BuildCircleIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }
}
