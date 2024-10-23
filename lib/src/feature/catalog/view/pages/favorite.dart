import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';
import 'package:kwork_clone/src/feature/auth/view/widgets/auth_main_button.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(color: context.appTheme.secondary, Icons.arrow_back)),
        title: CustomTextWidget("Favorite KWorks", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              SizedBox(
                height: 200,
                child: SvgPicture.asset("assets/svg/Empty.svg"),
              ),
              CustomTextWidget(
                "You don't have any Favorite\n kworks (yet)!",
                textColor: context.appTheme.secondary,
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              CustomTextWidget(
                "Look for the heart icon next to a kwork to add it to your Favorites",
                textColor: context.appTheme.secondary,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 1),
              AuthMainButton(
                onPressed: () {
                  widget.navigationShell.goBranch(
                    0,
                    initialLocation: 0 == widget.navigationShell.currentIndex,
                  );
                },
                title: "Go to Catalog",
                backgroundColor: Colors.green,
              ),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
