
import "package:kwork_clone/src/core/constants/all_library.dart";

class CategoryDetailItem extends StatefulWidget {
  const CategoryDetailItem({super.key, required this.title, required this.author, required this.price, required this.imageUrl, this.onPressed});
  final String title, author;
  final String price;
  final String imageUrl;
  final VoidCallback? onPressed;

  @override
  State<CategoryDetailItem> createState() => _CategoryDetailItemState();
}

class _CategoryDetailItemState extends State<CategoryDetailItem> {
  bool isLike = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
        child: Container(
          height: 170,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2.0),
            color: context.appTheme.secondary.withOpacity(0.7),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.network(
                      widget.imageUrl,
                      width: 150,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16.0),
                  Expanded(
                    flex: 2,
                    child: CustomTextWidget(
                      widget.title,
                      fontWeight: FontWeight.w600,
                      fontSize: 12.0,
                      textColor: context.appTheme.primary,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: () {
                          setState(() {
                            isLike = !isLike;
                          });
                        }, icon: const Icon(Icons.favorite_border), color: isLike? Colors.red : context.appTheme.primary ),
                        const SizedBox(height: 40),
                        CustomTextWidget(
                          'From \$${widget.price}',
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          textColor: context.appTheme.primary,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(color: Colors.grey),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomTextWidget(widget.author, textColor: context.appTheme.primary,fontSize: 18,fontWeight: FontWeight.w500,),
              )
            ],
          ),
        ),
      ),
    );
  }
}


