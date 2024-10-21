import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import '../../../../core/widgets/text_widget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(color: context.appTheme.secondary, Icons.arrow_back)),
        title: CustomTextWidget("Profile", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          ...List.generate(
            titles.length,
            (index) {
              return ProfileItem(
                  title: titles[index], result: results[index], topLine: index == 0 ? true : false, bottomLine: true, onPressed: () {});
            },
          )
        ],
      ),
    );
  }
}

List<String> titles = ["Name (Required)", "Specialization", "About Me", "Time Zone", "Country (region)"];
List<String> results = ["Zafarbek", "Flutter Development", "Flutter Dev", "(UTC +05:00)Tashkent", "Uzbekistan"];

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.result,
    this.onPressed,
    required this.bottomLine,
    required this.topLine,
    this.textColor,
  });

  final String title, result;
  final VoidCallback? onPressed;
  final bool topLine, bottomLine;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        topLine ? const Divider(color: Colors.grey) : const SizedBox.shrink(),
        ListTile(
          onTap: onPressed,
          title: CustomTextWidget(title, textColor: textColor ?? context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 14),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextWidget(result, textColor: Colors.green, fontSize: 12),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
        bottomLine ? const Divider(color: Colors.grey) : const SizedBox.shrink(),
      ],
    );
  }
}
