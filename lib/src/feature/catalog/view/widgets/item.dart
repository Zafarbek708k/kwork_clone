
import "package:kwork_clone/src/core/constants/all_library.dart";

class ItemWidget extends StatefulWidget {
  const ItemWidget({super.key, required this.model});

  final KWorkModel model;

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 4, vertical: 6),
      child: Container(
        height: 500,
        width: 120,
        decoration: BoxDecoration(
          color: Colors.grey.shade200.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 160, // 20% of screen height
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://i.pinimg.com/enabled_hi/564x/35/75/a3/3575a3456a68e669e7268e3aee4be73e.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                CustomTextWidget(
                  "* ${widget.model.author}",
                  textColor: context.appTheme.secondary,
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  icon: selected ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_border),
                ),
              ],
            ),
            CustomTextWidget(
              widget.model.title,
              textColor: context.appTheme.secondary,
              fontSize: 14, // Font size relative to screen width
            ),
            const Row(
              children: [
                Icon(Icons.star, color: Colors.deepOrange),
                CustomTextWidget("5.0", textColor: Colors.deepOrange),
                CustomTextWidget("(458)", textColor: Colors.grey),
                Spacer(),
                CustomTextWidget("\$30", textColor: Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
