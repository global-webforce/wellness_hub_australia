import 'package:auto_route/auto_route.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/app.locator.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/app/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

//1. Create name/alias of custom dialog
enum BottomSheetType {
  codeVerification,
}

Future<void> setupBottomSheetUI() async {
  final bottomSheetService = locator<BottomSheetService>();

//2. Add it on builders
  final builders = {
    BottomSheetType.codeVerification: (context, sheetRequest, completer) =>
        _VerifiyMembershipCodePage(request: sheetRequest, completer: completer),
  };
  bottomSheetService.setCustomSheetBuilders(builders);
}

class _VerifiyMembershipCodePage extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  const _VerifiyMembershipCodePage(
      {Key? key, required this.request, required this.completer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
        viewModelBuilder: () => AppViewModel(),
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
              ),
              padding: EdgeInsets.fromLTRB(
                15,
                30,
                15,
                MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Center(
                child: SizedBox(
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const EzText.title1("Enter your Membership Code",
                          align: TextAlign.center),
                      const EzText.caption(
                          "This is a close community you'll need a code to proceed.",
                          align: TextAlign.center),
                      vSpaceMedium,
                      _MembershipCodeForm(),
                      vSpaceSmall,
                      TextButton(
                          onPressed: () {
                            context.router.root.pop();
                            context.router.push(const LoginRoute());
                          },
                          child: const Text(
                            "I'll comeback later",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          )),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _MembershipCodeForm extends StatelessWidget {
  final List<String> roleOptions = ['User', 'Admin'];

  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AppViewModel>(context);
    Widget inviteCodeField() {
      return FormBuilderTextField(
        name: "code",
        autofocus: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.door_sliding_outlined),
          labelText: "Membership Code",
        ),
        obscureText: true,
        obscuringCharacter: "X",
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
      );
    }

    Widget submitButton() {
      return EzButton.elevated(
        rounded: true,
        busy: viewModel.isBusy,
        title: "LET ME IN",
        onTap: () {
          viewModel.verifyCode();
        },
      );
    }

    return FormBuilder(
      autoFocusOnValidationFailure: true,
      skipDisabled: true,
      key: viewModel.registerFormKey,
      child: Column(
        children: [
          inviteCodeField(),
          vSpaceSmall,
          submitButton(),
        ],
      ),
    );
  }
}
