
import "package:kwork_clone/src/core/constants/all_library.dart";


class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.appTheme.primary,
      appBar: AppBar(
        backgroundColor: context.appTheme.primary,
        leading: IconButton(onPressed: () => context.pop(), icon: Icon(color: context.appTheme.secondary, Icons.arrow_back)),
        title: CustomTextWidget("Setting", textColor: context.appTheme.secondary, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          ...List.generate(
            titles.length,
            (index) {
              return ProfileItem(
                  title: titles[index], result: results[index], topLine: index == 0 ? true : false, bottomLine: true, onPressed: () {});
            },
          ),
          const SizedBox(height: 35),
          MaterialButton(
            onPressed: () {},
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                color: Colors.black
              )
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 22.0),
                  child: CustomTextWidget(
                    "Delete Account",
                    textColor: Colors.red,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

List<String> titles = ["Email", "UserName", "Phone", "Change Password", "App Language"];
List<String> results = ["mrkarimov***gmail.com", "UserName", "+9*558****", "", "English"];
