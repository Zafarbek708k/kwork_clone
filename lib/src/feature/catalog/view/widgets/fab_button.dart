import 'package:flutter/material.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import '../../../../core/widgets/text_widget.dart';

class FABButton extends StatelessWidget {
  const FABButton({super.key, required this.onPressed, required this.color,  this.icon, required this.title});

  final VoidCallback onPressed;
  final Icon? icon;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon ?? const  SizedBox.shrink(),
          CustomTextWidget(title, textColor: context.appTheme.secondary)
        ],
      ),
    );
  }
}

