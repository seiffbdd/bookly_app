import 'package:bookly/core/utils/screen_size.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class TwoMaterialButtonsRow extends StatelessWidget {
  const TwoMaterialButtonsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
          minWidth: ScreenSize.screenWidth(context) / 2.5,
          color: Colors.white,
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  bottomLeft: Radius.circular(24))),
          onPressed: () {},
          child: const Text(
            '19.9\$',
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
        MaterialButton(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
          minWidth: ScreenSize.screenWidth(context) / 2.5,
          color: const Color(0xffef8262),
          shape: const OutlineInputBorder(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15))),
          onPressed: () {},
          child: Text('Free Preview',
              style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}
