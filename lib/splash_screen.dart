import 'package:authentication_with_sharedpreference_/home_screen.dart';
import 'package:authentication_with_sharedpreference_/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferencesAsync asyncPrefs = SharedPreferencesAsync();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      bool? isLogged = await asyncPrefs.getBool("logged");
      if (isLogged == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.flutter_dash, size: 100, color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Welcome to MyApp',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                letterSpacing: 1.2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
