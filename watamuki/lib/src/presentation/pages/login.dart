import 'package:flutter/material.dart';
import 'package:watamuki/src/App.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';
import 'package:watamuki/src/presentation/widgets/molecules/page_header.dart';

class LoginPage extends StatefulWidget {
  static const routeName = 'login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => App.dismissKeyboard(),
      child: Scaffold(
        appBar: const PageHeader(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Member login",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                        // label: Text("Email"),
                        ),
                  ),
                  const SizedBox(height: 20),
                  Button(
                    onPressed: () {
                      App.dismissKeyboard();
/*
                      firebaseAuth
                          .signInWithEmailAndPassword(
                              email: "t.sawal231@gmail.com", password: "password")
                          .then((value) {
                        Navigator.pop(context);
                      }, onError: (v) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(content: Text("content")));
                      });
*/
                    },
                    label: "Login",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
