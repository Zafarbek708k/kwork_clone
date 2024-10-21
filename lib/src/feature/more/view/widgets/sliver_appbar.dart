import 'package:flutter/material.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import '../../../../core/widgets/text_widget.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: 200.0,
      flexibleSpace: FlexibleSpaceBar(
        title: CustomTextWidget(
          'mrkarimov708k',
          textColor: context.appTheme.secondary,
        ),
        background: Stack(
          fit: StackFit.expand, // Properly expand the image to fill background
          children: [
            Image.network(
              'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
              fit: BoxFit.cover,
            ),
            const Positioned(
              bottom: 16, // Adjust position if needed
              left: 16,
              right: 16,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Zafarbek',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white, // For visibility on image
                        ),
                      ),
                      Text(
                        'Flutter',
                        style: TextStyle(
                          color: Colors.white, // For visibility on image
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage(
                      "assets/images/human.png", // Replace with your image link
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          // Handle back button action
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.visibility),
          onPressed: () {
            // Handle visibility toggle
          },
        ),
      ],
    );
  }
}
