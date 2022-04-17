import 'package:easy_localization/easy_localization.dart' show tr;
import 'package:flutter/material.dart'
    show
        BuildContext,
        DefaultTabController,
        FormFieldState,
        Key,
        StatelessWidget,
        Widget;
import 'package:flutter_form_builder/flutter_form_builder.dart'
    show FormBuilderField;
import 'package:form_builder_validators/form_builder_validators.dart'
    show FormBuilderValidators;

import '../../models/optionItem/index.dart';
import '../atoms/input_field.dart';
import 'app_tab_bar.dart';

class GenderTab extends StatelessWidget {
  const GenderTab({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputField(
      label: tr("Gender"),
      required: true,
      child: DefaultTabController(
        length: 3,
        initialIndex: 2,
        child: FormBuilderField(
          name: "gender",
          initialValue: "other",
          validator: FormBuilderValidators.required(errorText: tr("Required")),
          builder: (FormFieldState<dynamic> field) {
            return AppTabBar(
              onSelected: (item) => field.didChange(item.value),
              options: [
                OptionItem(title: tr("Male"), value: "male"),
                OptionItem(title: tr("Female"), value: "female"),
                OptionItem(title: tr("Others"), value: "other"),
              ],
            );
          },
        ),
      ),
    );
  }
}
