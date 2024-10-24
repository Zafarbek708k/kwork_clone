
import "package:kwork_clone/src/core/constants/all_library.dart";


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        title: CustomTextWidget("Notification", textColor: context.appTheme.secondary, fontWeight: FontWeight.w600, fontSize: 20),
        bottom: PreferredSize(preferredSize: const Size(double.infinity, 2), child: Divider(color: context.appTheme.secondary)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            CustomTextWidget("Listen to the waves", textColor: context.appTheme.secondary, fontSize: 24, fontWeight: FontWeight.w500),
            CustomTextWidget("You don't have any notification", textColor: context.appTheme.secondary, fontSize: 12, fontWeight: FontWeight.w400),
            const Spacer(flex: 1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Image.asset("assets/images/beach.png"),
            ),
            const Spacer(flex: 3)
          ],
        ),
      ),
    );
  }
}
