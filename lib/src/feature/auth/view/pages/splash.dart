import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/routes/app_route_name.dart';
import 'package:kwork_clone/src/feature/auth/view/widgets/logo_animation.dart';
import '../../../../core/widgets/text_widget.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Timer? _timer;

  Future<void> init() async {
    _timer = Timer(const Duration(seconds: 4), () {
      if (mounted) {
        context.go(AppRouteName.login);
      }
    });
  }

  @override
  void didChangeDependencies() async {
    await init();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // Cancel the timer if the widget is disposed
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomFadeAnimation(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  height: 80.h,
                  width: 80.w,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/icons/kWorkLogo.png"), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            CustomFadeAnimation(child: CustomTextWidget("Welcome to KWork", textColor: context.appTheme.secondary)),
          ],
        ),
      ),
    );
  }
}
