import 'package:easy_localization/easy_localization.dart'
    show tr, BuildContextEasyLocalizationExtension;
import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart'
    show FormBuilder, FormBuilderState;
import 'package:form_builder_validators/form_builder_validators.dart'
    show FormBuilderValidators;

import '../../app.dart';
import '../../config/firebase/auth.dart';
import '../../config/themes/colors.dart';
import '../../widgets/atoms/button.dart';
import '../../widgets/atoms/text_input.dart';
import '../../widgets/molecules/page_header.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = "login";
  final formKey = GlobalKey<FormBuilderState>();

  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPhone = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => App.dismissKeyboard(),
      child: Scaffold(
        appBar: const PageHeader(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  tr("Login"),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: 24),
                FormBuilder(
                  key: widget.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: <Widget>[
                      TextInput(
                        name: isPhone ? "phone" : "email",
                        label: tr("Email address/Mobile number"),
                        hintText: tr("Enter your email address/phone number"),
                        required: true,
                        maxLength: isPhone
                            ? (context.locale.toString() == "ja" ? 11 : 10)
                            : 50,
                        showCounter: false,
                        onChanged: (value) {
                          var _value = int.tryParse(value!);
                          setState(() {
                            isPhone = _value != null;
                          });

                          if (_value == null) {
                            widget.formKey.currentState!.fields.remove("phone");
                            return;
                          }
                          widget.formKey.currentState!.fields.remove("email");
                        },
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: tr("Required")),
                          !isPhone
                              ? FormBuilderValidators.email(
                                  errorText: tr("Email must be a valid Email"))
                              : FormBuilderValidators.minLength(10,
                                  errorText:
                                      tr('Phone must contain 10 numbers')),
                        ]),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      TextInput(
                        name: "password",
                        label: tr("Password"),
                        hintText: tr("Enter your password"),
                        required: true,
                        obscureText: true,
                        validator: FormBuilderValidators.required(
                            errorText: tr("Required")),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: tr(
                            "Forgot your password ? Reset from ",
                          ),
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              ?.copyWith(color: AppColors.greyDark)),
                      TextSpan(
                        text: tr(
                          "here",
                        ),
                        style: Theme.of(context).textTheme.subtitle2?.copyWith(
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
                const SizedBox(
                  height: 24,
                ),
                Button(
                  onPressed: () {
                    App.dismissKeyboard();
                    if (widget.formKey.currentState!.validate()) {
                      widget.formKey.currentState!.save();
                      firebaseAuth
                          .signInWithEmailAndPassword(
                        email: widget.formKey.currentState?.value['email'],
                        password:
                            widget.formKey.currentState?.value['password'],
                      )
                          .then(
                        (value) {
                          Navigator.pop(context);
                        },
                        onError: (v) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(v.toString())));
                        },
                      );
                    }
                  },
                  label: tr("Login"),
                  type: ButtonType.filled,
                ),
                const SizedBox(
                  height: 24,
                ),
                Button(
                  onPressed: () => {},
                  label: tr("I don’t have an account. Register"),
                  type: ButtonType.outlined,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
