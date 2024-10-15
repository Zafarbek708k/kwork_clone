import 'package:flutter/material.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';
import 'package:kwork_clone/src/feature/auth/view/widgets/auth_main_button.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return   DefaultTabController(
      length: 2,
      child: Scaffold(      backgroundColor: context.appTheme.primary,
        appBar: AppBar(
          backgroundColor: context.appTheme.primary,
          title: CustomTextWidget("Order", textColor: context.appTheme.secondary, fontWeight: FontWeight.w600),
          bottom:  TabBar(
            indicatorColor: Colors.green, // Line color under active tab
            labelColor: Colors.green,
            unselectedLabelColor: Colors.black,
            dividerColor: context.appTheme.secondary,
            tabs: const [
              Tab(text: 'SELLER'),
              Tab(text: 'BUYER'),
            ],
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            // Seller Tab Content
            SellerTab(),
            // Buyer Tab Content
            BuyerTab(),
          ],
        ),
      ),
    );
  }
}
class BuyerTab extends StatelessWidget {
  const BuyerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined, // Shopping bag icon similar to the image
            size: 100,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 20),
          const Text(
            "You don't have any active orders (yet)!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Browse the Catalog and place your first order!",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
         AuthMainButton(onPressed: (){},backgroundColor: Colors.green,title: "Go to Catalog",)
        ],
      ),
    );
  }
}
class SellerTab extends StatelessWidget {
  const SellerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined, // Shopping bag icon similar to the image
            size: 100,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 20),
          const Text(
            "You don't have any active orders (yet)!",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "Create your first kwork to start selling",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
         AuthMainButton(
           backgroundColor: Colors.green,
           onPressed: (){},
           title: "Create a kwork",
         )
        ],
      ),
    );
  }
}
