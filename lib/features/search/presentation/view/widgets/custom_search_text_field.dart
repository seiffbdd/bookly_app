import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: true,
      autofocus: true,
      textInputAction: TextInputAction.search,
      style: Styles.textStyle20,
      decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.5))),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 30,
            ),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
              borderSide: BorderSide(color: Colors.white.withOpacity(0.5)))),
    );
  }
}
