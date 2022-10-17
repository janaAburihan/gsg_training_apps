import 'package:flutter/material.dart';
import 'package:gsg/social_app/screens/all_posts.dart';
import 'package:gsg/social_app/screens/liked_posts.dart';

class PostMainScreen extends StatefulWidget {
  const PostMainScreen({super.key});

  @override
  State<PostMainScreen> createState() => _PostMainScreenState();
}

class _PostMainScreenState extends State<PostMainScreen> {
  PageController controler = PageController();
  int currentIndex = 0;
  //final screens = [const AllPosts(), const LikedPosts()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Social Media App')),
      body: PageView(
        controller: controler,
        children: const [AllPosts(), LikedPosts()],
      ),
      /**OR
      body: IndexedStack(
        index: currentIndex'
        children: screens,
      ),
       */
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          currentIndex = index;
          setState(() {});
          controler.animateToPage(index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.linear);
        },
        /**OR
        onTap: (index)=>setState((){}) => currentIndex = index */
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          )
        ],
        //backgroundColor: Colors.blue,
      ),
    );
  }
}
