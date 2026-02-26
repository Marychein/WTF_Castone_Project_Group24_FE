import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunfi/login_page.dart';
import 'package:sunfi/signup_page.dart';

class SunfiOnboardingScreen extends StatefulWidget {
  const SunfiOnboardingScreen({super.key});

  @override
  State<SunfiOnboardingScreen> createState() => _SunfiOnboardingScreenState();
}

class _SunfiOnboardingScreenState extends State<SunfiOnboardingScreen> {
  final PageController _controller = PageController();
  int _index = 0;

  final List<OnboardData> pages = const [
    OnboardData(
      imagePath: 'assets/Onboarding1.jpg',
      title: 'Power Your Home\nSustainably',
      subtitle:
          'Generate clean energy for your home and save\non electricity bills.',
    ),
    OnboardData(
      imagePath: 'assets/Onboarding2.jpg',
      title: 'Monitor Your\nEnergy in Real-Time',
      subtitle:
          'Track your solar energy production and\nconsumption in real-time.',
    ),
    OnboardData(
      imagePath: 'assets/Onboarding3.jpg',
      title: 'Peace of Mind with\nExpert Care',
      subtitle: 'Get expert guidance and maintenance alerts\nall in one place.',
    ),
  ];

  void goNext() {
    if (_index < pages.length - 1) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    } else {
      // TODO: Navigate to your next screen after onboarding
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Onboarding finished → go to next screen'),
        ),
      );
    }
  }

  void goBack() {
    if (_index > 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (i) => setState(() => _index = i),
        itemBuilder: (_, i) {
          return OnboardingTemplate(
            data: pages[i],
            pageIndex: i,
            pageCount: pages.length,
            onNext: goNext,
            onBack: goBack,
            onLogin: () {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Go to Login')));
            },
          );
        },
      ),
    );
  }
}

class OnboardData {
  final String imagePath;
  final String title;
  final String subtitle;

  const OnboardData({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });
}

/// ONE TEMPLATE for all 3 pages
class OnboardingTemplate extends StatelessWidget {
  final OnboardData data;
  final int pageIndex;
  final int pageCount;
  final VoidCallback onNext;
  final VoidCallback onBack;
  final VoidCallback onLogin;

  const OnboardingTemplate({
    super.key,
    required this.data,
    required this.pageIndex,
    required this.pageCount,
    required this.onNext,
    required this.onBack,
    required this.onLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(child: Image.asset(data.imagePath, fit: BoxFit.cover)),

        // Dark overlay
        Positioned.fill(
          child: Container(color: Colors.black.withOpacity(0.18)),
        ),

        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(
              children: [
                // Top bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: pageIndex == 0 ? null : onBack,
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white.withOpacity(
                          pageIndex == 0 ? 0.35 : 0.95,
                        ),
                      ),
                    ),
                    SvgPicture.asset('assets/logo.svg', width: 210),
                    IconButton(
                      onPressed: onNext,
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.white.withOpacity(0.95),
                      ),
                    ),
                  ],
                ),

                const SizedBox(
                  height: 200,
                ), // ✅ space at the beginning like Figma
                // Glass panel behind text
                ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 26,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(
                          0.25,
                        ), // transparent panel
                        border: Border.all(
                          color: Colors.white.withOpacity(0.18),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Text(
                            data.title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              height: 1.5,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            data.subtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              height: 2,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 60),

                          // Button
                          SizedBox(
                            width: 220,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => LoginPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF75C837),
                                foregroundColor: Colors.white,

                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "Let's get started",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 50),

                          // Login text
                          GestureDetector(
                            onTap: onLogin,
                            child: RichText(
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                                children: [
                                  const TextSpan(
                                    text: "Don't have an account? ",
                                  ),
                                  TextSpan(
                                    text: 'Sign Up',
                                    style: const TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.w800,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (_) => const SignupPage(),
                                          ),
                                        );
                                      },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40),

                          DotsIndicator(
                            count: pageCount,
                            activeIndex: pageIndex,
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DotsIndicator extends StatelessWidget {
  final int count;
  final int activeIndex;

  const DotsIndicator({
    super.key,
    required this.count,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (i) {
        final isActive = i == activeIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          height: 7,
          width: isActive ? 18 : 7,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(isActive ? 0.95 : 0.45),
            borderRadius: BorderRadius.circular(999),
          ),
        );
      }),
    );
  }
}
