import 'package:fitness_app/screens/primary/feed/post_card.dart';
import 'package:fitness_app/models/post.dart';
import 'package:fitness_app/supabase/post_methods.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final ScrollController _scrollController = ScrollController();

  String currentFeed = 'Explore';
  final List<Post> _posts = [];
  int postLimit = 3;
  int fetchedPostCount = 0;

  bool _isLoading = false;

  bool _isContentVisible = true;

  void getPosts() async {
    if (_isLoading) return;

    beginLoading();

    // Get the posts from the database
    List<Post> newPosts =
        await PostMethods().getExplorePosts(postLimit, fetchedPostCount);

    _posts.addAll(newPosts);
    fetchedPostCount = _posts.length;

    stopLoading();
  }

  void loadMore() async {
    if (_isLoading) return;

    beginLoading();

    // Save the current scroll position when loading more posts
    double prevScrollPosition = _scrollController.position.pixels;

    // Get the posts from the database
    List<Post> newPosts =
        await PostMethods().getExplorePosts(postLimit, fetchedPostCount);

    _posts.addAll(newPosts);
    fetchedPostCount = _posts.length;

    // Hide the content while loading more posts
    setState(() {
      _isContentVisible = false;
    });

    // Jump back to the previous scroll position after loading more posts
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(prevScrollPosition);

        // Show the content after loading more posts to prevent seeing the last position briefly
        setState(() {
          _isContentVisible = true;
        });
      }
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

    // Automatically load more when we get to the bottom of the list
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMore();
      }
    });

    getPosts();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: Opacity(
                    opacity: _isContentVisible ? 1.0 : 0.0,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: _posts.length,
                      itemBuilder: (context, index) {
                        return PostCard(data: _posts[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
