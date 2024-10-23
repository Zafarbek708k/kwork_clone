import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';

class MyExpandableRichText extends StatefulWidget {
  const MyExpandableRichText({super.key, required this.text});

  final String text;

  @override
  State<MyExpandableRichText> createState() => _MyExpandableRichTextState();
}

class _MyExpandableRichTextState extends State<MyExpandableRichText> {
  late final ValueNotifier<bool> isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = ValueNotifier(false);
  }

  @override
  void dispose() {
    isExpanded.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final words = widget.text.split(' ');
    final truncatedText = words.take(15).join(' ');
    final remainingText = words.skip(15).join(' ');

    return ValueListenableBuilder(
      valueListenable: isExpanded,
      builder: (BuildContext context, bool value, Widget? child) => RichText(
        text: TextSpan(
          children: [
            TextSpan(text: value ? widget.text : truncatedText, style: TextStyle(color: context.appTheme.secondary)),
            if (!value && remainingText.isNotEmpty) const TextSpan(text: '... '),
            TextSpan(
              text: value ? "Less" : " More...",
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  isExpanded.value = !value;
                },
            ),
          ],
        ),
      ),
    );
  }
}
