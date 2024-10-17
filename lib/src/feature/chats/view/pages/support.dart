import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';
import 'package:kwork_clone/src/feature/catalog/view/widgets/text_field.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  List<String> messages = [];
  TextEditingController mesCtr = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        elevation: 2.0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back, color: context.appTheme.secondary),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundColor: Colors.lightBlueAccent,
              child: CustomTextWidget(
                "S",
                textColor: context.appTheme.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(width: 10),
            CustomTextWidget(
              "Support Team",
              textColor: context.appTheme.secondary,
              fontSize: 18,
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.star_border, color: Colors.deepOrangeAccent),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: Colors.blue),
          ),
        ],
      ),
      body: ListView(
        children: [
          messages.isEmpty
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      SvgPicture.asset(
                        "assets/svg/Email capture-bro.svg",
                        width: 200,
                      ),
                      const SizedBox(height: 20),
                      CustomTextWidget(
                        "No messages yet, start the conversation!",
                        textColor: context.appTheme.secondary,
                        fontSize: 16,
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    reverse: false,
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        color: context.appTheme.surface,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: CustomTextWidget(
                            messages[index],
                            textColor: context.appTheme.onSurface,
                            fontSize: 16,
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.file_copy_outlined, color: context.appTheme.secondary),
            ),
            Expanded(child: TF(controller: mesCtr)),
            IconButton(
              onPressed: () {
                if (mesCtr.text.trim().isEmpty) return;
                setState(() {
                  messages.add(mesCtr.text.trim());
                  mesCtr.clear();
                });
                _scrollToBottom();
              },
              icon: Icon(Icons.send_outlined, color: context.appTheme.secondary),
            ),
          ],
        ),
      ),
    );
  }

  void _scrollToBottom() {
    Future.delayed(
      const Duration(milliseconds: 300),
      () {
        scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }
}
