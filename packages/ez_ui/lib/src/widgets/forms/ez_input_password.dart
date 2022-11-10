import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EzInputPassword extends StatelessWidget {
  final String label;
  final String name;
  final String? passwordConfirmationValue;
  final Function? onSubmitted;
  const EzInputPassword({
    Key? key,
    required this.label,
    required this.name,
    this.onSubmitted,
  })  : passwordConfirmationValue = null,
        super(key: key);

  const EzInputPassword.confirmation(
    this.passwordConfirmationValue, {
    Key? key,
    required this.label,
    required this.name,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      key: Key(name),
      onSubmitted: (val) => onSubmitted,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        (val) {
          if (passwordConfirmationValue != null) {
            if (val != passwordConfirmationValue) {
              return 'Passwords do not match';
            }
          }
          return null;
        },
        FormBuilderValidators.minLength(6),
      ]),
      name: name,
      keyboardType: TextInputType.visiblePassword,
      autofillHints: const [AutofillHints.password],
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}
