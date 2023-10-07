import 'package:flutter/material.dart';
import 'package:poc_mvvm_provider/view_model/theme_changer.dart';
import 'package:provider/provider.dart';
import '../res/components/alert_dialog_two_button.dart';
import '../utils/routes/route_name.dart';
import '../view_model/user_view_model.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeChanger = Provider.of<ThemeChanger>(context);
    final userPrefernece = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          ListTile(
              title: Text('DarK Mode'),
              trailing: Switch(
                // This bool value toggles the switch.
                value: themeChanger.isDarkMode,
                activeColor: Colors.black,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  themeChanger.isDarkMode
                      ? themeChanger.setThemeMode(ThemeMode.light)
                      : themeChanger.setThemeMode(ThemeMode.dark);
                  themeChanger.setIsDarkMode(value);
                },
              )),
          ListTile(
            title: Text('SignOut'),
            onTap: () => {
              showDialog(
                barrierColor: Colors.black26,
                context: context,
                builder: (context) {
                  return CustomAlertDialogWithTwoButton(
                    title: "Alert",
                    description: "Are you sure you want to SignOut?",
                    secondButtonTitle: 'SignOut',
                    onPress: () => {
                      userPrefernece.remove().then((value) {
                        Navigator.pushNamed(context, RouteName.login);
                      }),
                      Navigator.of(context).pop()
                    },
                  );
                },
              )
            },
          ),
        ],
      ),
    );
  }
}
