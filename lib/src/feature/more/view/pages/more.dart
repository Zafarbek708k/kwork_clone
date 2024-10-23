import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/routes/app_route_name.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';
import 'package:kwork_clone/src/feature/more/view/widgets/sliver_appbar.dart';
import '../widgets/more_notification_item_widget.dart';
import '../widgets/more_ratingbar_widget.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool item1 = true;
  bool item2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),

          // Profile and balance details
          SliverToBoxAdapter(
            child: Column(
              children: [
                // Balance Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          CustomTextWidget(
                            'Balance',
                            textColor: context.appTheme.secondary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 10),
                          const Row(
                            children: [
                              Text(
                                '0.00',
                                style: TextStyle(fontSize: 30, color: Colors.green),
                              ),
                              Text(
                                '\$',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.history, color: Colors.orange),
                                  const SizedBox(width: 5),
                                  CustomTextWidget(
                                    'Transaction History',
                                    textColor: context.appTheme.secondary,
                                    fontSize: 12,
                                  ),
                                  const Icon(Icons.arrow_forward_ios, size: 16),
                                  const SizedBox(width: 20),
                                  TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Withdraw Funds',
                                      style: TextStyle(color: Colors.green),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                /// buyer seller button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade300,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  item1 = true;
                                  item2 = false;
                                });
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: item1
                                      ? LinearGradient(
                                          colors: [
                                            context.appTheme.primary.withOpacity(0.8),
                                            context.appTheme.primary,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )
                                      : null,
                                ),
                                child: Center(
                                  child: CustomTextWidget(
                                    "Seller",
                                    textColor: item1 ? context.appTheme.onPrimary : Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  item2 = true;
                                  item1 = false;
                                });
                              },
                              borderRadius: BorderRadius.circular(8),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: item2
                                      ? LinearGradient(
                                          colors: [
                                            context.appTheme.primary.withOpacity(0.8),
                                            context.appTheme.primary,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        )
                                      : null,
                                ),
                                child: Center(
                                  child: CustomTextWidget(
                                    "Buyer",
                                    textColor: item2 ? context.appTheme.onPrimary : Colors.black54,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),

          // List Items (like KWorks, Favorites, etc.)
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 10),
                child: CustomTextWidget("KWorks", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
              ),
              ...List.generate(
                kWorks.length,
                (index) {
                  List<int> items = [44, 85, 96, 88];
                  return MoreNotificationItem(
                    title: kWorks[index],
                    count: index != 3 ? items[index] : null,
                    type: 2,
                    onPressed: () {
                      switch (index) {
                        case 0:
                          context.push("${AppRouteName.more}/${AppRouteName.myKWorks}");
                        case 1:
                          context.push("${AppRouteName.more}/${AppRouteName.favorite}");
                        case 2:
                          showItem(context, "Peekaboo! Nothing here", true);
                        case 3:
                          context.push("${AppRouteName.more}/${AppRouteName.viewed}");
                      }
                    },
                    topLine: false,
                    bottomLine: true,
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 20),
                child: CustomTextWidget("Setting", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
              ),
              ...List.generate(
                setting.length,
                (index) {
                  return MoreNotificationItem(
                    title: setting[index],
                    type: 2,
                    topLine: false,
                    bottomLine: true,
                    onPressed: () {
                      switch (index) {
                        case 0:
                          context.push("${AppRouteName.more}/${AppRouteName.profile}");
                        case 1:
                          context.push("${AppRouteName.more}/${AppRouteName.setting}");
                      }
                    },
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 20),
                child: CustomTextWidget("Push Notification", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
              ),
              ...List.generate(
                pushNotification.length,
                (index) {
                  return MoreNotificationItem(title: pushNotification[index], topLine: false, bottomLine: true, type: 1, onPressed: () {});
                },
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 20),
                child: CustomTextWidget("Chats", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
              ),
              ...List.generate(
                chats.length,
                (index) {
                  return MoreNotificationItem(
                    title: chats[index],
                    type: 2,
                    topLine: false,
                    bottomLine: true,
                    onPressed: () {
                      log(index.toString());
                      switch (index) {
                        case 0: context.push("${AppRouteName.more}/${AppRouteName.blockedUsers}");
                        case 1: context.push("${AppRouteName.more}/${AppRouteName.support}");
                      }
                    },
                  );
                },
              ),
              const MoreRatingBar(),
              MoreNotificationItem(
                  title: "Copy my profile link",
                  count: 1,
                  type: 3,
                  topLine: true,
                  bottomLine: false,
                  onPressed: () {
                    showItem(context, "Copy to ClipBoard!", false);
                  }),
              MoreNotificationItem(
                title: "Sign out",
                type: 5,
                textColor: Colors.red,
                topLine: true,
                bottomLine: true,
                onPressed: () => context.go(AppRouteName.login),
              ),
              const SizedBox(height: 10)
            ]),
          ),
        ],
      ),
    );
  }

  void showItem(BuildContext context, String title, bool icon) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        // Optional: control how long the SnackBar stays
        content: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: const SizedBox(
                      width: 40, // Set width and height for better control of image size
                      height: 40,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/icons/kWorkLogo.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            icon ? const Spacer() : const SizedBox.shrink(),
            CustomTextWidget(
              title,
              textColor: Colors.white,
              fontSize: 12,
            ),
            const SizedBox(width: 5)
          ],
        ),
        behavior: SnackBarBehavior.floating,
        width: 250,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), // Optional: rounded corners
        ),
      ),
    );
  }
}

List<String> kWorks = ["My KWorks", "Favorites", "Hidden", "Viewed"],
    setting = ["Profile", "Setting"],
    pushNotification = ["Push Notification", "Message Sound"],
    chats = ["Blocked users", "Message a Support Specialist"];
