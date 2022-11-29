import 'package:ez_dashboard/ez_drawer_button.dart';
import 'package:stacked/stacked.dart';
import 'package:wellness_hub_australia/app/app_view_model.dart';
import 'package:wellness_hub_australia/app/shared/ui/scaffold_body_wrapper.dart';
import 'package:flutter/material.dart';

class ServiceProviderHomePage extends StatelessWidget {
  const ServiceProviderHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: ezDrawerButton(context),
          automaticallyImplyLeading: false,
          title: const Text("Dashboard"),
        ),
        body: ScaffoldBodyWrapper(
          isFullWidth: true,
          onRefresh: (() async {}),
          builder: (context, constraint) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                WelcomeCard(),
              ],
            );
          },
        ));
  }
}

class WelcomeCard extends ViewModelWidget<AppViewModel> {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context, AppViewModel viewModel) {
    return Card(
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            title: Text(
              "Welcome, ${viewModel.user?.firstName}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            subtitle: const Text(
              "Have a nice day at work",
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          )),
    );
  }
}
