import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostWidget extends StatelessWidget {
  final PostModel postModel;
  final Function? fun;
  const PostWidget(this.postModel, [this.fun]);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(children: [
            CircleAvatar(
              backgroundImage: NetworkImage(postModel.user!.image!),
              radius: 40,
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(postModel.user!.name!),
                const Text('since 22 mins')
              ],
            )
          ]),
        ),
        Container(
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(postModel.image!), fit: BoxFit.cover),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10),
          child: Row(children: [
            FavoriteIcon(postModel, fun),
            const SizedBox(
              width: 10,
            ),
            const Icon(
              Icons.share,
              size: 30,
              color: Colors.blue,
            ),
          ]),
        ),
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(postModel.content ?? '')),
        const Divider()
      ],
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  FavoriteIcon(this.postModel, [this.function]);
  PostModel postModel;
  Function? function;

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState(postModel, function);
}

class _FavoriteIconState extends State<FavoriteIcon> {
  _FavoriteIconState(this.postModel, [this.function]);
  PostModel postModel;
  Function? function;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        postModel.isLiked = !postModel.isLiked;
        if (function != null)
          function!();
        else
          setState(() {});
      },
      child: Icon(
        Icons.favorite,
        size: 30,
        color: postModel.isLiked ? Colors.red : Colors.grey,
      ),
    );
  }
}
