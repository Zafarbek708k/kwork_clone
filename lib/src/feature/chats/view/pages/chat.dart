import 'package:flutter/material.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

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
          child: CustomTextWidget("Chat", textColor: context.appTheme.secondary, fontWeight: FontWeight.w600),
        ),
        title: const  CircleAvatar(
          // backgroundImage: AssetImage("assets/images/human.png"),
          foregroundImage: AssetImage("assets/images/human.png"),
          radius: 20,
          // child: Image.asset("assets/images/human.png", fit: BoxFit.cover),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.call_rounded)),
        ],
        iconTheme: IconThemeData(color: context.appTheme.secondary),
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 2), child: Divider(color: context.appTheme.secondary)),
      ),
      backgroundColor: context.appTheme.primary,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [],
        ),
      )
    );
  }
}
