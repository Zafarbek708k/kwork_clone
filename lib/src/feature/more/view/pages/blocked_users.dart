
import "package:kwork_clone/src/core/constants/all_library.dart";


class BlockedUsers extends StatefulWidget {
  const BlockedUsers({super.key});

  @override
  State<BlockedUsers> createState() => _BlockedUsersState();
}

class _BlockedUsersState extends State<BlockedUsers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(color: context.appTheme.secondary, Icons.arrow_back)),
        title: CustomTextWidget("Blocked Users", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: Colors.grey.shade400),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: CustomTextWidget("You haven't blocked anyone. Yay!", textColor: context.appTheme.primary),
          ),
        ),
      ),
    );
  }
}
