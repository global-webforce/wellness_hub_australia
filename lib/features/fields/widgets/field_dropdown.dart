import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:wellness_hub_australia/models/field.model.dart';

class FieldDropdown extends StatelessWidget {
  final List<Field?> fields;
  final Function onClear;
  const FieldDropdown({
    Key? key,
    required this.fields,
    required this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderDropdown(
      name: 'field_id',
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(12, 16, 0, 16),
        labelText: "Select Field",
        suffixIcon: IconButton(
          splashRadius: 15,
          constraints: const BoxConstraints(),
          onPressed: () => onClear(),
          icon: const Icon(Icons.clear),
        ),
      ),
      validator:
          FormBuilderValidators.compose([FormBuilderValidators.required()]),
      items: fields
          .map((field) => DropdownMenuItem(
                value: field!.id,
                child: Text('${field.title}'),
              ))
          .toList(),
    );
  }
}
