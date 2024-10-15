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
    return   Scaffold(
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        title: CustomTextWidget("Chat", textColor: context.appTheme.secondary, fontWeight: FontWeight.w600),
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 2), child: Divider(color: context.appTheme.secondary)),
      ),
      backgroundColor: context.appTheme.primary,
    );
  }
}

