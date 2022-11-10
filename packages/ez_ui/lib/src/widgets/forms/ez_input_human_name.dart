import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EzInputHumanName extends StatelessWidget {
  final String label;
  final String name;
  final String? initialValue;
  final bool required;
  final String autofillHints;
  const EzInputHumanName(
      {Key? key,
      required this.label,
      required this.name,
      this.initialValue,
      this.required = false,
      this.autofillHints = AutofillHints.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      key: Key(name),
      validator: FormBuilderValidators.compose([
        if (required) FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(
            (autofillHints == AutofillHints.name) ? 70 : 35),
        FormBuilderValidators.match('^[a-zA-Z ]*\$',
            errorText: 'Invalid $label'),
      ]),
      name: name,
      keyboardType: TextInputType.name,
      initialValue: initialValue,
      maxLength: 70,
      autofillHints: [autofillHints],
      decoration: InputDecoration(labelText: label, counterText: ""),
    );
  }
}
