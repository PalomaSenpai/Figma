import 'package:flutter/material.dart';
import 'package:pmsn2025/screens/ResourcesScreen.dart';
import 'package:pmsn2025/screens/dashboard_screen.dart';
import 'package:pmsn2025/screens/list_students_screen.dart';
import 'package:pmsn2025/screens/login_screen.dart';
import 'package:pmsn2025/screens/prefers_user.dart';
import 'package:pmsn2025/screens/singup_screeen.dart';
import 'package:pmsn2025/screens/splash_screen.dart';
import 'package:pmsn2025/screens/todo_screen.dart';
import 'package:pmsn2025/screens/welcome_screen.dart';
import 'package:pmsn2025/utils/global_values.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeData>(
      valueListenable: GlobalValues.themeApp,
      builder: (context, theme, child) {
        return ValueListenableBuilder<String>(
          valueListenable: GlobalValues.fontFamily,
          builder: (context, font, child) {
            return MaterialApp(
              theme: theme.copyWith(
                textTheme: theme.textTheme.apply(
                  fontFamily: font, // Aplicamos la fuente a todo el textTheme
                ),
              ),
              routes: {
                "/list": (context) => const ListStudentsScreen(),
                "/dash": (context) => const DashboardScreen(),
                "/todo": (context) => const TodoScreen(),
                "/log": (context) => const LoginScreen(),
                "/res": (context) => const ResourcesScreen(),
                "/wel": (context) => const WelcomeScreen(),
                "/sin": (context) => const SingupScreen(),
                "/pre": (context) => const PrefersUser(),
              },
              title: 'Material App',
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}
