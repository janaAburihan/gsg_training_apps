import 'package:flutter/material.dart';
import 'package:gsg/social_app/widgets/post_widget.dart';

import '../repositories/dummy_data.dart';

class AllPosts extends StatelessWidget {
  const AllPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostWidget(posts[index]);
      },
    );
  }
}
