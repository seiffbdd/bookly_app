import 'package:flutter/material.dart';

class BookImageWidget extends StatelessWidget {
  const BookImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(
        'https://img-cdn.pixlr.com/image-generator/history/65bb506dcb310754719cf81f/ede935de-1138-4f66-8ed7-44bd16efc709/medium.webp',
        fit: BoxFit.fill,
      ),
    );
  }
}
