import 'package:flutter/material.dart';
import 'package:poc_mvvm_provider/utils/routes/route_name.dart';
import 'package:poc_mvvm_provider/utils/routes/routes.dart';
import 'package:poc_mvvm_provider/view_model/auth_view_model.dart';
import 'package:poc_mvvm_provider/view_model/favorite_view_model.dart';
import 'package:poc_mvvm_provider/view_model/home_view_model.dart';
import 'package:poc_mvvm_provider/view_model/theme_changer.dart';
import 'package:provider/provider.dart';

import 'view_model/user_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
          ChangeNotifierProvider(create: (_) => FavouiteViewModel()),
          ChangeNotifierProvider(create: (_) => ThemeChanger()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeChanger>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
              primarySwatch: Colors.red,
              brightness: Brightness.dark,
            ),
            initialRoute: RouteName.splash,
            onGenerateRoute: Routes.generateRoute,
          );
        }));
  }
}
