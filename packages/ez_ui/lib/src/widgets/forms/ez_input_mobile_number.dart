import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class EzInputMobileNumber extends StatelessWidget {
  final String label;
  final String name;
  final String? initialValue;
  final bool required;
  final String countryEmoji;
  final String mask;
  const EzInputMobileNumber({
    Key? key,
    required this.label,
    required this.name,
    this.initialValue,
    this.required = false,
    required this.countryEmoji,
    required this.mask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maskFormatter = MaskTextInputFormatter(
        // mask:,
        mask: mask,
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);
    return FormBuilderTextField(
      inputFormatters: [maskFormatter],
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.minLength(15, errorText: "Invalid Mobile Number"),
        FormBuilderValidators.maxLength(15, errorText: "Invalid Mobile Number"),
      ]),
      valueTransformer: (text) => maskFormatter.getUnmaskedText(),
      name: "mobile_number",
      keyboardType: TextInputType.phone,
      autofillHints: const [AutofillHints.telephoneNumber],
      decoration: InputDecoration(
          labelText: 'Mobile #',
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Text(
              countryEmoji,
              style: const TextStyle(fontSize: 30),
            ),
          )),
    );
  }
}
