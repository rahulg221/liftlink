import 'package:fitness_app/screens/primary/feed/post_card.dart';
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
  final List<Post> _posts = [];
  int postLimit = 10;
  int fetchedPostCount = 0;

  bool _isLoading = false;

  void getPosts() async {
    if (_isLoading) return;

    beginLoading();
    // Get the posts from the database
    List<Post> newPosts =
        await DbMethods().getExplorePosts(postLimit, fetchedPostCount);

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
    final theme = Theme.of(context);
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: _posts.length + 1,
                    itemBuilder: (context, index) {
                      if (index == _posts.length) {
                        return _isLoading
                            ? const Center(child: CircularProgressIndicator())
                            : TextButton(
                                onPressed: () {
                                  getPosts();
                                },
                                child: Text('Load more',
                                    style: theme.textTheme.bodySmall!.copyWith(
                                        color: theme.colorScheme.primary)));
                      } else {
                        return PostCard(data: _posts[index]);
                      }
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
