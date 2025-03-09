import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025/screens/dashboard_screen.dart';
import 'package:pmsn2025/screens/list_students_screen.dart';
import 'package:pmsn2025/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Widget _nextScreen = LoginScreen();

  @override
  void initState() {
    super.initState();
    _determineNextScreen();
  }


  Future<void> _determineNextScreen() async {
    final prefs = await SharedPreferences.getInstance();
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