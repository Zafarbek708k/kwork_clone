
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:kwork_clone/src/core/constants/all_library.dart";

import "../widgets/text_field.dart";


class CatalogDetail extends StatefulWidget {
  const CatalogDetail({super.key});

  @override
  State<CatalogDetail> createState() => _CatalogDetailState();
}

class _CatalogDetailState extends State<CatalogDetail> {
  final TextEditingController ctr = TextEditingController();
  final List<String> items = ["All (798)", "Layout to HTML conversion(872)", "HTML Revision & Adaptation (106)", "HTML Revision (109)"];

  @override
  void dispose() {
    ctr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        title: SizedBox(height: 45, child: TF(controller: ctr)),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list_off_outlined)),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: context.appTheme.primary),
                  child: Center(
                    child: CustomTextWidget(items[index], textColor: context.appTheme.secondary),
                  ),
                );
              },
            ),
          ),
          ...List.generate(
            10,
                (index) {
              return  Padding(
                padding: REdgeInsets.symmetric(vertical: 8.0),
                child: CategoryDetailItem(
                  onPressed: (){

                  },
                  title: 'Front end development specialist HTML CSS',
                  price: '20',
                  author: "Author Name",
                  imageUrl: 'https://i.pinimg.com/564x/b3/2b/bc/b32bbce2eeb6dababc76a583eeff25cf.jpg',
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
