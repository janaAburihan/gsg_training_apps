import 'package:flutter/material.dart';
import 'package:gsg/social_app/widgets/post_widget.dart';

import '../repositories/dummy_data.dart';

class LikedPosts extends StatefulWidget {
  const LikedPosts({super.key});

  @override
  State<LikedPosts> createState() => _LikedPostsState();
}

class _LikedPostsState extends State<LikedPosts> {
  checkPost() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.where((item) => item.isLiked).length,
      itemBuilder: (context, index) {
        return PostWidget(
            posts.where((item) => item.isLiked).toList()[index], checkPost);
      },
    );
  }
}
