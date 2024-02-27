import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/layouts/mobile_screen_layout.dart';
import 'package:fitness_app/providers/theme_provider.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/login_screen.dart';
import 'package:fitness_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider(darkTheme)),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: Consumer<ThemeProvider>(builder: (_, ThemeProvider, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fitness App',
            theme: ThemeProvider.getTheme(),
            home: StreamBuilder(
                stream: FirebaseAuth.instance.authStateChanges(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasData) {
                      // User provider instance to set user details after automatically logging in
                      final userProvider =
                          Provider.of<UserProvider>(context, listen: false);

                      // Upon successful login refresh user to save all user details to our User provider - helps minimize reading data everytime we need user info
                      userProvider.refreshUser();
                      return MobileScreenLayout();
                    } else if (snapshot.hasError) {
                      return Center(child: Text('${snapshot.error}'));
                    }
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(
                            color: theme.colorScheme.primary));
                  }

                  return const LoginScreen();
                }),
          );
        }));
  }
}
