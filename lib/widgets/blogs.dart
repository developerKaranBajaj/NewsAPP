import 'package:flutter/material.dart';

class BlogTitle extends StatelessWidget {
  final String imageUrl, title, desc;
  const BlogTitle({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(imageUrl),
        Text(title),
        Text(desc),
      ],
    );
  }
}