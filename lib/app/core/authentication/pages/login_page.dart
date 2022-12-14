import 'package:auto_route/auto_route.dart';
import 'package:ez_core/ez_core.dart';
import 'package:ez_ui/ez_ui.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/app/routes/app_router.gr.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:stacked/stacked.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
        viewModelBuilder: () => AppViewModel(),
        onModelReady: (_) {},
        builder: (context, viewModel, child) {
          Widget closeButton() {
            return InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () => context.replaceRoute(const WelcomeRoute()),
              child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .primary
                          .withOpacity(0.6),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.close_rounded,
                      color: Colors.white,
                    ),
                  )),
            );
          }

          Widget formHeader() {
            return const Text(
              "Login to your Account",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            );
          }

          Widget formFooter() {
            return Column(
              children: [
                const EzText.body("Don't have an account yet?"),
                TextButton(
                    onPressed: () {
                      context.replaceRoute(
                        const RegisterClientRoute(),
                      );
                    },
                    child: const Text(
                      "REGISTER",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    )),
              ],
            );
          }

          return SafeArea(
              child: Scaffold(
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: closeButton(),
                  ),
                  floatingActionButtonLocation:
                      FloatingActionButtonLocation.startTop,
                  backgroundColor: Colors.white,
                  body: ScaffoldBodyWrapper(
                      neverScroll: true,
                      centered: true,
                      builder: (context, constraints) {
                        return SizedBox(
                          width: 500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              formHeader(),
                              vSpaceMedium,
                              _LoginForm(),
                              vSpaceMedium,
                              formFooter(),
                            ],
                          ),
                        );
                      })));
        });
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = getParentViewModel<AppViewModel>(context);

    Widget emailField() {
      return FormBuilderTextField(
        name: "email",
        // initialValue: "jane_doe@yahoo.com",
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        maxLength: 70,
        decoration: const InputDecoration(
          labelText: "Email",
          counterText: "",
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
          FormBuilderValidators.maxLength(70),
        ]),
      );
    }

    Widget passwordField() {
      return FormBuilderTextField(
        name: "password",
        //initialValue: "abc123",
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.next,
        obscureText: true,
        decoration: const InputDecoration(
          labelText: "Password",
        ),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
      );
    }

    Widget submitButton() {
      return EzButton.elevated(
        rounded: true,
        busy: viewModel.isBusy,
        title: "LOGIN",
        onTap: () async {
          await viewModel.login();
        },
      );
    }

    return FormBuilder(
      autoFocusOnValidationFailure: true,
      skipDisabled: true,
      key: viewModel.loginFormKey,
      child: Column(
        children: [
          emailField(),
          vSpaceSmall,
          passwordField(),
          vSpaceSmall,
          submitButton(),
        ],
      ),
    );
  }
}
