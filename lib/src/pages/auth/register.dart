import 'package:easy_localization/easy_localization.dart' show tr;
import 'package:flutter/gestures.dart' show TapGestureRecognizer;
import 'package:flutter/material.dart'
    show
        AutovalidateMode,
        BorderSide,
        BuildContext,
        Column,
        CrossAxisAlignment,
        DropdownMenuItem,
        EdgeInsets,
        GestureDetector,
        GlobalKey,
        InputDecoration,
        Key,
        Navigator,
        OutlineInputBorder,
        RichText,
        SafeArea,
        Scaffold,
        SingleChildScrollView,
        SizedBox,
        StatelessWidget,
        Text,
        TextAlign,
        TextDecoration,
        TextInputType,
        TextSpan,
        Theme,
        Widget;
import 'package:flutter_form_builder/flutter_form_builder.dart'
    show
        FormBuilder,
        FormBuilderCheckbox,
        FormBuilderFieldOption,
        FormBuilderRadioGroup,
        FormBuilderState;
import 'package:form_builder_validators/form_builder_validators.dart'
    show FormBuilderValidators;

import '../../app.dart';
import '../../config/themes/colors.dart';
import '../../core/utils/constants.dart';
import '../../widgets/atoms/button.dart';
import '../../widgets/atoms/drop_down.dart';
import '../../widgets/atoms/input_field.dart';
import '../../widgets/atoms/text_input.dart';
import '../../widgets/molecules/gender_tab.dart';
import '../../widgets/molecules/page_header.dart';
import 'login.dart';

class RegisterPage extends StatelessWidget {
  static const String routeName = "register";
  final formKey = GlobalKey<FormBuilderState>();

  RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => App.dismissKeyboard(),
      child: Scaffold(
        appBar: const PageHeader(),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  tr("Member registration"),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: 24),
                FormBuilder(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      TextInput(
                        name: "nick_name",
                        label: tr("NickName"),
                        hintText: tr("Enter your Nickname"),
                        required: true,
                        validator: FormBuilderValidators.required(
                            errorText: tr("Required")),
                      ),
                      const SizedBox(height: 24),
                      DropDown(
                        name: "age",
                        items: ages.map((e) {
                          return DropdownMenuItem(
                            child: Text(e.title),
                            value: e.value,
                          );
                        }).toList(),
                        label: tr("Age"),
                        hintText: tr("Enter your age"),
                        required: true,
                        validator: FormBuilderValidators.required(
                            errorText: tr("Required")),
                      ),
                      const SizedBox(height: 24),
                      const GenderTab(),
                      const SizedBox(height: 24),
                      TextInput(
                        name: "phone",
                        label: tr("Phone"),
                        maxLength: 11,
                        showCounter: false,
                        keyboardType: TextInputType.phone,
                        hintText: "090-1234-5678",
                        required: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: tr("Required")),
                          FormBuilderValidators.minLength(10,
                              errorText: tr('Phone must contain 10 numbers'))
                        ]),
                      ),
                      const SizedBox(height: 24),
                      TextInput(
                        name: "email",
                        label: tr("Email address"),
                        keyboardType: TextInputType.emailAddress,
                        hintText: tr("Enter your email address"),
                        required: true,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: tr("Required")),
                          FormBuilderValidators.email(
                              errorText: tr("Email must be a valid Email"))
                        ]),
                      ),
                      const SizedBox(height: 24),
                      InputField(
                        label: tr("Living/ Work/ Others in Hino town"),
                        required: true,
                        child: FormBuilderRadioGroup(
                          name: "resident_status",
                          initialValue: "living",
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            disabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                          ),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(
                                errorText: tr("Required")),
                          ]),
                          options: [
                            FormBuilderFieldOption(
                              value: "living",
                              child: Text(tr("Living")),
                            ),
                            FormBuilderFieldOption(
                              value: "working",
                              child: Text(tr("Working")),
                            ),
                            FormBuilderFieldOption(
                              value: "others",
                              child: Text(tr("Others")),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextInput(
                        name: "password",
                        label: tr("Password"),
                        hintText: tr("Enter your password"),
                        required: true,
                        obscureText: true,
                        validator: FormBuilderValidators.required(
                            errorText: tr("Required")),
                      ),
                      // terms and agreements
                      FormBuilderCheckbox(
                        name: "agree",
                        validator: FormBuilderValidators.required(
                            errorText: tr("Required")),
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "利用規約",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("here link 1");
                                  },
                              ),
                              TextSpan(
                                  text: "と",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(color: AppColors.greyDark)),
                              TextSpan(
                                text: "個人情報保護方針",
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    ?.copyWith(
                                      color: Theme.of(context).primaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    print("here link 2");
                                  },
                              ),
                              TextSpan(
                                  text: "に同意する。",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(color: AppColors.greyDark)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Button(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                    }
                  },
                  label: tr("Send OTP"),
                ),
                const SizedBox(height: 24),
                Button(
                  type: ButtonType.outlined,
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LoginPage.routeName);
                  },
                  label: tr("I already have an account"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
