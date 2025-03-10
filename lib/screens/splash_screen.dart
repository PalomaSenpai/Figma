import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025/screens/dashboard_screen.dart';
import 'package:pmsn2025/screens/login_screen.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/theme_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Widget _nextScreen = const LoginScreen();

  @override
  void initState() {
    super.initState();
    _loadPreferencesAndDetermineNextScreen();
  }

  Future<void> _loadPreferencesAndDetermineNextScreen() async {
    final prefs = await SharedPreferences.getInstance();
    String selectedTheme = prefs.getString('theme') ?? 'Día';
    if (selectedTheme == 'Día') {
      GlobalValues.themeApp.value = ThemeSettings.lightTheme();
    } else if (selectedTheme == 'Noche') {
      GlobalValues.themeApp.value = ThemeSettings.darkTheme();
    } else if (selectedTheme == 'Perso') {
      Color customPrimary = Color(prefs.getInt('customPrimary') ?? Colors.blue.value);
      Color customSecondary = Color(prefs.getInt('customSecondary') ?? Colors.orange.value);
      Color customSurface = Color(prefs.getInt('customSurface') ?? Colors.grey[200]!.value);
      Color customOnSurface = Color(prefs.getInt('customOnSurface') ?? Colors.black.value);
      GlobalValues.themeApp.value = ThemeSettings.themePerso(
        primary: customPrimary,
        secondary: customSecondary,
        surface: customSurface,
        onSurface: customOnSurface,
      );
    }
    String selectedFont = prefs.getString('font') ?? 'Roboto';
    GlobalValues.fontFamily.value = selectedFont;
    bool isSessionActive = prefs.getBool('MantenerSesion') ?? false;
    setState(() {
      _nextScreen = isSessionActive ? const DashboardScreen() : const LoginScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        duration: const Duration(milliseconds: 4000),
        nextScreen: _nextScreen,
        backgroundColor: Colors.white,
        splashScreenBody: Center(
          child: Lottie.asset("assets/tecnm.json"),
        ),
      ),
    );
  }
}