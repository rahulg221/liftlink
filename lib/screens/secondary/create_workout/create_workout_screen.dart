import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/supabase/group_methods.dart';
import 'package:fitness_app/utils/util_methods.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateGroupScreen extends StatefulWidget {
  const CreateGroupScreen({super.key});

  @override
  State<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  bool _isLoading = false;

  String profilePicUrl = '';
  String username = '';
  String workoutType = 'Chest & Back';
  String workoutDateTime = '';
  String uid = '';
  bool friendsCanSee = false;
  bool myGymCanSee = false;

  String workoutTime = '';
  DateTime temp = DateTime.now();

  double scale = 1.0;

  void getInfo() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    profilePicUrl = userProvider.getUser.profilePic;
    username = userProvider.getUser.username;
    uid = userProvider.getUser.uid;
  }

  Future<void> createGroup() async {
    beginLoading();

    if (workoutType.isEmpty || workoutDateTime.isEmpty) {
      // Show an error message if any of the inputs are not used
      UtilMethods.showSnackBar(
          'Please select a workout type and time.', context);
      stopLoading();
      return;
    }

    await GroupMethods().createGroup(uid, username, profilePicUrl, workoutType,
        workoutDateTime, friendsCanSee, myGymCanSee);

    stopLoading();

    if (mounted) {
      Navigator.of(context).pop();
      UtilMethods.showSnackBar('Group created successfully', context);
    }
  }

  void beginLoading() {
    setState(() {
      _isLoading = true;
    });
  }

  void stopLoading() {
    setState(() {
      _isLoading = false;
    });
  }

  void _showDialog(Widget child, ThemeData theme) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: theme.colorScheme.primary,
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('New group', style: theme.textTheme.bodyLarge),
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(
              CupertinoIcons.back,
              color: theme.colorScheme.onBackground,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Expanded(child: SizedBox()),
                    GestureDetector(
                      onTap: createGroup,
                      child: Container(
                        width: width - 32,
                        height: 55,
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Create',
                            style: theme.textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
