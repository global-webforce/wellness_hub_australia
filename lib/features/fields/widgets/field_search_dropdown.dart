import 'package:wellness_hub_australia/features/fields/viewmodels/fields_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:stacked/stacked.dart';

class FieldSearchDropdown extends StatelessWidget {
  final int? initialValue;
  final Function(int fieldId) onChanged;
  const FieldSearchDropdown({
    Key? key,
    this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FieldsViewModel>.reactive(
        viewModelBuilder: () => FieldsViewModel(),
        onModelReady: (viewModel) async {
          await viewModel.getAll();
        },
        builder: (context, viewModel, child) {
          return FormBuilderDropdown(
            name: 'field_id',
            initialValue: initialValue,
            onChanged: (fieldId) {
              onChanged(int.parse("$fieldId"));
            },
            decoration:
                const InputDecoration(prefixIcon: Icon(Icons.search_rounded)),
            allowClear: true,
            hint: const Text('Choose a Service'),
            dropdownColor: Colors.red,
            items: viewModel.fields
                .map((field) => DropdownMenuItem(
                      value: field.id,
                      child: Text('${field.title}'),
                    ))
                .toList(),
          );
        });
  }
}
