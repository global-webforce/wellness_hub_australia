import 'package:auto_route/auto_route.dart';
import 'package:ez_core/ez_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ServiceProviderFilterPage extends StatelessWidget {
  const ServiceProviderFilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget name() {
      return FormBuilderTextField(
        name: "name",
        keyboardType: TextInputType.name,
        autofillHints: const [AutofillHints.namePrefix],
        maxLength: 70,
        decoration:
            const InputDecoration(labelText: "Search Name", counterText: ""),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ]),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          title: const Text("Filter"),
          leading: IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: const Icon(Icons.close)),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              name(),
              vSpaceRegular,
            ],
          ),
        ),
      ],
    );
  }
}
