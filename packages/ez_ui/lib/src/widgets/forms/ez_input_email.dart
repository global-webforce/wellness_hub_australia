import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EzInputEmail extends StatelessWidget {
  final String? initialValue;
  final bool required;
  const EzInputEmail({
    Key? key,
    this.initialValue,
    this.required = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      key: const Key("email"),
      validator: FormBuilderValidators.compose([
        if (required) FormBuilderValidators.required(),
        FormBuilderValidators.maxLength(
          70,
        ),
        FormBuilderValidators.email(),
      ]),
      name: "email",
      keyboardType: TextInputType.emailAddress,
      initialValue: initialValue,
      maxLength: 70,
      autofillHints: const [AutofillHints.email],
      decoration: const InputDecoration(labelText: "Email"),
    );
  }
}
