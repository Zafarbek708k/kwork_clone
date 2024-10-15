import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/routes/app_route_name.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';

import '../widgets/auth_main_button.dart';
import '../widgets/auth_main_textfield.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visible = false;
  TextEditingController ctrEmail = TextEditingController();
  TextEditingController ctrPassword = TextEditingController();

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
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 20),
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
            CustomTextWidget("Welcome back!", textColor: context.appTheme.secondary, fontWeight: FontWeight.w600, fontSize: 20),
            CustomTextWidget("Please enter your login information.",
                textColor: context.appTheme.secondary, fontWeight: FontWeight.w400, fontSize: 16),
            const SizedBox(height: 30),
            AuthMainTextField(controller: ctrEmail, hintText: "Email or Username"),
            const SizedBox(height: 30),
            AuthMainTextField(controller: ctrEmail, hintText: "Password", isPassword: true),
            const SizedBox(height: 30),
            AuthMainButton(
              onPressed: () => context.push(AppRouteName.catalog),
              title: "Sign In",
              backgroundColor: Colors.green,
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: const CustomTextWidget("Forgot your password?", textColor: Colors.blue, fontWeight: FontWeight.w500, fontSize: 18),
            ),
            const SizedBox(height: 30),
            AuthMainButton(
              onPressed: () {},
              borderColor: context.appTheme.secondary,
              title: "Continue with google",
              imageName: "assets/icons/googleLogo.png",
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
