import 'package:flutter/material.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  bool item1 = false;
  bool item2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with user profile details
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomTextWidget(
                'mrkarimov708k',
                textColor: context.appTheme.secondary,
              ),
              background: Stack(
                fit: StackFit.values[1],
                children: [
                  Image.network(
                    'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0',
                    fit: BoxFit.cover,
                  ),

                  // Profile Info
                  const Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Zafarbek',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text('Flutter'),
                        ],
                      ),
                      SizedBox(width: 16),
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                          "assets/images/human.png", // Replace with your image link
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            leading: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    // Handle back button action
                  },
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.visibility),
                onPressed: () {
                  // Handle visibility toggle
                },
              ),
            ],
          ),

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
                          offset: Offset(0, 4),
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

          // List Items (like Kworks, Favorites, etc.)
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 10),
                  child: CustomTextWidget("KWorks", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
                ),
                ...List.generate(
                  items.length,
                  (index) {
                    return _buildListTile(items[index], index + 1);
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 20),
                  child: CustomTextWidget("Setting", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
                ),

                ...List.generate(
                  items.length,
                      (index) {
                    return _buildListTile(items[index], index + 1);
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 20),
                  child: CustomTextWidget("Push Notification", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
                ),

                ...List.generate(
                  items.length,
                      (index) {
                    return _buildListTile(items[index], index + 1);
                  },
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 20),
                  child: CustomTextWidget("Chats", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
                ),
                ...List.generate(
                  items.length,
                      (index) {
                    return _buildListTile(items[index], index + 1);
                  },
                ),


              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, int? count) {
    return Column(
      children: [
        ListTile(
          title: CustomTextWidget("$title ($count)", textColor: context.appTheme.secondary),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {},
        ),
        const Divider(),
      ],
    );
  }
}

List<String> items = ["My KWorks", "Favorites", "Hidden", "Viewed"];
