import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

launchCustomUrl({required String link, required BuildContext context}) async {
  Uri url = Uri.parse(link);
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    if (context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Can\'t Preview book')));
      throw Exception('Could not launch $url');
    }
  }
}
