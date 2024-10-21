import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/feature/auth/view/widgets/auth_main_button.dart';

import '../../../../core/widgets/text_widget.dart';

class MyKworks extends StatefulWidget {
  const MyKworks({super.key});

  @override
  State<MyKworks> createState() => _MyKworksState();
}

class _MyKworksState extends State<MyKworks> {
  bool isLoading = false;

  Future<bool> readKWorks() async {
    // read all KWorks data
    isLoading = true;
    return isLoading;
  }

  @override
  void didChangeDependencies() async {
    await readKWorks();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        title: CustomTextWidget("My KWorks", textColor: context.appTheme.secondary, fontSize: 20, fontWeight: FontWeight.w600),
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        iconTheme: IconThemeData(color: context.appTheme.secondary),
      ),
      body: isLoading ? const UiLoaded() : const Center(child: CircularProgressIndicator()),
    );
  }
}

class UiLoaded extends StatefulWidget {
  const UiLoaded({super.key});

  @override
  State<UiLoaded> createState() => _UiLoadedState();
}

class _UiLoadedState extends State<UiLoaded> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              SizedBox(
                height: 250,
                child: SvgPicture.asset("assets/images/Kiwi bird-bro.svg"),
              ),
              const Spacer(flex: 1),
              CustomTextWidget("You don't have any active\n kWorks (yet)!",
                  textAlign: TextAlign.center, textColor: context.appTheme.secondary, fontSize: 24, fontWeight: FontWeight.w500),
              const SizedBox(height: 10),
              CustomTextWidget("Create your first kWork to start selling",
                  textColor: context.appTheme.secondary, fontSize: 12, fontWeight: FontWeight.w400),
              const SizedBox(height: 10),
              AuthMainButton(
                backgroundColor: Colors.green,
                title: "Create a KWork \n go to site",
                textColor: context.appTheme.primary,
                onPressed: () {},
              ),
              const Spacer(flex: 2)
            ],
          ),
        ),
      ),
    );
  }
}
