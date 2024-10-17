import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kwork_clone/src/core/constants/context_extension.dart';
import 'package:kwork_clone/src/feature/catalog/view/widgets/text_field.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        leading: IconButton(onPressed: ()=> context.pop(), icon: Icon(Icons.arrow_back, color: context.appTheme.secondary)),
        title: TF(controller: searchCtr, hintText: "Search"),
      ),
    );
  }
}
