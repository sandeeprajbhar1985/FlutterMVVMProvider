import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poc_mvvm_provider/res/components/round_button.dart';
import 'package:poc_mvvm_provider/utils/utils.dart';
import 'package:provider/provider.dart';
import '../utils/routes/route_name.dart';
import '../view_model/auth_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final ValueNotifier<bool> _obsecure = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _obsecure.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewMode = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
        appBar: AppBar(
            title: const Text('Login'),
            centerTitle: true,
            automaticallyImplyLeading: false),
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                  hintText: 'Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.alternate_email)),
              onFieldSubmitted: (value) => {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode)
              },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecure,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: _passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: _obsecure.value,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                        hintText: 'password',
                        labelText: 'password',
                        suffixIcon: InkWell(
                          onTap: () => {_obsecure.value = !_obsecure.value},
                          child: Icon(_obsecure.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility),
                        ),
                        prefixIcon: const Icon(Icons.lock)),
                  );
                }),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
                title: 'Submit',
                loading: authViewMode.loading,
                onPress: () {
                  if (_emailController.text.isEmpty) {
                    Utils.flushBarErrorMessage('Please enter email', context);
                  } else if (_passwordController.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        'Please enter password', context);
                  } else if (_passwordController.text.length < 6) {
                    Utils.flushBarErrorMessage(
                        'Please enter 6 digit password', context);
                  } else {
                    Map data = {
                      'email': _emailController.text.toString(),
                      'password': _passwordController.text.toString(),
                    };

                    authViewMode.loginApi(data, context);
                    if (kDebugMode) {
                      print('api hit');
                    }
                  }
                }),
            SizedBox(
              height: height * .02,
            ),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteName.signUp);
                },
                child: const Text("Don't have an accont? Please Sign Up"))
          ],
        )));
  }
}
