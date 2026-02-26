import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'sunfi_onboarding_page.dart';

class SunfiSplashScreen extends StatefulWidget {
  const SunfiSplashScreen({super.key});

  @override
  State<SunfiSplashScreen> createState() => _SunfiSplashScreenState();
}

class _SunfiSplashScreenState extends State<SunfiSplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const SunfiOnboardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB8FF6A), // Your green
      body: Center(
        child: SvgPicture.asset(
          'assets/SunFi_Logo.svg', // Make sure this matches EXACT name
          width: 250,
        ),
      ),
    );
  }
}