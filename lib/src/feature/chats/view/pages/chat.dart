import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/routes/app_route_name.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';

class Chat extends StatefulWidget {
  final StatefulNavigationShell navigationShell;  // Accept navigationShell

  const Chat({super.key, required this.navigationShell});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: CustomTextWidget(
            "Chat",
            textColor: context.appTheme.secondary,
            fontWeight: FontWeight.w600,
          ),
        ),
        title: const CircleAvatar(
          foregroundImage: AssetImage("assets/images/human.png"),
          radius: 20,
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            context.push("${AppRouteName.chats}/${AppRouteName.search}");
          }, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {
            context.push("${AppRouteName.chats}/${AppRouteName.support}");
          }, icon: const Icon(Icons.call_rounded)),
        ],
        iconTheme: IconThemeData(color: context.appTheme.secondary),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 2),
          child: Divider(color: context.appTheme.secondary),
        ),
      ),
      backgroundColor: context.appTheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 160,
              width: double.infinity,
              child: Image.asset("assets/images/ChatBot.png"),
            ),
            CustomTextWidget(
              "No Chats Yet",
              fontWeight: FontWeight.bold,
              fontSize: 24,
              textColor: context.appTheme.secondary,
            ),
            CustomTextWidget(
              "Your chats with other users will appear here",
              fontWeight: FontWeight.w400,
              fontSize: 14,
              textColor: context.appTheme.secondary,
            ),
            const SizedBox(height: 10),
            MaterialButton(
              onPressed: () {
                widget.navigationShell.goBranch(
                  0,
                  initialLocation: 0 == widget.navigationShell.currentIndex,
                );
              },
              shape: const StadiumBorder(),
              color: Colors.green,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0),
                child: CustomTextWidget("Go To Catalog"),
              ),
            )
          ],
        ),
      ),
    );
  }
}

