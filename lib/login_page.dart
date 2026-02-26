import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunfi/nav/bottom_nav.dart';
import 'package:sunfi/widgets/auth_widgets.dart';
import 'package:sunfi/widgets/custom_textfield.dart';
import 'package:sunfi/widgets/password_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FBFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
          child: Column(
            children: [
              // Top bar: back + logo
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/logo.svg', width: 200),
                  const Spacer(),
                  const SizedBox(width: 14), // keep centered
                ],
              ),

              GreenAuthCard(
                title: "Welcome Back!",
                subtitle: "Login",
                buttonText: "Let's get started",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const SunfiBottomNav()),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 6),
                    CustomTextFieldWidget(
                      label: "",
                      hintText: "Enter your email address",
                      icon: Icons.email,
                      controller: emailC,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 12),

                    const Text(
                      "Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 6),
                    PasswordTextField(controller: passC),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (_) {}),
                        const Text(
                          "Remember me",
                          style: TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
