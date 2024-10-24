import "package:flutter/cupertino.dart";
import "package:kwork_clone/src/core/constants/all_library.dart";

class TransactionHistory extends StatefulWidget {
  const TransactionHistory({super.key});

  @override
  State<TransactionHistory> createState() => _TransactionHistoryState();
}

class _TransactionHistoryState extends State<TransactionHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: context.appTheme.primary,
        leading: IconButton(onPressed: () => context.pop(), icon: const Icon(color: Colors.blue, Icons.arrow_back_ios, size: 24)),
        title: CustomTextWidget("KWork Transaction", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold, fontSize: 24),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.language,
                color: Colors.blue,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget("Cash Flow", textColor: context.appTheme.secondary, fontSize: 30, fontWeight: FontWeight.bold),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: REdgeInsets.all(4),
              decoration: BoxDecoration(color: CupertinoColors.white, borderRadius: BorderRadius.circular(4)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomTextWidget("0\$", textColor: context.appTheme.secondary, fontSize: 30, fontWeight: FontWeight.bold),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 2)),
                          child: Padding(
                            padding: REdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                            child: const CustomTextWidget("withdraw founds", textColor: Colors.green, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Divider(),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
