import 'package:fitness_app/components/post_card.dart';
import 'package:fitness_app/models/post.dart';
import 'package:fitness_app/supabase/db_methods.dart';
import 'package:flutter/material.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({Key? key}) : super(key: key);

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  String currentFeed = 'Explore';
  final List<Post> _posts = [];
  int postLimit = 10;
  int fetchedPostCount = 0;

  bool _isLoading = false;

  void getPosts() async {
    beginLoading();
    // Get the posts from the database
    List<Post> newPosts =
        await DbMethods().getExplorePosts(postLimit, fetchedPostCount);

    setState(() {
      _posts.addAll(newPosts);
      fetchedPostCount = _posts.length;
    });

    stopLoading();
  }

  void beginLoading() {
    if (mounted) {
      setState(() {
        _isLoading = true;
      });
    }
  }

  void stopLoading() {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
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
