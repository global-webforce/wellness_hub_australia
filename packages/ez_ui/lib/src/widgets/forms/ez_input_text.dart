import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EzInputText extends StatelessWidget {
  final String label;
  final String name;
  final String? initialValue;
  final String? helperText;
  final bool required;
  final Widget? prefixIcon;
  const EzInputText(
      {Key? key,
      required this.label,
      required this.name,
      this.initialValue,
      this.required = false,
      this.prefixIcon,
      this.helperText})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      autofillHints: const [AutofillHints.email],
      validator: FormBuilderValidators.compose([
        if (required) FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(100),
      ]),
      name: name,
      initialValue: initialValue,
      maxLength: 100,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          prefixIcon: prefixIcon, labelText: label, helperText: helperText),
    );
  }
}
