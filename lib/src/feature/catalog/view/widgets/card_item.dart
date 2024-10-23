
import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/cupertino.dart";
import "package:kwork_clone/src/core/constants/all_library.dart";

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
        color: context.appTheme.primary,
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
                imageUrl: imageUrl,
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
