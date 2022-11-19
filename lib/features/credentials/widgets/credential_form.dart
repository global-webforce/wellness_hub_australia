import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/features/credentials/viewmodels/credentials_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:stacked/stacked.dart';

class CredentialForm extends StatelessWidget {
  const CredentialForm({
    Key? key,
  }) : super(key: key);

  final textStyle = const TextStyle(fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<CredentialsViewModel>(context);
    Widget titleField() {
      return FormBuilderTextField(
        name: "title",
        autofocus: true,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        maxLength: 70,
        decoration: const InputDecoration(labelText: "Title", counterText: ""),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(70),
        ]),
      );
    }

    Widget descriptionField() {
      return FormBuilderTextField(
        name: "description",
        textInputAction: TextInputAction.next,
        maxLines: null,
        keyboardType: TextInputType.multiline,
        maxLength: 200,
        decoration:
            const InputDecoration(labelText: "Description", counterText: ""),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.maxLength(200),
        ]),
      );
    }

    Widget dateIssuedField() {
      return FormBuilderDateTimePicker(
        name: "date_issued",
        textInputAction: TextInputAction.next,
        inputType: InputType.date,
        valueTransformer: (value) {
          return value?.toIso8601String();
        },
        onChanged: (value) {},
        decoration: const InputDecoration(
            labelText: "Date Issued (If Available)",
            prefixIcon: Icon(Icons.calendar_month)),
      );
    }

    Widget attachmentField() {
      return FormBuilderImagePicker(
        name: 'attachment',
        maxImages: 1,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          FormBuilder(
            autoFocusOnValidationFailure: true,
            skipDisabled: true,
            key: viewModel.credentialFormKey,
            child: StaggeredGrid.count(
              crossAxisCount: 1,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: titleField(),
                ),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: descriptionField(),
                ),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: dateIssuedField(),
                ),
                StaggeredGridTile.fit(
                    crossAxisCellCount: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("Supporting Document"),
                        Text(
                          "Upload a clear shot of the supporting document",
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    )),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: attachmentField(),
                ),
                StaggeredGridTile.fit(
                  crossAxisCellCount: 1,
                  child: Row(
                    children: [
                      EzButton.elevated(
                        busy: viewModel.isBusy,
                        title: "Save",
                        onTap: () async {
                          await viewModel.create();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
