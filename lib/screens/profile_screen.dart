import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/utils.dart';
import 'package:fitness_app/widgets/user_info_layout.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String username = 'davidlaid321';
  String photoUrl = dummyImage;
  int followerCount = 550;
  int followingCount = 375;
  int activeStreak = 45;
  String bio = 'Elite powerlifter and bodybuilder';

  final ScrollController _scrollController = ScrollController();

  final List<String> imageUrls = [
    'https://i.pinimg.com/736x/5f/45/0d/5f450d665cb9098199273e538bcf3b5b.jpg',
    'https://www.drworkout.fitness/wp-content/uploads/2021/07/David-Laid-Workout.jpg',
    'https://i.ytimg.com/vi/76DQyQPJBxI/maxresdefault.jpg',
    'https://th.bing.com/th/id/OIP.xXA76wYGlShNPRKaw4zO8AHaJQ?rs=1&pid=ImgDetMain',
  ];

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Profile', style: theme.textTheme.headlineSmall),
          actions: [
            IconButton(
              icon: Icon(FontAwesomeIcons.gear,
                  size: theme.iconTheme.size, color: theme.iconTheme.color),
              onPressed: () {
                navigateTo(SettingsScreen(), context);
              },
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                UserInfoLayout(
                    username: userProvider.getUser.username,
                    photoUrl: userProvider.getUser.photoUrl,
                    followerCount: userProvider.getUser.followerCount,
                    followingCount: userProvider.getUser.followingCount,
                    activeStreak: userProvider.getUser.streak,
                    bio: userProvider.getUser.bio),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Icon(
                      FontAwesomeIcons.cameraRetro,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Container(
                  height: (imageUrls.length * 0.5) * (width * 0.5),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      childAspectRatio: 1, // Aspect ratio of each item
                      crossAxisSpacing: 4, // Horizontal space between items
                      mainAxisSpacing: 4, // Vertical space between items
                    ),
                    itemCount: imageUrls.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(imageUrls[index], fit: BoxFit.cover);
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
