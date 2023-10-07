import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../model/user_model.dart';
import '../../view_model/user_view_model.dart';
import '../routes/route_name.dart';

class SplashServices {
  Future<UserModel> getUserDate() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      if (kDebugMode) {
        print(value.token.toString());
      }

      if (value.token.toString() == 'null' || value.token.toString() == '') {
        await Future.delayed(const Duration(seconds: 3));
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, RouteName.login);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        // ignore: use_build_context_synchronously
        Navigator.pushNamed(context, RouteName.main);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
