import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/routes/app_route_name.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';
import 'package:kwork_clone/src/feature/auth/view/widgets/auth_main_textfield.dart';
import 'package:kwork_clone/src/feature/catalog/view/widgets/text_field.dart';
import '../widgets/card_item.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  late final ScrollController nestedController;
  double top = 0;

  @override
  void initState() {
    nestedController = ScrollController()
      ..addListener(() {
        if (nestedController.position.pixels > 25) {
          top = nestedController.position.pixels;
          setState(() {});
        } else {
          top = nestedController.position.pixels;
          setState(() {});
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorRes.white,
      body: NestedScrollView(
        controller: nestedController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              elevation: 0,
              surfaceTintColor: Colors.yellowAccent.withOpacity(0.5),
              backgroundColor: Colors.grey,
              automaticallyImplyLeading: true,
              centerTitle: false,
              iconTheme: const IconThemeData(color: Colors.black),
             
              title: top > 25
                  ? const SizedBox.shrink()
                  : const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Image(
                  width: 110,
                  image: AssetImage("assets/images/database.png")
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(
                  left: top > 88 ? 72 : 32,
                  top: 0,
                  right: 32,
                  bottom: 0,
                ),
                title: Column(
                  children: [
                    const Spacer(),
                    SizedBox(
                      height: 35,
                      child: top > 25 ? null :  TF(controller: TextEditingController()),
                    ),
                    const SizedBox(height: 12),

                  ],
                ),
              ),
              expandedHeight: 170,
              titleSpacing: 0,
              floating: false,
              snap: false,
              pinned: true,
              actions: [
                // SvgPicture.asset(KTIcons.userLogin),
                // Padding(
                //   padding: const EdgeInsets.only(left: 8, right: 16),
                //   child: SvgPicture.asset(KTIcons.menuHamburger),
                // ),
              ],
            ),
          ];
        },
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Text(
                        "Gov’t planning to restrict movement "
                            "of cars that do not meet Euro-5 standard",
                      ),
                      Text(
                        "It is proposed to gradually "
                            "limit the use of cars that do not "
                            "meet the Euro-5 standard in 14 cities "
                            "of Uzbekistan until 2030. Also, from March 1, ...",
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [

                          const SizedBox(width: 5),
                          Expanded(
                            child: Text(
                              "Nike.com › air-force-1-shoes-5sj3yzy7ok",
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.red,
                            height: 35,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.visibility_outlined,
                                  color: Colors.black,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "12 225",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          MaterialButton(
                            onPressed: () {},
                            color: Colors.red,
                            height: 35,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: const Text(
                              "10 hours ago",
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}














// class Catalog extends StatefulWidget {
//   const Catalog({super.key});
//
//   @override
//   State<Catalog> createState() => _CatalogState();
// }
//
// class _CatalogState extends State<Catalog> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               expandedHeight: 220.0,
//               floating: false,
//               pinned: true,
//               flexibleSpace: LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//                   var appBarHeight = constraints.biggest.height;
//                   var isExpanded = appBarHeight > kToolbarHeight + 30;
//
//                   return FlexibleSpaceBar(
//                     centerTitle: true,
//                     titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                     title: !isExpanded
//                         ? Column(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               // Centered TextField when SliverAppBar is expanded
//                               Container(
//                                 height: 40,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(8),
//                                   boxShadow: const [
//                                     BoxShadow(
//                                       color: Colors.black12,
//                                       blurRadius: 5,
//                                     ),
//                                   ],
//                                 ),
//                                 child: AuthMainTextField(controller: TextEditingController()),
//                               ),
//                             ],
//                           )
//                         : Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               // TextField and IconButton when SliverAppBar is collapsed
//                               Expanded(
//                                 flex: 3,
//                                 child: SizedBox(
//                                   height: 40,
//                                   child: AuthMainTextField(controller: TextEditingController()),
//                                 ),
//                               ),
//                               Expanded(
//                                 flex: 1,
//                                 child: IconButton(
//                                   onPressed: () => context.push("${AppRouteName.catalog}/${AppRouteName.favorite}"),
//                                   icon: const Icon(Icons.favorite_border, color: Colors.red),
//                                 ),
//                               ),
//                             ],
//                           ),
//                     background: Stack(
//                       fit: StackFit.expand,
//                       children: [
//                         Container(
//                           color: Colors.black45, // Apply a dark overlay to the background
//                         ),
//                         const Center(
//                           child: CustomTextWidget(
//                             "What freelance service\n are you looking for?",
//                             fontSize: 22,
//                             fontWeight: FontWeight.bold,
//                             textAlign: TextAlign.center,
//                             textColor: Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ];
//         },
//         body: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header for the content section
//               // Horizontal scrollable list 1 - section
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: CustomTextWidget(
//                   "Development & IT",
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   textColor: context.appTheme.secondary,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0, top: 5),
//                 child: CustomTextWidget(
//                   "DANGER! High risk of genius coders, developers, and programmers.",
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14,
//                   textColor: context.appTheme.secondary,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 height: 220,
//                 child: ListView.builder(
//                   itemCount: items.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     Item item = items[index];
//                     return CardItem(
//                       imageUrl: item.imageUrl,
//                       title: item.title,
//                       countKWork: item.countKWorks,
//                       onPressed: () {
//                         context.push("${AppRouteName.catalog}/${AppRouteName.catalogDetail}");
//                       },
//                     );
//                   },
//                 ),
//               ),
//
//               // Horizontal scrollable list 2 - section
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: CustomTextWidget(
//                   "Digital Marketing & SMM",
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   textColor: context.appTheme.secondary,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0, top: 5),
//                 child: CustomTextWidget(
//                   "When you have KWork, new clients are always in season ",
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14,
//                   textColor: context.appTheme.secondary,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 height: 220,
//                 child: ListView.builder(
//                   itemCount: items.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     Item item = items[index];
//                     return CardItem(
//                       imageUrl: item.imageUrl,
//                       title: item.title,
//                       countKWork: item.countKWorks,
//                       onPressed: () {
//                         context.push("${AppRouteName.catalog}/${AppRouteName.catalogDetail}");
//                       },
//                     );
//                   },
//                 ),
//               ),
//
//               // Header for the content section
//               // Horizontal scrollable list 3 - section
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0),
//                 child: CustomTextWidget(
//                   "Seo & Web Traffic",
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,
//                   textColor: context.appTheme.secondary,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0, top: 5),
//                 child: CustomTextWidget(
//                   "Current stop: KWork Station. Next stop: top of Google.",
//                   fontWeight: FontWeight.w400,
//                   fontSize: 14,
//                   textColor: context.appTheme.secondary,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               SizedBox(
//                 height: 220,
//                 child: ListView.builder(
//                   itemCount: items.length,
//                   scrollDirection: Axis.horizontal,
//                   itemBuilder: (context, index) {
//                     Item item = items[index];
//                     return CardItem(
//                       imageUrl: item.imageUrl,
//                       title: item.title,
//                       countKWork: item.countKWorks,
//                       onPressed: () {
//                         context.push("${AppRouteName.catalog}/${AppRouteName.catalogDetail}");
//                       },
//                     );
//                   },
//                 ),
//               ),
//
//               // Horizontal scrollable list 4 - section
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0, top: 5),
//                 child: CustomTextWidget(
//                   "Catalog Categories",
//                   fontWeight: FontWeight.w600,
//                   fontSize: 20,
//                   textColor: context.appTheme.secondary,
//                 ),
//               ),
//               const SizedBox(height: 5),
//               ...List.generate(
//                 mainCategories.length,
//                 (index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 8.0),
//                     child: InkWell(
//                       onTap: () {
//                         context.push("${AppRouteName.catalog}/${AppRouteName.categoryDetail}");
//                       },
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(border: Border(bottom: BorderSide(color: context.appTheme.primary))),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 5.0),
//                           child: Row(
//                             children: [
//                               const SizedBox(width: 5),
//                               CircleAvatar(
//                                 radius: 35,
//                                 backgroundColor: mainCategories[index]['color'],
//                                 child: Icon(mainCategories[index]['icon'], color: Colors.white, size: 35),
//                               ),
//                               const SizedBox(width: 10),
//                               CustomTextWidget(mainCategories[index]['text'], textColor: context.appTheme.secondary),
//                               const Spacer(),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//
//               // Horizontal scrollable list 5 - section
//               const SizedBox(height: 16),
//               Padding(
//                 padding: const EdgeInsets.only(left: 8.0, top: 5),
//                 child: CustomTextWidget('Popular services', fontWeight: FontWeight.w600, fontSize: 20, textColor: context.appTheme.secondary),
//               ),
//               ...List.generate(
//                 popularServices.length,
//                 (index) {
//                   return DecoratedBox(
//                     decoration: BoxDecoration(
//                         border: Border(bottom: popularServices.length - 1 != index ? BorderSide(color: context.appTheme.primary) : BorderSide.none)),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: ListTile(
//                         onLongPress: () {},
//                         title: CustomTextWidget(popularServices[index], textColor: context.appTheme.secondary),
//                         trailing: popularServices.length - 1 != index
//                             ? Icon(Icons.arrow_forward_ios, color: context.appTheme.secondary)
//                             : Icon(Icons.search, color: context.appTheme.secondary),
//                         onTap: () {
//                           context.push("${AppRouteName.catalog}/${AppRouteName.catalogDetail}");
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 5)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

final List<Map<String, dynamic>> mainCategories = [
  {"icon": Icons.edit, "text": "Design", "color": Colors.deepOrangeAccent},
  {"icon": Icons.code_off, "text": "Development & IT", "color": Colors.blueAccent},
  {"icon": Icons.public, "text": "SEO & Web Traffic", "color": Colors.green},
  {"icon": Icons.trending_up, "text": "Digital Marketing & SMM", "color": Colors.pink},
  {"icon": Icons.audiotrack, "text": "Audio & Video", "color": Colors.orange},
  {"icon": Icons.business, "text": "Business & Lifestyle", "color": Colors.blue},
];
final List<String> popularServices = [
  "Mobile Apps",
  "Digital Games",
  "IT Support",
  "Backlinks",
  "Social Media & SMM",
  "Website Promotion to Top",
  "Web Traffic",
  "Ads & PR",
  "Website Development",
  "Website Revision & Maintenance",
  "Search & Display Marketing",
  "Email & SMS Marketing",
  "Search for more services"
];

List<Item> items = [
  Item(title: "HTML Service", countKWorks: "978 KWorks", imageUrl: "https://i.pinimg.com/236x/83/a4/0d/83a40d2c63506a78a78c2a8258b0cee5.jpg"),
  Item(
      title: "Website Revision & Maintenance",
      countKWorks: "469 KWorks",
      imageUrl: "https://i.pinimg.com/236x/da/a5/5a/daa55aa9d785a642ddef39171bfbaf79.jpg"),
  Item(title: "Website Development", countKWorks: "657 KWorks", imageUrl: "https://i.pinimg.com/236x/42/1c/92/421c92262ee1a228c21d517a104d3e40.jpg"),
  Item(title: "Scripts & Parsers", countKWorks: "951 KWorks", imageUrl: "https://i.pinimg.com/236x/dc/21/a0/dc21a0266d7fe23407339fc03cf76f0d.jpg"),
  Item(title: "Usability & QA", countKWorks: "658 KWorks", imageUrl: "https://i.pinimg.com/236x/83/a4/0d/83a40d2c63506a78a78c2a8258b0cee5.jpg"),
  Item(title: "Mobile Apps", countKWorks: "1459 KWorks", imageUrl: "https://i.pinimg.com/236x/da/a5/5a/daa55aa9d785a642ddef39171bfbaf79.jpg"),
  Item(title: "Desktop Programming", countKWorks: "697 KWorks", imageUrl: "https://i.pinimg.com/236x/83/a4/0d/83a40d2c63506a78a78c2a8258b0cee5.jpg"),
  Item(title: "Digital Games", countKWorks: "258 KWorks", imageUrl: "https://i.pinimg.com/236x/1f/87/b2/1f87b29a2df46100a75aa86b170a21cb.jpg"),
  Item(
      title: "System Administration", countKWorks: "848 KWorks", imageUrl: "https://i.pinimg.com/236x/42/1c/92/421c92262ee1a228c21d517a104d3e40.jpg"),
  Item(title: "Chatbots", countKWorks: "539 KWorks", imageUrl: "https://i.pinimg.com/236x/d1/41/1f/d1411f09e022300b20134a37536c2059.jpg"),
  Item(title: "Domain & Hosting", countKWorks: "432 KWorks", imageUrl: "https://i.pinimg.com/236x/da/a5/5a/daa55aa9d785a642ddef39171bfbaf79.jpg"),
  Item(title: "IT Support", countKWorks: "539 KWorks", imageUrl: "https://i.pinimg.com/564x/a1/a9/b3/a1a9b32cdd174f2ac4536ffe05cb03d2.jpg"),
];

class Item {
  String title, countKWorks, imageUrl;

  Item({required this.title, required this.countKWorks, required this.imageUrl});
}
