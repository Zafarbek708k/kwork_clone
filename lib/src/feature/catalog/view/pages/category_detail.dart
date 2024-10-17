import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/core/widgets/text_widget.dart';
import '../widgets/category_detail_item.dart';
import '../widgets/text_field.dart';

class CategoryDetail extends StatefulWidget {
  const CategoryDetail({super.key});

  @override
  State<CategoryDetail> createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {

  List <String> categoryDetailItem = ["Virtual Assistant","Financial Consulting", "Call Center", "Legal Consulting", "Logo Design", "infographics",
    "Brand Identity",  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title:  CustomTextWidget("Category Detail", textColor: context.appTheme.secondary),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          ),
        ],
      ),
      body: ListView(
        children: [

          ...List.generate(categoryDetailItem.length, (index){
            return ListTile(
              title: CustomTextWidget(categoryDetailItem[index], textColor: context.appTheme.secondary,fontWeight: FontWeight.w400,fontSize: 16),
              trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios)),
            );
          },)
        ],
      ),
    );
  }
}