import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/routes/app_route_name.dart';

import '../../../../core/widgets/text_widget.dart';
import '../../../catalog/view/widgets/category_detail_item.dart';

class Viewed extends StatefulWidget {
  const Viewed({super.key});

  @override
  State<Viewed> createState() => _ViewedState();
}

class _ViewedState extends State<Viewed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(color: context.appTheme.secondary, Icons.arrow_back)),
        title: CustomTextWidget("Recently Viewed", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: ListView(
          children: [
            ...List.generate(
              5,
              (index) {
                final item = viewList[index];
                return CategoryDetailItem(
                  onPressed: ()=> context.push("${AppRouteName.more}/${AppRouteName.viewed}/${AppRouteName.catalogItemInfo}"),
                  title: item['title'],
                  price: item['price'],
                  author: item['author'],
                  imageUrl: item['imageUrl'],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> viewList = [
  {
    "title": "Frontend Development",
    "price": "50",
    "author": "Mike Kevin",
    "imageUrl": "https://i.pinimg.com/564x/b3/2b/bc/b32bbce2eeb6dababc76a583eeff25cf.jpg",
  },
  {
    "title": "Backend Development",
    "price": "75",
    "author": "Sarah Johnson",
    "imageUrl": "https://i.pinimg.com/564x/5e/46/7f/5e467f9863e222dbc912ccdbf94c2ea0.jpg",
  },
  {
    "title": "Full-Stack Development",
    "price": "100",
    "author": "James Brown",
    "imageUrl": "https://i.pinimg.com/564x/85/70/3b/85703bdb4b0dfdbed337acb6432c2fd2.jpg",
  },
  {
    "title": "Mobile App Development",
    "price": "120",
    "author": "Olivia Davis",
    "imageUrl": "https://i.pinimg.com/736x/93/83/59/938359e19ab1532ba2b52e8e3d4820e3.jpg",
  },
  {
    "title": "UI/UX Design",
    "price": "90",
    "author": "John Smith",
    "imageUrl": "https://i.pinimg.com/enabled_hi/564x/82/7f/8c/827f8c8170a5842d2560da75249117af.jpg",
  },
  {
    "title": "Data Science",
    "price": "110",
    "author": "Sophia Lee",
    "imageUrl": "https://i.pinimg.com/564x/8d/2c/a1/8d2ca1ef44cfd9c5699c5e0f07ff0f75.jpg",
  },
  {
    "title": "Machine Learning",
    "price": "150",
    "author": "Alexander White",
    "imageUrl": "https://i.pinimg.com/564x/ef/36/74/ef3674092e00442f9c6cbb2aafbb69be.jpg",
  },
  {
    "title": "Artificial Intelligence",
    "price": "200",
    "author": "Emily Clark",
    "imageUrl": "https://i.pinimg.com/564x/c5/3e/e0/c53ee081252602c320c5493822002708.jpg",
  },
  {
    "title": "Cloud Computing",
    "price": "130",
    "author": "David Wilson",
    "imageUrl": "https://i.pinimg.com/enabled_hi/236x/fc/d8/31/fcd8310354601ee5a6f161324cee0ada.jpg",
  },
  {
    "title": "Cybersecurity",
    "price": "140",
    "author": "Isabella Martinez",
    "imageUrl": "https://i.pinimg.com/736x/7b/20/d5/7b20d5c6cadab61670a2d915263a6b00.jpg",
  }
];
