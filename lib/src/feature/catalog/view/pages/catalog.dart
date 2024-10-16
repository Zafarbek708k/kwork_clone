import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';
import 'package:kwork_clone/src/feature/auth/view/widgets/auth_main_textfield.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 220.0,
              floating: false,
              pinned: true,
              flexibleSpace: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  var appBarHeight = constraints.biggest.height;
                  var isExpanded = appBarHeight > kToolbarHeight + 30;

                  return FlexibleSpaceBar(
                    centerTitle: true,
                    titlePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    title: isExpanded
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Centered TextField when SliverAppBar is expanded
                              Container(
                                height: 40,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: [
                                    const BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: AuthMainTextField(controller: TextEditingController()),
                              ),
                            ],
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // TextField and IconButton when SliverAppBar is collapsed
                              Expanded(
                                child: SizedBox(
                                  height: 40,
                                  child: AuthMainTextField(controller: TextEditingController()),
                                ),
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.favorite_border),
                              ),
                            ],
                          ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Container(
                          color: Colors.black45, // Apply a dark overlay to the background
                        ),
                        const Center(
                          child: CustomTextWidget(
                            "What freelance service\n are you looking for?",
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header for the content section
              CustomTextWidget(
                "Development & IT",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                textColor: context.appTheme.secondary,
              ),
              const SizedBox(height: 8),
              CustomTextWidget(
                "DANGER! High risk of genius coders, developers, and programmers.",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                textColor: context.appTheme.secondary,
              ),
              const SizedBox(height: 16),

              // Horizontal scrollable list
              SizedBox(
                height: 220,
                child: ListView.builder(
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    Item item = items[index];
                    return CardItem(
                      imageUrl: item.imageUrl,
                      title: item.title,
                      countKWork: item.countKWorks,
                      onPressed: (){},
                    );
                  },
                ),
              ),
              const SizedBox(height: 40),

              // Footer or additional content
              Center(
                child: CustomTextWidget(
                  "Explore more categories",
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  textColor: context.appTheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.title, required this.countKWork, this.onPressed, required this.imageUrl});
  final String title, countKWork, imageUrl;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) => CupertinoButton(
    onPressed: onPressed,
    child: Container(
      width: 160.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7.r,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: CachedNetworkImage(
                imageUrl: "https://i.pinimg.com/564x/a1/a9/b3/a1a9b32cdd174f2ac4536ffe05cb03d2.jpg",
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
              ),
            ),
          ),
          const Spacer(),
          Expanded(
            flex: 3,
            child: Padding(
              padding: REdgeInsets.only(top: 4, left: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                    title,
                    textColor: context.appTheme.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(height: 5),
                  CustomTextWidget(
                    countKWork,
                    textColor: context.appTheme.secondary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

List<Item> items = [
  Item(title: "HTML Service", countKWorks: "978 KWorks", imageUrl: "assets/images/database.png"),
  Item(title: "Website Revision & Maintenance", countKWorks: "469 KWorks", imageUrl: "assets/images/htmlService.png"),
  Item(title: "Website Development", countKWorks: "657 KWorks", imageUrl: "assets/images/socialMedia.png"),
  Item(title: "Scripts & Parsers", countKWorks: "951 KWorks", imageUrl: "assets/images/socialMedia.png"),
  Item(title: "Usability & QA", countKWorks: "658 KWorks", imageUrl: "assets/images/emailSending.png"),
  Item(title: "Mobile Apps", countKWorks: "1459 KWorks",imageUrl: "assets/images/emailSending.png"),
  Item(title: "Desktop Programming", countKWorks: "697 KWorks", imageUrl: "assets/images/emailSending.png"),
  Item(title: "Digital Games", countKWorks: "258 KWorks", imageUrl: "assets/images/emailSending.png"),
  Item(title: "System Administration", countKWorks: "848 KWorks",imageUrl: "assets/images/emailSending.png"),
  Item(title: "Chatbots", countKWorks: "539 KWorks",imageUrl: "assets/images/emailSending.png"),
  Item(title: "Domain & Hosting", countKWorks: "432 KWorks",imageUrl: "assets/images/emailSending.png"),
  Item(title: "It Support", countKWorks: "539 KWorks",imageUrl: "assets/images/emailSending.png"),
];

class Item{
  String title, countKWorks, imageUrl;
  Item({required this.title, required this.countKWorks, required this.imageUrl});
}