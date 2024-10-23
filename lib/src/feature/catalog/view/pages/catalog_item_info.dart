import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/data/entity/kwork_model.dart';
import '../../../../core/widgets/text_widget.dart';
import '../../../more/view/widgets/expenddable_text_widget.dart';

class CatalogItemInfo extends StatefulWidget {
  const CatalogItemInfo({super.key});

  @override
  State<CatalogItemInfo> createState() => _CatalogItemInfoState();
}

class _CatalogItemInfoState extends State<CatalogItemInfo> {
  KWorkModel model = KWorkModel(
      profession: "profession", title: "title", description: "description", author: "author", basicPrice: 45, standardPrice: 65, premiumPrice: 85);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(color: context.appTheme.secondary, Icons.arrow_back)),
        title: CustomTextWidget(model.title, textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.share, color: Colors.blue, size: 25))],
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 220,
            child: DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("https://i.pinimg.com/enabled_hi/564x/e6/03/03/e603030f4b3c67c230be9c878bb25fd8.jpg"), fit: BoxFit.cover),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Card(
            margin: REdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_down, size: 40)),
              leading: const CircleAvatar(
                radius: 35,
                foregroundImage: NetworkImage("https://i.pinimg.com/enabled_hi/564x/8d/e8/02/8de8027a3ffd2d16d827d145ea1d1908.jpg"),
              ),
              title: CustomTextWidget(model.author, textColor: context.appTheme.secondary),
              subtitle: Row(
                children: [const Icon(Icons.star, color: Colors.deepOrangeAccent), CustomTextWidget("(111)", textColor: context.appTheme.secondary)],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: REdgeInsets.symmetric(horizontal: 10),
            margin: REdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade300.withOpacity(0.8)),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget("Delivery: 7 days", textColor: context.appTheme.secondary),
                    CustomTextWidget("In progress: 2", textColor: context.appTheme.secondary),
                  ],
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade100),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomTextWidget("108", textColor: context.appTheme.secondary),
                          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey.shade100),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextWidget(model.description, textColor: context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextWidget(model.description, textColor: context.appTheme.secondary, fontWeight: FontWeight.w400, fontSize: 16),
          ),
          CustomTextWidget("Cooperating with us you get:", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: MyExpandableRichText(
              text: "Cooperating with us you get: "
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam at nisi vel lacus consectetur tempor "
                  "nec at metus. Nullam diam elit, rutrum ut enim non, pharetra auctor quam. Nam convallis ornare orci, "
                  "in mollis justo condimentum et. "
                  "Proin justo nulla, ornare vel tempor id, semper ut urna. Maecenas rutrum consequat viverra. Vestibulum in enim dictum "
                  "tellus pellentesque vehicula. Integer non urna sit amet justo efficitur congue. Donec luctus ultrices sapien quis venenatis."
                  " Quisque luctus erat id varius dignissim. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac"
                  " turpis egestas. Aliquam erat volutpat. Vestibulum vehicula enim tortor, vitae pharetra mauris sollicitudin a. Duis non "
                  "mauris nisi. Donec sagittis metus eget magna semper vulputate.",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.orange, width: 2)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OverflowBar(
                  overflowAlignment: OverflowBarAlignment.start,
                  spacing: 15,
                  children: [
                    CustomTextWidget("Money-Back Guarantee\n", fontSize: 14, fontWeight: FontWeight.bold, textColor: context.appTheme.secondary),
                    CustomTextWidget("Your money is returned instantly if something goes wrong with your order",
                        fontSize: 12, fontWeight: FontWeight.w400, textColor: context.appTheme.secondary),
                    const CustomTextWidget("How does it work?",fontSize: 12, textColor: Colors.blue)
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

        ],
      ),
    );
  }
}

