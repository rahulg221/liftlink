import 'package:fitness_app/components/post_card.dart';
import 'package:fitness_app/models/post.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/supabase/db_methods.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

    // Get current user id from Provider
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final String uid = userProvider.getUser.uid;

    // Get the posts from the database
    List<Post> newPosts =
        await DbMethods().getFollowingPosts(postLimit, fetchedPostCount, uid);

    // Add all new posts to current list of posts
    _posts.addAll(newPosts);
    fetchedPostCount = _posts.length;

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
                const SizedBox(height: 8),
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
