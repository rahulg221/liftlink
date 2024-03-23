import 'package:fitness_app/components/post_card.dart';
import 'package:fitness_app/models/post.dart';
import 'package:fitness_app/supabase/db_methods.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String currentFeed = 'Explore';
  List<Post> _posts = [];
  int postLimit = 10;
  int fetchedPostCount = 0;

  void getPosts() async {
    // Get the posts from the database
    List<Post> newPosts =
        await DbMethods().getExplorePosts(postLimit, fetchedPostCount);

    setState(() {
      _posts.addAll(newPosts);
      fetchedPostCount = _posts.length;
    });
  }

  @override
  void initState() {
    super.initState();
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) {
                return PostCard(data: _posts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
