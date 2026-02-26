import 'package:flutter/material.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  @override
  Widget build(BuildContext context) {
    Widget socialBtn(IconData icon) {
      return Container(
        width: 57,
        height: 57,
        decoration: BoxDecoration(
          color: const Color(0xFF75C837),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.white, size: 38),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        socialBtn(Icons.apple),
        const SizedBox(width: 40),
        socialBtn(Icons.g_mobiledata), // placeholder for Google icon
        const SizedBox(width: 40),
        socialBtn(Icons.facebook),
      ],
    );
  }
}

class GreenAuthCard extends StatelessWidget {
  const GreenAuthCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
    required this.buttonText,
    required this.onPressed,
    this.showRememberMe = false,
  });

  final String title;
  final String subtitle;
  final Widget child;
  final String buttonText;
  final VoidCallback onPressed;
  final bool showRememberMe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 18),
      decoration: BoxDecoration(
        color: const Color(0xFFCFFFB6),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              )),
          const SizedBox(height: 6),
          Text(subtitle,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              )),
          const SizedBox(height: 30),

          child,

          const SizedBox(height: 30),

          SizedBox(
            width: 200,
            height: 46,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF75C837),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(buttonText, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
            ),
          ),

          const SizedBox(height: 60),

          Row(
            children: const [
              Expanded(child: Divider(color: Colors.black26)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("or sign in with",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
              ),
              Expanded(child: Divider(color: Colors.black26)),
            ],
          ),

          const SizedBox(height: 30),
          const SocialRow(),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
}