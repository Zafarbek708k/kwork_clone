import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';

import '../../../../core/widgets/text_widget.dart';

class MoreNotificationItem extends StatefulWidget {
  const MoreNotificationItem({
    super.key,
    required this.title,
    this.count,
    required this.type,
    this.onPressed, this.textColor, required this.topLine, required this.bottomLine,
  });

  final VoidCallback? onPressed;
  final String title;
  final int? count;
  final int type;
  final Color? textColor;
  final bool topLine, bottomLine;

  @override
  State<MoreNotificationItem> createState() => _MoreNotificationItemState();
}

class _MoreNotificationItemState extends State<MoreNotificationItem> {
  bool selected = false;
  String count = '';

  @override
  void initState() {
    if(widget.count != null){
      count = "(${widget.count})";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Color textColor;
    if(widget.textColor != null){
      textColor = widget.textColor!;
    }else{
      textColor = context.appTheme.secondary;
    }
    Widget trailing;
    switch (widget.type) {
      case 1:
        trailing = CupertinoSwitch(
          value: selected,
          onChanged: (value) {
            setState(() {
              selected = value;
            });
          },
        );
        break;
      case 2:
        trailing = const Icon(Icons.arrow_forward_ios, color: Colors.green);
        break;
      case 3:
        trailing = const Icon(Icons.copy_sharp, color: Colors.green);
        break;
      default:
        trailing = const SizedBox.shrink();
        break;
    }

    return Column(
      children: [
        widget.topLine ? const Divider() : const SizedBox.shrink(),
        ListTile(
          title: CustomTextWidget(
            "${widget.title} $count",
            textColor: textColor,
          ),
          trailing: trailing,
          onTap: widget.onPressed,
        ),
        widget.bottomLine ? const Divider() : const SizedBox.shrink(),
      ],
    );
  }
}
