import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:watamuki/src/App.dart';
import 'package:watamuki/src/config/firebase/firebase.dart';
import 'package:watamuki/src/presentation/widgets/atoms/button.dart';
import 'package:watamuki/src/presentation/widgets/atoms/text_input.dart';
import 'package:watamuki/src/presentation/widgets/molecules/page_header.dart';

class LoginPage extends StatelessWidget {
  static const routeName = 'login';

  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => App.dismissKeyboard(),
      child: Scaffold(
        appBar: const PageHeader(),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: FormBuilder(
            key: _formKey,
            child: SingleChildScrollView(
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
                  TextInput(
                    name: 'email',
                    required: true,
                    onChanged: (_) {
                      _formKey.currentState?.fields['email']?.validate();
                    },
                    labelText: "Email address/Mobile number",
                    hintText: "Enter your email address/phone number",
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.email(context),
                      FormBuilderValidators.max(context, 50),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  TextInput(
                    name: "password",
                    required: true,
                    obscureText: true,
                    labelText: "Password",
                    // maxLength: context.locale.toString() == 'ja_JP' ? 11 : 10,
                    // showCounter: false,
                    onChanged: (_) {
                      _formKey.currentState?.fields['password']?.validate();
                    },
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.minLength(context, 8),
                    ]),
                  ),
                  const SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text: tr(
                              "Forgot your password ? Reset from ",
                            ),
                            style: Theme.of(context).textTheme.subtitle2),
                        TextSpan(
                          text: tr(
                            "here",
                          ),
                          style:
                              Theme.of(context).textTheme.subtitle1?.copyWith(
                                    color: Theme.of(context).primaryColor,
                                    decoration: TextDecoration.underline,
                                  ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print("here link");
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Button(
                    onPressed: () {
                      App.dismissKeyboard();
                      if (_formKey.currentState?.validate() == true) {
                        _formKey.currentState?.save();
                        firebaseAuth
                            .signInWithEmailAndPassword(
                          email: _formKey.currentState?.value['email'],
                          password: _formKey.currentState?.value['password'],
                        )
                            .then(
                          (value) {
                            Navigator.pop(context);
                          },
                          onError: (v) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("content")));
                          },
                        );
                      }
                    },
                    label: tr("Login"),
                  ),
                  const SizedBox(height: 20),
                  Button(
                    label: tr("I don’t have an account. Register"),
                    type: ButtonType.outlined,
                    onPressed: () {},
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
