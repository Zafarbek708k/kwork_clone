import 'package:flutter/material.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(  backgroundColor: context.appTheme.primary,title: CustomTextWidget("More", textColor: context.appTheme.secondary)),
    );
  }
}
