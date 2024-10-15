import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';

import '../../../../core/routes/app_route_name.dart';
import '../../../../core/widgets/text_widget.dart';
import '../widgets/auth_main_button.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        centerTitle: true,
        title: CustomTextWidget("Sign in", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 16),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_ios, size: 18)),
        iconTheme: IconThemeData(color: context.appTheme.secondary),
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 2), child: Divider(color: context.appTheme.secondary)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: context.appTheme.primary, width: 1),
                image: const DecorationImage(image: AssetImage("assets/icons/kWorkLogo.png")),
              ),
            ),
            const SizedBox(height: 30),
            CustomTextWidget("Create a KWork Account", textColor: context.appTheme.secondary, fontWeight: FontWeight.w600, fontSize: 18),
            const SizedBox(height: 10),
            CustomTextWidget(
              "You are just one step away from joining the world's simplest and smartest freelance platform",
              textColor: context.appTheme.secondary,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            const SizedBox(height: 30),
            AuthMainButton(
              onPressed: () {},
              borderColor: context.appTheme.secondary,
              title: "Continue with google",
              imageName: "assets/icons/googleLogo.png",
            ),
            const SizedBox(height: 10),
            AuthMainButton(
              onPressed: () => context.push(AppRouteName.catalog),
              title: "Sign up via Email",
              backgroundColor: Colors.green,
            ),
            const SizedBox(height: 15),
            TermsOfUseWidget(onPressed: () {}, onTap: () {}),
            const Spacer(flex: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => context.go(AppRouteName.login),
                  child: const CustomTextWidget("Have an account? Sign In", textColor: Colors.blue, fontWeight: FontWeight.w500, fontSize: 14),
                ),
              ],
            ),
            const Spacer(flex: 1)
          ],
        ),
      ),
    );
  }
}

class TermsOfUseWidget extends StatelessWidget {
  const TermsOfUseWidget({super.key, required this.onPressed, required this.onTap});

  final VoidCallback onPressed;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 14.0,
          ),
          children: [
            const TextSpan(text: "By signing up, you accept Kwork's "),
            TextSpan(
                text: "Terms of Service",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = () => onPressed),
            const TextSpan(text: ", "),
            TextSpan(
                text: "Privacy Policy",
                style: const TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()..onTap = () => onTap),
            const TextSpan(text: ", and agree to receive emails from Kwork."),
          ],
        ),
      ),
    );
  }
}
