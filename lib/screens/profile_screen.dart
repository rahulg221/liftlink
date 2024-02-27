import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/settings_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/utils.dart';
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
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final width = MediaQuery.of(context).size.width;

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
                Padding(
                  padding:
                      const EdgeInsets.only(top: 75.0, left: 30, right: 30),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(photoUrl),
                          ),
                          Positioned(
                            bottom:
                                -5, // Position at the bottom of the profile picture
                            right:
                                -5, // Position to the right of the profile picture
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 34,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    color: theme.scaffoldBackgroundColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: theme.colorScheme.secondary,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                  onPressed: () {},
                                  padding: EdgeInsets
                                      .zero, // Removes default padding around the icon button
                                  constraints:
                                      const BoxConstraints(), // Removes default size constraints
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text('@$username',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(fontWeight: FontWeight.bold)),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text(
                                '$followerCount',
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text('followers',
                                  style: theme.textTheme.bodyMedium),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '$followingCount',
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text('following',
                                  style: theme.textTheme.bodyMedium),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                '$activeStreak',
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text('streak', style: theme.textTheme.bodyMedium),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'Edit profile',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.onSurface),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          Container(
                            width: 150,
                            height: 50,
                            decoration: BoxDecoration(
                              color: theme.colorScheme.surface,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                'Share profile',
                                style: theme.textTheme.bodyMedium!.copyWith(
                                    color: theme.colorScheme.onSurface),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text(bio, style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Icon(FontAwesomeIcons.cameraRetro),
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
                    itemCount: imageUrls.length, // Total number of items
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
