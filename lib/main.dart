import 'package:fitness_app/providers/theme_provider.dart';
import 'package:fitness_app/providers/user_provider.dart';
import 'package:fitness_app/screens/onboarding/splash/splash_screen.dart';
import 'package:fitness_app/utils/constants.dart';
import 'package:fitness_app/utils/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  // Ensure that Flutter has been initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase
  Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseAnonKey,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (_) => ThemeProvider(ThemeConfig.darkTheme)),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: Consumer<ThemeProvider>(builder: (_, ThemeProvider, __) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Fitness App',
            theme: ThemeProvider.getTheme(),
            home: const SplashScreen(),
          );
        }));
  }
}
