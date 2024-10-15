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

                // TabBar for Seller and Buyer
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Seller Tab
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          child: const Text('Seller'),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            // Handle Buyer Tab
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.grey.shade300),
                            ),
                          ),
                          child: const Text('Buyer'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // List Items (like Kworks, Favorites, etc.)
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _buildListTile('My kworks', 0),
                _buildListTile('Favorites', 0),
                _buildListTile('Favorites', 0),
                _buildListTile('Favorites', 0),
                _buildListTile('Favorites', 0),
                _buildListTile('Favorites', 0),
                _buildListTile('Favorites', 0),
                _buildListTile('Hidden', 0),
                _buildListTile('Viewed', 0),
                _buildListTile('Viewed', 0),
                _buildListTile('Viewed', 0),
                _buildListTile('Viewed', 0),
                _buildListTile('Viewed', 0),
                _buildListTile('Viewed', 0),
                const Divider(),
                _buildListTile('Profile', null),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(String title, int? count) {
    return ListTile(
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (count != null) Text('($count)'),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
      onTap: () {
        // Handle tile tap
      },
    );
  }
}
