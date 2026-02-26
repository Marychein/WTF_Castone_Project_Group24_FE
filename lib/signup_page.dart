import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sunfi/widgets/auth_widgets.dart';
import 'package:sunfi/widgets/custom_textfield.dart';
import 'package:sunfi/widgets/password_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameC = TextEditingController();
  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  void dispose() {
    nameC.dispose();
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1FBFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(18, 10, 18, 18),
          child: Column(
            children: [
              // Top bar (back + centered logo)
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  ),
                  const Spacer(),
                  SvgPicture.asset('assets/logo.svg',  width: 200),
                  const Spacer(),
                  const SizedBox(width: 14),
                ],
              ),


              // Green card (same component as login)
              GreenAuthCard(
                title: "Welcome to SunFi",
                subtitle: "Create an Account",
                buttonText: "Create Account",
                onPressed: () {
                  // TODO: handle sign up
                  // print(nameC.text);
                  // print(emailC.text);
                  // print(passC.text);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Full Name", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                    const SizedBox(height: 6),
                    CustomTextFieldWidget(
                      label: "",
                      hintText: "Enter text here",
                      icon: Icons.person,
                      controller: nameC,
                    ),

                    const SizedBox(height: 12),

                    const Text("Email", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                    const SizedBox(height: 6),
                    CustomTextFieldWidget(
                      label: "",
                      hintText: "Enter your email address",
                      icon: Icons.email,
                      controller: emailC,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 12),

                    const Text("Password", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                    const SizedBox(height: 6),
                    PasswordTextField(controller: passC),
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